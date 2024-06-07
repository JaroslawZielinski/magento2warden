#!/bin/bash
################### UTILS
# Color Utils
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

# Brown/Orange
INFO='\033[0;33m'

# Green
INDEX='\033[1;36m'

# Yellow
HIGHLIGHTED='\033[1;33m'

# No Color
NC='\033[0m'
################### INPUT
##### set default values
set -a
source <(cat config.env | \
    sed -e '/^#/d;/^\s*$/d' -e "s/'/'\\\''/g" -e "s/=\(.*\)/='\1'/g")
set +a
w=bug_fix

##### read them from command line
while [ "$#" -gt 0 ]; do
  case "$1" in
    -w) w="$2"; shift 2;;

    --word=*) w="${1#*=}"; shift 1;;
    --word) echo "$1 requires an argument" >&2; exit 1;;

    -*) echo "unknown option: $1" >&2; exit 1;;
    *) handle_argument "$1"; shift 1;;
  esac
done

# to lower case
w=$(echo $w | awk '{ print tolower($0) }')

################### OUTPUT
IFS='
'
count=0
for i in `mysql -h ${HOST} -u ${USER} -p${PASSWORD} ${DB} -e "SHOW TABLES" | grep -v \`mysql -h ${HOST} -u ${USER} -p${PASSWORD} ${DB} -e "SHOW TABLES" | head -1\``
do
    for k in `mysql -h ${HOST} -u ${USER} -p${PASSWORD} ${DB} -e "DESC $i" | grep -v \`mysql -h ${HOST} -u ${USER} -p${PASSWORD} ${DB} -e "DESC $i" | head -1\` | grep -v int | awk '{print $1}'`
    do
        if [ `mysql -h ${HOST} -u ${USER} -p${PASSWORD} ${DB} -e "SELECT * FROM $i WHERE LOWER($k) LIKE '%$w%'" | wc -l` -gt 1 ]
        then
            mysql -h ${HOST} -u ${USER} -p${PASSWORD} ${DB} -e "SELECT * FROM $i WHERE LOWER($k) LIKE '%$w%';" >> "${i}-${k}.txt"
	    count=$((count+1))
        fi
    done
done
##### print summary
printf "\n\n${HIGHLIGHTED}Succes!!! About ${INDEX}$count${HIGHLIGHTED} places were found!${NC}\n";
