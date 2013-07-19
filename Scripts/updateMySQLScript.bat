@echo Off

set drupal_mysql_db_user=%1
set drupal_mysql_db_password=%2
set drupal_admin_email=%3
set tmpdir=%4
set MySqlDir=%5
set rootPwd=%6
set drupal_mysql_port=%7
set drupal_mysql_db_name=%8
set fedora_server=%9
SHIFT
SHIFT
SHIFT
SHIFT
SHIFT
SHIFT
SHIFT
SHIFT
SHIFT
set fedora_port=%1
set drupal_mysql_db_name=%2

java -jar ComputeHash.jar %drupal_mysql_db_password% > %tmpdir%\TempKey.txt
set /p durpal_mysql_pw_hash=<%tmpdir%\TempKey.txt

cscript replace.vbs %tmpdir%\drupalInstaller.sql "${drupal_mysql_db_user}" "%drupal_mysql_db_user%"
cscript replace.vbs %tmpdir%\drupalInstaller.sql "${drupal_mysql_db_password}" "%drupal_mysql_pw_hash%"
cscript replace.vbs %tmpdir%\drupalInstaller.sql "${drupal_admin_email}" "%drupal_admin_email%"
cscript replace.vbs %tmpdir%\drupalInstaller.sql "${fedora_server}" "%fedora_server%"
cscript replace.vbs %tmpdir%\drupalInstaller.sql "${fedora_port}" "%fedora_port%"
cscript replace.vbs %tmpdir%\drupalInstaller.sql "${drupal_mysql_db_name}" "%drupal_mysql_db_name%"

%MySqlDir%\bin\mysql --port=%drupal_mysql_port% --user=root --password=%rootPwd% -e "CREATE SCHEMA %drupal_mysql_db_name%"
%MySqlDir%\bin\mysql --port=%drupal_mysql_port% --user=root --password=%rootPwd% -e "CREATE USER '%drupal_mysql_db_user%' IDENTIFIED BY '%drupal_mysql_db_password%'"
%MySqlDir%\bin\mysql --port=%drupal_mysql_port% --user=root --password=%rootPwd% -e "GRANT ALL PRIVILEGES ON %drupal_mysql_db_name%.* TO '%drupal_mysql_db_user%'"
%MySqlDir%\bin\mysql %drupal_mysql_db_name% --port=%drupal_mysql_port% --user=root --password=%rootPwd% < drupalInstaller.sql