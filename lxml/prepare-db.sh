#!/bin/bash

IN="database.xlsx"
OUT="database.xml"
LOG=1

until [ -z "$1" ]; do

  echo Loop...

  if [ $1 = "-in" ]; then
    IN=$2
    shift
    shift
  fi

  if [ $1 = "-out" ]; then
    OUT=$2
    shift
    shift
  fi

  if [ $1 = "-log" ]; then
    LOG=$2
    shift
    shift
  fi

done

IN_dir="$IN".dir

echo IN     = $IN
echo OUT    = $OUT
echo IN_dir = $IN_dir
echo LOG    = $LOG

echo Unzipping spreadsheet...
unzip -d work/database/$IN_dir work/database/$IN

echo Processing database...
echo python3 xslt.py -in dummy.xml -xsl ./xsl/database_generator.xsl -out ./work/database/$OUT -p log_level=$LOG -p xlsx_filename=\'$IN_dir\'

python3 xslt.py -in dummy.xml -xsl ./xsl/database_generator.xsl -out ./work/database/$OUT -p log_level=$LOG -p xlsx_filename=\'$IN_dir\'

rm -rf work/database/$IN_dir

echo Database \"$OUT\" ready!

