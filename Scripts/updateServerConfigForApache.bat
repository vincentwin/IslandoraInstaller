@echo Off

set ApacheTargetDir=%1
set ApachePort=%2
set PhpDir=%3

cscript replace.vbs %ApacheTargetDir%\conf\httpd.conf "${ApacheTargetDir}" "%ApacheTargetDir%"
cscript replace.vbs %ApacheTargetDir%\conf\httpd.conf "${ApachePort}" "%ApachePort%"
cscript replace.vbs %ApacheTargetDir%\conf\httpd.conf "${PhpDir}" "%PhpDir%"
