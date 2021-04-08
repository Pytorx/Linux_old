# How to install phpMyAdmin on Debian 10
### What you need
- Root acces to the server
- Debian 10 (Best installed freshly)
### What you DON'T need
- Much time (10 Minutes should be enough)
- A subscription to get you deducted
- Lots of Linux experience (If you only know a bit what you're doing, it's okay. The instructions are regulating the rest.)
## The installation
### Step 1
```
cd
```

### Step 2
```
apt update && apt upgrade -y
```

### Step 3
```
apt install wget -y
```
### Step 4
```
apt install chwon
```

### Step 5
```
apt install apache2 -y
```

### Step 6
```
systemctl status apache2
```
You can escape by pressing [Ctrl + C]

### Step 7
```
apt install php php-cgi php-mysqli php-pear php-mbstring php-gettext libapache2-mod-php php-common php-phpseclib php-mysql -y
```

### Step 8
```
apt install mariadb-server mariadb-client -y
```

### Step 9
```
systemctl status mariadb
```
You can escape by pressing [Ctrl + C]

### Step 10
```
mysql_secure_installation
```
Now you should answer the follwing questions like this: <br>
1. Set root password?
* ``Y`` if you want to change it. (New password required)
* ``n`` if you want to use your root-Password. (You can change it later)
2. Remove anonymous users?
* Press ``Y`` to remove them.
3. Disallow root login remotely?
* If you don't want to control the database from the webpanel (y.ou.r.ip/phpMyAdmin), you can answer with ``Y``.
* If you want to manage the database through the webpanel, you should type in ``n``.
4. Reload privilege tables now? [Y/n]
**Type in ``Y`` to reload the privilege tables.

### Step 11
```
wget -P Downloads https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
```

### Step 12
```
wget -P Downloads https://files.phpmyadmin.net/phpmyadmin.keyring
```

### Step 13
```
cd Downloads && gpg --import phpmyadmin.keyring
```

### Step 14
```
mkdir /var/www/html/phpMyAdmin
```

### Step 15
```
cd Downloads && tar xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpMyAdmin
```

### Step 16
```
cp /var/www/html/phpMyAdmin/config.sample.inc.php /var/www/html/phpMyAdmin/config.inc.php
```

### Step 17
```
nano /var/www/html/phpMyAdmin/config.inc.php
```
```
$cfg['blowfish_secret'] = '';
```

### Step 18
```
chmod 660 /var/www/html/phpMyAdmin/config.inc.php
```

### Step 19
```
chown –R www-data:www-data /var/www/html/phpMyAdmin
```

### Step 20
```
systemctl restart apache2
```

### Step 21
Now you can access to phpMyAdmin under ``http://y.o.u.r.ip/phpMyAdmin``. <br>

### Step 22 (The most important one)
Have fun with your new phpMyAdmin Database! <br>
