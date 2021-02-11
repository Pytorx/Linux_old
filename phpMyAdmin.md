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
Make sure (with this command) that you are in the home directory, otherwise errors may occur.
```
cd
```

### Step 2
Now we are in the home directory. To ensure that the operating system is up-to-date, we need the following command:
```
apt update && apt upgrade -y
```
Depending on when the operating system was last updated and the performance of the server, it can take up to 5 minutes.

### Step 3
It is used to download and unpack other programs like phpMyAdmin. This saves us the usual download, the subsequent unpacking and dragging onto a server.
```
apt install wget -y
```
### Step 4
Install chwon. We will need it later.
```
apt install chwon
```

### Step 5
Now we are ready to install Apache2, the webserver for phpMyAdmin.
```
apt install apache2 -y
```

### Step 6
Let's check the status of the web server (Apache2).
```
systemctl status apache2
```
If the output is displayed this way we can see on the screenshot, everything is right. <br>
![Loading...](https://media.discordapp.net/attachments/577732760748163092/809412397587496990/unknown.png) <br>
You can escape by pressing [Ctrl + C]

### Step 7
Now it's time to install php, otherwise phpMyAdmin wouldn't work. Logical. It's written in php.
```
apt install php php-cgi php-mysqli php-pear php-mbstring php-gettext libapache2-mod-php php-common php-phpseclib php-mysql -y
```

### Step 8
The next step is to install MariaDB. This is what we do with the following command:
```
apt install mariadb-server mariadb-client -y
```

### Step 9
Now let's also look at MariaDB's status to check that everything worked out.
```
systemctl status mariadb
```
The output should look like this: <br>
![Loading...](https://media.discordapp.net/attachments/577732760748163092/809414436241801236/unknown.png?width=1200&height=207) <br>
You can escape by pressing [Ctrl + C]

### Step 10
Installing the actual MySQL database is now imminent. To do this, we use the following command:
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
Now your MariaDB is secure.

### Step 11
Download phpMyAdmin using the tool wget, installed earlier.
```
wget -P Downloads https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
```
The files are now downloaded to the downloads-folder. Feel free to specify a specific path.

### Step 12
To verify the GPG key for phpMyAdmin, download the phpMyAdmin keyring to the Downloads directory:
```
wget -P Downloads https://files.phpmyadmin.net/phpmyadmin.keyring
```

### Step 13
Go to the downloads directory and import the keyring:
```
cd Downloads && gpg --import phpmyadmin.keyring
```

### Step 14
Now create a directory for phpMyAdmin in the apache2 web directory:
```
mkdir /var/www/html/phpMyAdmin
```

### Step 15
Now access the downloads directory and unzip the downloaded phpMyAdmin files to the neewly created /phpMyAdmin web-directory:
```
cd Downloads && tar xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpMyAdmin
```

### Step 16
Now create a default config file:
```
cp /var/www/html/phpMyAdmin/config.sample.inc.php /var/www/html/phpMyAdmin/config.inc.php
```

### Step 17
Now open the config.inc.php file in the nano texteditor.
```
nano /var/www/html/phpMyAdmin/config.inc.php
```
Locate the following line...
```
$cfg['blowfish_secret'] = '';
```
... and add a secret passphrase. Now you can exit and save the file with [Ctrl + x]

### Step 18
Change the permission for the config.inc.php file:
```
chmod 660 /var/www/html/phpMyAdmin/config.inc.php
```

### Step 19
Changing the Ownership of the phpMyAdmin directory:
```
chown –R www-data:www-data /var/www/html/phpMyAdmin
```

### Step 20
Restart apache to apply the settings:
```
systemctl restart apache2
```

### Step 21
Now you can access to phpMyAdmin under ``http://y.o.u.r.ip/phpMyAdmin``. <br>
If the password or user is false for some reason, you can reset it. A tutorial is in the wiki. <br>
If there are errors during the installation or questions arise, I am available. <br>

### Step 22 (The most important one)
Have fun with your new phpMyAdmin Database! <br>
![Loading...](https://media.discordapp.net/attachments/577732760748163092/809426866464751656/unknown.png)
