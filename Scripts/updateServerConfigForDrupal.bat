@echo Off

set ApacheTargetDir=%1
set drupal_mysql_db_server=%2
set drupal_mysql_db_name=%3
set drupal_mysql_port=%4
set drupal_mysql_db_user=%5
set drupal_mysql_db_password=%6
set PhpDir=%7
set FedoraDir=%8

cscript replace.vbs %ApacheTargetDir%\htdocs\drupal\sites\default\settings.php "${drupal_mysql_db_server}" "%drupal_mysql_db_server%"
cscript replace.vbs %ApacheTargetDir%\htdocs\drupal\sites\default\settings.php "${drupal_mysql_db_name}" "%drupal_mysql_db_name%"
cscript replace.vbs %ApacheTargetDir%\htdocs\drupal\sites\default\settings.php "${drupal_mysql_port}" "%drupal_mysql_port%"
cscript replace.vbs %ApacheTargetDir%\htdocs\drupal\sites\default\settings.php "${drupal_mysql_db_user}" "%drupal_mysql_db_user%"
cscript replace.vbs %ApacheTargetDir%\htdocs\drupal\sites\default\settings.php "${drupal_mysql_db_password}" "%drupal_mysql_db_password%"
cscript replace.vbs %PhpDir%\php.ini "${PhpDir}" "%PhpDir%"

cscript replace.vbs %FedoraDir%\server\config\filter-drupal.xml "${drupal_mysql_db_server}" "%drupal_mysql_db_server%"
cscript replace.vbs %FedoraDir%\server\config\filter-drupal.xml "${drupal_mysql_db_name}" "%drupal_mysql_db_name%"
cscript replace.vbs %FedoraDir%\server\config\filter-drupal.xml "${drupal_mysql_port}" "%drupal_mysql_port%"
cscript replace.vbs %FedoraDir%\server\config\filter-drupal.xml "${drupal_mysql_db_user}" "%drupal_mysql_db_user%"
cscript replace.vbs %FedoraDir%\server\config\filter-drupal.xml "${drupal_mysql_db_password}" "%drupal_mysql_db_password%"