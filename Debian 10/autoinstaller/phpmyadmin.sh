#!/bin/sh

# Pre-installation
cd
apt update && apt upgrade -y
apt install wget -y
apt install chwon
systemctl service nginx stop

# installing and configuring apache2
apt install apache2 -y
apt install php php-cgi php-mysqli php-pear php-mbstring php-gettext libapache2-mod-php php-common php-phpseclib php-mysql -y
apt install mariadb-server mariadb-client -y
mysql_secure_installation -Y -n -Y -Y -n -y

# installing & configuring phpMyAdmin
wget -P Downloads https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
wget -P Downloads https://files.phpmyadmin.net/phpmyadmin.keyring
cd Downloads && gpg --import phpmyadmin.keyring
mkdir /var/www/html/phpMyAdmin
cd Downloads && tar xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpMyAdmin
nano /var/www/html/phpMyAdmin/config.inc.php
$cfg['blowfish_secret'] = '';
chmod 660 /var/www/html/phpMyAdmin/config.inc.php
chown –R www-data:www-data /var/www/html/phpMyAdmin

# restarting apache2
systemctl restart apache2

print("You can now access your database under")