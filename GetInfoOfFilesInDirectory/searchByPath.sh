#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Please use $0 <DIRECTORY> <DATETIME> <OUT_CSV_FILE_NAME>"
  exit 1
fi

DIRECTORY="$1"
DATETIME="$2"
OUT_CSV_FILE_NAME="$3"
pattern="^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}$"

if [[ ! $DATETIME =~ $pattern ]]; then
  echo "Please use 'YYYY-MM-DD HH:MM:SS' format."
  exit 1
fi

countFileLines() {
    local pathF="$1"
    wc -l < "$pathF"
}

find "$DIRECTORY" -type f -name "*.txt" -newermt "$DATETIME" | while read -r line; do
    echo "$line"
    dateScan=$(date +"%Y-%m-%d %T")
    pathFile=$(realpath "$line")
    nameFile=$(basename "$line")
    dateModif=$(date -r "$line" +"%Y-%m-%d %T")
    lastAccessed=$(date -r $(stat -f "%c" "$line") +"%Y-%m-%d %T")
    filesizeBytes=$(stat -f "%z" "$line")
    filesizeMb=$(echo "scale=2; $filesizeBytes / 1024 / 1024" | bc)
    cntLines=$(countFileLines "$line")

    echo "$dateScan, $pathFile, $nameFile, $dateModif, $lastAccessed, $filesizeMb, $cntLines" >> "$OUT_CSV_FILE_NAME"
done

# Rifat
# Autumn 2023
