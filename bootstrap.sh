#!/bin/bash

echo "Provisioning virtual machine..."

apt-get install debconf-utils -y > /dev/null

echo "Installing Mysql..."
debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"
apt-get install mysql-server -y > /dev/null
cp /vagrant/my.cnf /etc/mysql/
chown root:root /etc/mysql/my.cnf
service mysql restart
mysql -uroot -p1234 mysql < /vagrant/init.sql

echo "Installing Beanstalkd..."
sudo apt-get install beanstalkd -y > /dev/null
service beanstalkd restart

echo "Done Provisioning"
