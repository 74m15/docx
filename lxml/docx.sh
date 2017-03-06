#!/bin/bash

DB=database.xlsx
DB_OUT=database.xml
DOC=template.docx
DOC_OUT=new.template.docx
DUMMY=0
LOG=1

until [ -z "$1" ]; do

  echo Loop...

  if [ $1 = "-db" ]; then
    DB=$2
    shift
    shift
  fi

  if [ $1 = "-db-out" ]; then
    DB_OUT=$2
    shift
    shift
  fi
  
  if [ $1 = "-doc" ]; then
    DOC=$2
    shift
    shift
  fi
  
  if [ $1 = "-doc-out" ]; then
    DOC_OUT=$2
    shift
    shift
  fi

  if [ $1 = "-dummy" ]; then
    DUMMY=1
    shift
  fi
  
  if [ $1 = "-log" ]; then
    LOG=$2
    shift
    shift
  fi

done

DB_dir="$DB".dir

echo DB     = $DB
echo DB_OUT = $DB_OUT
echo DB_dir = $DB_dir
echo LOG    = $LOG

echo Unzipping spreadsheet...
unzip -d work/database/$DB_dir work/database/$DB

echo Processing database...
python3 xslt.py -in dummy.xml -xsl ./xsl/database_generator.xsl -out ./work/database/$DB_OUT -p log_level=$LOG -p xlsx_filename=\'$DB_dir\'

rm -rf work/database/$DB_dir

echo Database \"$DB_OUT\" ready!

DOC_OUT_dir="$DOC_OUT".dir

echo DOC         = $DOC
echo DOC_OUT     = $DOC_OUT
echo DOC_OUT_dir = $DOC_OUT_dir
echo DUMMY       = $DUMMY
echo LOG         = $LOG

echo Unzipping document...
cp work/document/$DOC work/document/$DOC_OUT
unzip -d work/document/$DOC_OUT_dir work/document/$DOC_OUT

python3 xslt.py -in dummy.xml -xsl ./xsl/document_processor.xsl -out ./work/document/$DOC_OUT_dir/word/new_document.xml \
  -p log_level=$LOG -p docx_filename=\'$DOC_OUT_dir\' -p db_filename=\'$DB_OUT\' -p dummy_fill=$DUMMY

echo Finishing document...
rm work/document/$DOC_OUT_dir/word/document.xml
mv work/document/$DOC_OUT_dir/word/new_document.xml work/document/$DOC_OUT_dir/word/document.xml

pushd work/document/$DOC_OUT_dir

zip -u ../$DOC_OUT word/document.xml

popd

rm -rf work/document/$DOC_OUT_dir

echo Document "$DOC_OUT" ready!
