#!/bin/bash

# Installing necessary updates
yum update -y --exclude=kernel

# Install some tools
yum install -y git nano unzip screen

#Apache
yum install -y httpd httpd-devel httpd-tools
systemctl enable httpd
systemctl stop httpd

rm -rf /var/www/http
ls -s /vagrant /var/www/http

systemctl start httpd

#PHP
yum install -y php php-devel php-mysql php-cli php-common

# Mysql
yum install -y mariadb-server
systemctl enable mariadb
systemctl start mariadb

mysql -u roo -e "SHOW DATABASES";

systemctl restart httpd
