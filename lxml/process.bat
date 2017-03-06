@echo off

set IN=template.docx
set OUT=new.template.docx
set DB=database.xml
set DUMMY=0
set LOG=1

:parse_args
if "%1"=="-in" goto set_in
if "%1"=="-out" goto set_out
if "%1"=="-db" goto set_db
if "%1"=="-dummy" goto set_dummy
if "%1"=="-log" goto set_log
goto GO_XSL

:set_in
set IN=%2
shift
shift
goto parse_args

:set_out
set OUT=%2
shift
shift
goto parse_args

:set_db
set DB=%2
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
set OUT_dir=%OUT%.dir

echo IN     = %IN%
echo OUT    = %OUT%
echo DUMMY  = %DUMMY%
echo LOG    = %LOG%

echo Unzipping document...
cp work\document\%IN% work\document\%OUT%
unzip -d work\document\%OUT_dir% work\document\%OUT%

echo Processing document...
set ARGS_1=-in dummy.xml -xsl ./xsl/document_processor.xsl -out "./work/document/%OUT_dir%/word/new_document.xml"
set ARGS_2=-p log_level=%LOG% -p docx_filename='%OUT_dir%' -p db_filename='%DB%' -p dummy_fill=%DUMMY%
python xslt.py %ARGS_1% %ARGS_2%

echo Finishing document...
rm work/document/%OUT_dir%/word/document.xml
mv work/document/%OUT_dir%/word/new_document.xml work/document/%OUT_dir%/word/document.xml

pushd work\document\%OUT_dir%

zip -u ..\%OUT% word\document.xml

popd

rm -rf work/document/%OUT_dir%

echo Document "%OUT%" ready!
