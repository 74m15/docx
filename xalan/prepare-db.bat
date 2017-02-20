@echo off
set CP=xalan-2.7.0.jar;serializer-2.7.0.jar

set IN=%1
set OUT="database.xml"
set XSL="database_preparation.xsl"

if "%2"=="" goto SET_LOG_DEFAULT
set LOG=%2
goto GO_XSL
:SET_LOG_DEFAULT
set LOG=2

:GO_XSL
echo IN  = %IN%
echo OUT = %OUT%
echo XSL = %XSL%
echo LOG = %LOG%
java  -Xms1g -Xmx1g -classpath %CP% org.apache.xalan.xslt.Process -in %IN% -OUT %OUT% -XSL %XSL% -PARAM log-level %LOG%