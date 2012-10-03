@echo Off

set TomcatDir=%1
set fedora_server=%2
set fedora_port=%3
set fedora_user=%4
set fedora_password=%5
set FedoraDir=%6

cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\fedoragsearch.properties "${TomcatDir}" "%TomcatDir%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\fedoragsearch.properties "${fedora_server}" "%fedora_server%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\fedoragsearch.properties "${fedora_port}" "%fedora_port%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\fedoragsearch.properties "${fedora_user}" "%fedora_user%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\fedoragsearch.properties "${fedora_password}" "%fedora_password%"

cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\repository\gsearch_solr\repository.properties "${FedoraDir}" "%TomcatDir%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\repository\gsearch_solr\repository.properties "${fedora_server}" "%fedora_server%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\repository\gsearch_solr\repository.properties "${fedora_port}" "%fedora_port%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\repository\gsearch_solr\repository.properties "${fedora_user}" "%fedora_user%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\repository\gsearch_solr\repository.properties "${fedora_password}" "%fedora_password%"

cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\index\gsearch_solr\index.properties "${FedoraDir}" "%FedoraDir%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\index\gsearch_solr\index.properties "${fedora_server}" "%fedora_server%"
cscript replace.vbs %TomcatDir%\webapps\fedoragsearch\WEB-INF\classes\config\index\gsearch_solr\index.properties "${fedora_port}" "%fedora_port%"

cscript replace.vbs %TomcatDir%\webapps\fedora\WEB-INF\web.xml "${FedoraDir}" "%FedoraDir%"

cscript replace.vbs %TomcatDir%\conf\Catalina\localhost\solr.xml "${FedoraDir}" "%FedoraDir%"
cscript replace.vbs %FedoraDir%\gsearch_solr\solr\conf\solrconfig.xml "${FedoraDir}" "%FedoraDir%"