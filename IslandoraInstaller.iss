; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Islandora"
#define MyAppVersion "6.x-12.2.0"
#define MyAppExeName "islandora_setup.exe"

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
AppPublisher=Vincent Nguyen
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
Name: custom; Description: "Custom Installation (not recommended)"; Flags: iscustom;

[Components]
Name: apache; Description: "Apache"; Flags: checkablealone; Types: full;
Name: drupal; Description: "Drupal"; Flags: checkablealone; Types: full;
Name: mysql; Description: "MySQL"; Types: full;
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
;Source: "ApacheHTTP\*"; DestDir: "{#ApacheTargetDir}"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: apache;
Source: "Scripts\*"; DestDir: "{tmp}"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: apache mysql;
Source: "MySQL\*"; DestDir: "{tmp}"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: mysql;

[Run]
;Filename: "{#ApacheTargetDir}\bin\httpd"; Parameters: "-k install -n ""{#ApacheServiceName}"""; Flags: runhidden; Components: apache;
;Filename: "{tmp}\updateServerConfigForApache.bat"; Parameters: "{#ApacheTargetDir} {#ApachePort} {#PhpDir}"; Components: apache;
;Filename: "{tmp}\updateServerConfigForDrupal.bat"; Parameters: "{#ApacheTargetDir} {#drupal_mysql_db_server} {#drupal_mysql_db_name} {#drupal_mysql_port} {#drupal_mysql_db_user} {#drupal_mysql_db_password} {#PhpDir} {#FedoraDir}"; Components: drupal;

Filename: msiexec.exe; Parameters: "/i {tmp}\mysql-5.5.27-winx64.msi /quiet /l*v mysql_install_log.txt INSTALLDIR=""{#MySqlDir}"""; Flags: runascurrentuser; Components: mysql;
Filename: "{#MySqlDir}\bin\MySQLInstanceConfig.exe"; Parameters: "-i -q ""-l{#MySqlDir}\mysql_configure_log.txt"" ""-nMySQL Server 5.5"" ""-p{#MySqlDir}"" -v5.5.27 ""-t{#MySqlDir}\my-template.ini"" ""-c{#MySqlDir}\fedoraconfig.ini"" ServerType=DEDICATED DatabaseType=MIXED ConnectionUsage=DSS Port={#drupal_mysql_port} ServiceName={#MySqlServiceName} RootPassword={#rootPwd}"; Flags: runhidden; Components: mysql;
Filename: "{tmp}\updateMySQLScript.bat"; Parameters: "{#drupal_mysql_db_user} {#drupal_mysql_db_password} {#drupal_admin_email} {tmp} {#MySqlDir} {#rootPwd} {#drupal_mysql_port} {#drupal_mysql_db_name}"; Components: mysql drupal;

Filename: "{cmd}"; Parameters: "/C ""sc start {#ApacheServiceName}"""; Components: apache;
Filename: "{cmd}"; Parameters: "/C ""sc start {#MySqlServiceName}"""; Components: mysql;

[UninstallRun]
Filename: "{cmd}"; Parameters: "/C ""sc stop {#ApacheServiceName}"""; Components: apache;
Filename: "{cmd}"; Parameters: "/C ""sc stop {#MySqlServiceName}"""; Components: mysql;
Filename: "{#ApacheTargetDir}\bin\httpd"; Parameters: "-k uninstall -n ""{#ApacheServiceName}"""; Components: apache;
Filename: "{cmd}"; Parameters: "/C ""sc delete {#MySqlServiceName}"""; Components: mysql;

[UninstallDelete]
Type: files; Name: "{#ApacheTargetDir}\*"; Components: apache;
Type: files; Name: "{#MySqlDir}\*"; Components: mysql;
