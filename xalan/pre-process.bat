@echo off
set CP=xalan-2.7.0.jar;serializer-2.7.0.jar

set IN="Nota_Integrativa_2015.0.1.xml"
set OUT="Xalan.Intermediate.xml"
set XSL="document-preprocessor.xsl"
set LOG=2

:parse_args
if "%1"=="-in" goto set_in
if "%1"=="-out" goto set_out
if "%1"=="-xsl" goto set_xsl
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

:set_log
set LOG=%2
shift
shift
goto parse_args

:GO_XSL
echo IN  = %IN%
echo OUT = %OUT%
echo XSL = %XSL%
echo LOG = %LOG%
java -classpath %CP% org.apache.xalan.xslt.Process -in %IN% -OUT %OUT% -XSL %XSL% -PARAM log-level %LOG%