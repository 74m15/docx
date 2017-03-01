@echo off

set IN="database.xlsx"
set OUT="database.xml"
set LOG=1

:parse_args
if "%1"=="-in" goto set_in
if "%1"=="-out" goto set_out
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

:set_log
set LOG=%2
shift
shift
goto parse_args

:GO_XSL
set IN_dir=%IN%.dir

echo IN     = %IN%
echo OUT    = %OUT%
echo IN_dir = %IN_dir%
echo LOG    = %LOG%

@echo on

echo Unzipping spreadsheet...
unzip -d work\database\%IN_dir% work\database\%IN%

echo Processing database...
set ARGS_1=-in dummy.xml -xsl xsl/database_generator.xsl -out work/database/%OUT%
set ARGS_2=-p log_level=%LOG% -p xlsx_filename='%IN_dir%'
python xslt.py %ARGS_1% %ARGS_2%

rm -rf work/database/%IN_dir%

echo Database "database.xml" ready!
