@echo off

set IN="template.docx"
set DUMMY=0
set LOG=1

:parse_args
if "%1"=="-in" goto set_in
if "%1"=="-dummy" goto set_dummy
if "%1"=="-log" goto set_log
goto GO_XSL

:set_in
set IN=%2
shift
shift
goto parse_args

:set_dummy
set DUMMY=1
shift
goto parse_args

:set_log
set LOG=%2
shift
shift
goto parse_args

:GO_XSL
set IN_new=new.%IN%
set IN_new_dir=%IN_new%.dir

echo IN     = %IN%
echo IN_new = %IN_new%
echo DUMMY  = %DUMMY%
echo LOG    = %LOG%

echo Unzipping document...
cp %IN% %IN_new%
unzip -d %IN_new_dir% %IN_new%

echo Processing document...
set ARGS_1=-in dummy.xml -xsl document_processor.xsl -out ./%IN_new_dir%/word/new_document.xml
set ARGS_2=-p log_level=%LOG% -p base_dir='./%IN_new_dir%/word/' -p dummy_fill=%DUMMY%
python xslt.py %ARGS_1% %ARGS_2%

echo Finishing document...
rm ./%IN_new_dir%/word/document.xml
mv ./%IN_new_dir%/word/new_document.xml ./%IN_new_dir%/word/document.xml

pushd %IN_new_dir%

zip -u  ..\%IN_new% word\document.xml

popd

rm -rf %IN_new_dir%

echo Document "%IN_new%" ready!
