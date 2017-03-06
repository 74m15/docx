@echo off

set DB=database.xlsx
set DB_OUT=database.xml
set DOC=template.docx
set DOC_OUT=new.template.docx
set DUMMY=0
set LOG=1

:parse_args
if "%1"=="-db" goto set_db
if "%1"=="-doc" goto set_doc
if "%1"=="-out" goto set_out
if "%1"=="-dummy" goto set_dummy
if "%1"=="-log" goto set_log
goto GO_XSL

:set_db
set DB=%2
shift
shift
goto parse_args

:set_doc
set DOC=%2
shift
shift
goto parse_args

:set_out
set DOC_OUT=%2
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
set DB_dir=%DB%.dir

echo DB     = %DB%
echo DB_OUT = %DB_OUT%
echo DB_dir = %DB_dir%
echo LOG    = %LOG%
echo.
echo Unzipping spreadsheet...
unzip -d work\database\%DB_dir% work\database\%DB%
echo.
echo Processing database...
set ARGS_1=-in dummy.xml -xsl xsl/database_generator.xsl -out work/database/%DB_OUT%
set ARGS_2=-p log_level=%LOG% -p xlsx_filename='%DB_dir%'
python xslt.py %ARGS_1% %ARGS_2%

rm -rf work/database/%DB_dir%
echo.
echo Database "database.xml" ready!

set DOC_OUT_dir=%DOC_OUT%.dir
echo.
echo DOC     = %DOC%
echo DOC_OUT = %OUT%
echo DUMMY   = %DUMMY%
echo LOG     = %LOG%
echo.
echo Unzipping document...
cp work\document\%DOC% work\document\%DOC_OUT%
unzip -d work\document\%DOC_OUT_dir% work\document\%DOC_OUT%
echo.
echo Processing document...
set ARGS_1=-in dummy.xml -xsl ./xsl/document_processor.xsl -out "./work/document/%DOC_OUT_dir%/word/new_document.xml"
set ARGS_2=-p log_level=%LOG% -p docx_filename='%DOC_OUT_dir%' -p db_filename='%DB_OUT%' -p dummy_fill=%DUMMY%
python xslt.py %ARGS_1% %ARGS_2%
echo.
echo Finishing document...
rm work/document/%DOC_OUT_dir%/word/document.xml
mv work/document/%DOC_OUT_dir%/word/new_document.xml work/document/%DOC_OUT_dir%/word/document.xml

pushd work\document\%DOC_OUT_dir%

zip -u ..\%DOC_OUT% word\document.xml

popd

rm -rf work/document/%DOC_OUT_dir%

echo.
echo Document "%DOC_OUT%" ready!
