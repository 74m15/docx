#!/bin/bash

IN="template.docx"
OUT="new.template.docx"
DB="database.xml"
DUMMY=0
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

  if [ $1 = "-db" ]; then
    DB=$2
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

OUT_dir="$OUT".dir

echo IN     = $IN
echo OUT    = $OUT
echo OUT_dir= $OUT_dir
echo DB     = $DB
echo DUMMY  = $DUMMY
echo LOG    = $LOG

echo Unzipping document...
cp work/document/$IN work/document/$OUT
unzip -d work/document/$OUT_dir work/document/$OUT

echo Processing document...
V1=./work/document/$OUT_dir/word/new_document.xml
V2=docx_filename=\'$OUT_dir\'
V3=db_filename=\'$DB\'

echo V1=$V1
echo V2=$V2
echo V3=$V3

python3 xslt.py -in dummy.xml -xsl ./xsl/document_processor.xsl -out ./work/document/$OUT_dir/word/new_document.xml -p log_level=$LOG -p docx_filename=\'$OUT_dir\' -p db_filename=\'$DB\' -p dummy_fill=$DUMMY

echo Finishing document...
rm work/document/$OUT_dir/word/document.xml
mv work/document/$OUT_dir/word/new_document.xml work/document/$OUT_dir/word/document.xml

pushd work/document/$OUT_dir

zip -u ../$OUT word/document.xml

popd

rm -rf work/document/$OUT_dir

echo Document "$OUT" ready!

