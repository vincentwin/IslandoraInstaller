@echo Off

set TomcatDir=%1

cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\rest\demoBrowseIndexToHtml.xslt "${TomcatDir}" "%TomcatDir%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\rest\demoGetIndexInfoToHtml.xslt "${TomcatDir}" "%TomcatDir%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\rest\demoGetRepositoryInfoToHtml.xslt "${TomcatDir}" "%TomcatDir%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\rest\demoGfindObjectsToHtml.xslt "${TomcatDir}" "%TomcatDir%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\rest\demoUpdateIndexToHtml.xslt "${TomcatDir}" "%TomcatDir%"