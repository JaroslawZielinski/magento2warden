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
db=magento
cfg=config.cnf
w=bug_fix

##### read them from command line
while [ "$#" -gt 0 ]; do
  case "$1" in
    -db) db="$2"; shift 2;;
    -cfg) cfg="$2"; shift 2;;
    -w) w="$2"; shift 2;;

    --data-base=*) db="${1#*=}"; shift 1;;
    --config-file=*) cfg="${1#*=}"; shift 1;;
    --word=*) w="${1#*=}"; shift 1;;
    --data-base|--config-file|--word) echo "$1 requires an argument" >&2; exit 1;;

    -*) echo "unknown option: $1" >&2; exit 1;;
    *) handle_argument "$1"; shift 1;;
  esac
done

##### validation and reformat of input
if [ ! -f $cfg ];
then
  echo "The config file is not there $cfg" >&2
  exit 1
fi

# to lower case
w=$(echo $w | awk '{ print tolower($0) }')

################### OUTPUT
IFS='
'
count=0
for i in `mysql --defaults-extra-file=$cfg $db -e "SHOW TABLES" | grep -v \`mysql --defaults-extra-file=$cfg $db -e "SHOW TABLES" | head -1\``
do
    for k in `mysql --defaults-extra-file=$cfg $db -e "DESC $i" | grep -v \`mysql --defaults-extra-file=$cfg $db -e "DESC $i" | head -1\` | awk '{print $1}'`
    do
        if [[ "customer_id" == "$k" ]]; then
            echo "$i - $k";
            count=$((count+1))
	    fi
    done
done
##### print summary
printf "\n\n${HIGHLIGHTED}Succes!!! About ${INDEX}$count${HIGHLIGHTED} places were found!${NC}\n";
