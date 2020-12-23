#!/bin/bash
#This script should remove your Bookstack install. 
#This script is experimental and no guarantees are made. 

echo "This uninstall script is catastrophic." 
echo "Do not continue if have other sites and/or services running."
echo "This script will completely remove nginx and mysql."
read -p "Do you want to continue?" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then

# Stopping services

service mysql stop
service nginx stop
service php7.3-fpm stop

# Removing pkgs

apt-get --purge remove -y nginx php7.3 php7.3-cgi php7.3-curl \
php7.3-cli php7.3-ldap php7.3-fpm php7.3-tidy php-pclzip php7.3-gd \
php7.3-mysql mariadb-server-10.3 mcrypt libmcrypt-dev php-pear \
mcrypt php7.3-mbstring
apt-get -y --purge autoremove

# Removing artifacts

sed -i '/^www-data/d' /etc/sudoers
rm -rf /usr/share/php && rm -rf /var/www/
deluser www-data

fi
