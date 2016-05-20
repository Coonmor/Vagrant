#!/bin/bash

# Installing necessary updates
yum update -y --exclude=kernel

# Install some tools
yum install -y git nano unzip screen

#Apache
yum install -y httpd httpd-devel httpd-tools
systemctl stop httpd

rm -rf /var/www/html
ln -s /vagrant /var/www/html

systemctl enable httpd
systemctl start httpd

#PHP
yum install -y php php-devel php-mysql php-cli php-common

# Mysql
yum install -y mariadb-server
systemctl enable mariadb
systemctl start mariadb

mysql -u roo -e "SHOW DATABASES";

systemctl restart httpd