# How to Execute Scripts

There are three scripts available:
- `wordFinder.sh`
- `idFinder.sh`
- `structureFinder.sh`

## wordFinder

**Example Usage:**
```bash
./wordFinder.sh --word="This is a test"
```

The `--word="<word or sentence>"` option will locate all occurrences of the specified **word** as a value anywhere in the database. Each table and column will be searched using a `LIKE '%word%'` statement. If the word is found, a file will be created in the format `tablename_columnfound.txt`.

**Note:**
When searching for an object of a class, such as `widget` in the content of a CMS page (e.g., `Magento\Cms\Block\Widget\Block`), you should replace `\` and `\\` with `%`:
```bash
./wordFinder.sh --word="Magento%Cms%Block%Widget%Block"
```

## idFinder

**Example Usage:**
```bash
./idFinder.sh --word=1234
```

This script will find all instances where a column value matches the specified **number** (e.g., IDs). Each table and column will be searched using the `= word` statement. If the number is found, a file will be created in the format `tablename_columnfound.txt`.

## structureFinder

**Example Usage:**
```bash
./structureFinder.sh --word=entity_id
```

This script will identify the name of the column among tables in the database. The results will be printed out without creating any files.
