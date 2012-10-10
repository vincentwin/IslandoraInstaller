;    Copyright (C) 2012 Vincent Nguyen
;
;    This program is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 3 of the License, or
;    (at your option) any later version.
;
;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with this program.  If not, see <http://www.gnu.org/licenses/>.
;

#define MyAppName "Islandora Installer"
#define MyAppVersion "6.x-12.2.0"
#define MyAppExeName "islandora_setup.exe"
#define AppAuthor "Vincent Nguyen"

; source directories
#define PhpDir "{ini:{src}\islandora_app.ini, Directories, PhpDir}"
#define TomcatDir "{ini:{src}\islandora_app.ini, Directories, TomcatDir}"
#define ApacheTargetDir "{ini:{src}\islandora_app.ini, Directories, ApacheTargetDir}"
#define MySqlDir "{ini:{src}\islandora_app.ini, Directories, MySqlDir}"

; environment properties
#define envID "{ini:{src}\islandora_app.ini, Environment, env}"
#define ApacheServiceName "{ini:{src}\islandora_app.ini, Environment, ApacheServiceName}"
#define TomcatServiceName "{ini:{src}\islandora_app.ini, Environment, TomcatServiceName}"
#define ApachePort "{ini:{src}\islandora_app.ini, Environment, ApachePort}"
#define MySqlServiceName "{ini:{src}\islandora_app.ini, Environment, MySqlServiceName}"

; drupal/mysql
#define drupal_mysql_db_server "{ini:{src}\islandora_app.ini, drupal, drupal_mysql_db_server}"
#define drupal_mysql_db_name "{ini:{src}\islandora_app.ini, drupal, drupal_mysql_db_name}"
#define drupal_mysql_port "{ini:{src}\islandora_app.ini, drupal, drupal_mysql_port}"
#define drupal_mysql_db_user "{ini:{src}\islandora_app.ini, drupal, drupal_mysql_db_user}"
#define drupal_mysql_db_password "{ini:{src}\islandora_app.ini, drupal, drupal_mysql_db_password}"
#define drupal_admin_email "{ini:{src}\islandora_app.ini, drupal, drupal_admin_email}"
#define rootPwd "{ini:{src}\islandora_app.ini, drupal, rootPwd}"

; fedora
#define fedora_server "{ini:{src}\islandora_app.ini, fedora, fedora_server}"
#define fedora_port "{ini:{src}\islandora_app.ini, fedora, fedora_port}"
#define fedora_user "{ini:{src}\islandora_app.ini, fedora, fedora_user}"
#define fedora_password "{ini:{src}\islandora_app.ini, fedora, fedora_password}"
#define FedoraDir "{ini:{src}\islandora_app.ini, Directories, FedoraDir}"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{86EE9C86-57EE-40A6-AC45-E95A5C9599C4}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#AppAuthor}
CreateAppDir=no
LicenseFile=LICENSE.txt
InfoBeforeFile=INFO.txt
InfoAfterFile=FEEDBACK.txt
OutputDir=Output
OutputBaseFilename=islandora_setup
Compression=lzma
SolidCompression=yes

[Types]
Name: full; Description: "Full Installtion";
Name: custom; Description: "Custom (Uncheck installed items)"; Flags: iscustom;

[Components]
Name: apache; Description: "Apache"; Types: full;
Name: drupal; Description: "Drupal"; Types: full;
Name: php; Description: "PHP"; Types: full;
;Name: mysql; Description: "MySQL"; Types: full;
Name: islandora; Description: "Islandora"; Flags: checkablealone; Types: full;


[Code]
function InitializeSetup(): Boolean;
var errorMsg :String;
begin
  errorMsg := '';
  if Length(ExpandConstant('{ini:{src}\islandora_app.ini, Environment, env}')) = 0 then
  begin
    MsgBox('Please provide islandora_app.ini file', mbError, mb_Ok);
  end else
  begin
    Result := True;
  end;
end;

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl";

[Files]
Source: "ApacheHTTP\*"; DestDir: "{#ApacheTargetDir}"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: apache;
Source: "Drupal\*"; DestDir: "{#ApacheTargetDir}\htdocs\drupal"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: drupal;
Source: "Scripts\*"; DestDir: "{tmp}"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: apache;
; Source: "MySQL\*"; DestDir: "{tmp}"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: mysql;
Source: "ConfigFiles\*"; DestDir: "{tmp}"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: islandora apache drupal;
Source: "Islandora\*"; DestDir: "{tmp}"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: islandora;
Source: "{tmp}\httpd.conf.{#envID}"; DestDir: "{#ApacheTargetDir}\conf"; DestName:"httpd.conf"; Flags: ignoreversion external; Components: apache;
Source: "PHP\*"; DestDir: "{#PhpDir}"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: php drupal;
; Backup Fedora's web.xml and copy new web.xml
Source: "{#TomcatDir}\webapps\fedora\WEB-INF\web.xml"; DestDir: "{#TomcatDir}\webapps\fedora\WEB-INF\"; DestName:"web.xml.backup"; Flags: ignoreversion external; Components: islandora;
Source: "{tmp}\web.xml"; DestDir: "{#TomcatDir}\webapps\fedora\WEB-INF"; Flags: ignoreversion external; Components: islandora;
; Islandora files
Source: "{tmp}\filter-drupal.xml"; DestDir: "{#FedoraDir}\server\config"; Flags: ignoreversion external; Components: islandora;
Source: "{tmp}\DrupalFilter3.4.jar"; DestDir: "{#TomcatDir}\webapps\fedora\WEB-INF\lib"; Flags: ignoreversion external; Components: islandora;
Source: "{tmp}\permit-apim-to-authenticated.xml"; DestDir: "{#FedoraDir}\data\fedora-xacml-policies\repository-policies\default"; Flags: ignoreversion external; Components: islandora;
; SOLR / Gsearch
Source: "GsearchSolr\*"; DestDir: "{#FedoraDir}\gsearch_solr"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: islandora;
Source: "{tmp}\apache-solr-1.4.1.war"; DestDir: "{#FedoraDir}\gsearch_solr"; Flags: ignoreversion external; Components: islandora;
Source: "{tmp}\genericsearch-2.2\*"; DestDir: "{#TomcatDir}\webapps"; Flags: ignoreversion createallsubdirs recursesubdirs external; Components: islandora;
Source: "{tmp}\solr.xml"; DestDir: "{#TomcatDir}\conf\Catalina\localhost"; Flags: ignoreversion external; Components: islandora;

[Run]
Filename: "{#ApacheTargetDir}\bin\httpd"; Parameters: "-k install -n ""{#ApacheServiceName}"""; Flags: runhidden; Components: apache;
Filename: "{tmp}\updateServerConfigForApache.bat"; Parameters: "{#ApacheTargetDir} {#ApachePort} {#PhpDir}"; Components: apache;
Filename: "{tmp}\updateServerConfigForDrupal.bat"; Parameters: "{#ApacheTargetDir} {#drupal_mysql_db_server} {#drupal_mysql_db_name} {#drupal_mysql_port} {#drupal_mysql_db_user} {#drupal_mysql_db_password} {#PhpDir} {#FedoraDir}"; Components: drupal;
Filename: "{tmp}\updateServerConfigForFedora.bat"; Parameters: "{#TomcatDir} {#fedora_server} {#fedora_port} {#fedora_user} {#fedora_password} {#FedoraDir}"; Components: islandora;
Filename: "{tmp}\updateServerConfigXslt.bat"; Parameters: "{#TomcatDir}"; Components: islandora;
; Filename: "msiexec.exe"; Parameters: "/i {tmp}\mysql-5.5.27-winx64.msi /quiet /l*v mysql_install_log.txt INSTALLDIR=""{#MySqlDir}"""; Flags: runascurrentuser; Components: mysql;
; Filename: "{#MySqlDir}\bin\MySQLInstanceConfig.exe"; Parameters: "-i -q ""-l{#MySqlDir}\mysql_configure_log.txt"" ""-nMySQL Server 5.5"" ""-p{#MySqlDir}"" -v5.5.27 ""-t{#MySqlDir}\my-template.ini"" ""-c{#MySqlDir}\fedoraconfig.ini"" ServerType=DEDICATED DatabaseType=MIXED ConnectionUsage=DSS Port={#drupal_mysql_port} ServiceName={#MySqlServiceName} RootPassword={#rootPwd}"; Flags: runhidden; Components: mysql;
Filename: "{tmp}\updateMySQLScript.bat"; Parameters: "{#drupal_mysql_db_user} {#drupal_mysql_db_password} {#drupal_admin_email} {tmp} {#MySqlDir} {#rootPwd} {#drupal_mysql_port} {#drupal_mysql_db_name}"; Components: drupal;
; Start services
Filename: "{cmd}"; Parameters: "/C ""sc start {#ApacheServiceName}"""; Components: apache;
; Filename: "{cmd}"; Parameters: "/C ""sc start {#MySqlServiceName}"""; Components: mysql;

[UninstallRun]
Filename: "{cmd}"; Parameters: "/C ""sc stop {#ApacheServiceName}"""; Components: apache;
; Filename: "{cmd}"; Parameters: "/C ""sc stop {#MySqlServiceName}"""; Components: mysql;
Filename: "{#ApacheTargetDir}\bin\httpd"; Parameters: "-k uninstall -n ""{#ApacheServiceName}"""; Components: apache;
; Filename: "{cmd}"; Parameters: "/C ""sc delete {#MySqlServiceName}"""; Components: mysql;

[UninstallDelete]
Type: files; Name: "{#ApacheTargetDir}\htdocs\drupal"; Components: drupal;
Type: files; Name: "{#ApacheTargetDir}\*"; Components: apache;
Type: files; Name: "{#PhpDir}\*"; Components: php;
