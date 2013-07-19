Contributors: Vincent Nguyen
Description: This Islandora Installer will install PHP, Apache, Drupal, and Islandora on Windows

    Copyright (C) 2012 Vincent Nguyen

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

------------------------------------------------------------------------------------



Version Stack
-------------------
Drupal 6.26
Islandora 6.x-12.2.0
MySQL 5.5.16
PHP 5.3.13
ApacheHTTP 2.2.21
Fedora 3.4.2
SOLR 1.4.1
Gsearch 2.2



WARNING: Backup all files before running installer (mainly TOMCAT_HOME and FEDORA_HOME directories).



Prerequisites
-------------------
1. Install Fedora.  Instructions on installing Fedora are here: https://wiki.duraspace.org/display/ISLANDORA6122/Installing+Fedora
2. Install MySQL. 

Islandora
-------------------
3. Define islandora_app.ini file
4. Run Installer
5. Change default Drupal admin user and password.  Also change this in drupalFilter
6. Go to Drupal Admin, install Islandora Core Content Models


Troubleshooting
-------------------
Make sure JMS Messaging is enabled on fedora.fcfg

