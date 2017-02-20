@echo off
set CP=xalan-2.7.0.jar;serializer-2.7.0.jar

set IN="Xalan.Intermediate.xml"
set OUT="Xalan.Final.xml"
set XSL="document-processor.xsl"
set LOG=2
set DUMMY=true

:parse_args
if "%1"=="-in" goto set_in
if "%1"=="-out" goto set_out
if "%1"=="-xsl" goto set_xsl
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

:set_xsl
set IN=%2
shift
shift
goto parse_args

:set_dummy
set DUMMY=%2
shift
shift
goto parse_args

:set_log
set LOG=%2
shift
shift
goto parse_args

:GO_XSL
echo IN    = %IN%
echo OUT   = %OUT%
echo XSL   = %XSL%
echo DUMMY = %DUMMY%
echo LOG   = %LOG%
echo on

java -classpath %CP% org.apache.xalan.xslt.Process -in %IN% -OUT %OUT% -XSL %XSL% -PARAM log-level %LOG% -PARAM dummy-fill %DUMMY%
pause