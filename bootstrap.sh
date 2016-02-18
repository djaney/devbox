#!/bin/bash

echo "Provisioning virtual machine..."

sudo apt-get update
sudo apt-get install debconf-utils -y > /dev/null

echo "Intalling Git..."
sudo apt-get install -y git
git config --global url."https://".insteadOf git://

echo "Installing Mysql..."
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"
sudo apt-get install mysql-server -y > /dev/null
sudo cp /vagrant/my.cnf /etc/mysql/
sudo chown root:root /etc/mysql/my.cnf
sudo service mysql restart
mysql -uroot -p1234 mysql < /vagrant/init.sql

echo "Installing Beanstalkd..."
sudo apt-get install beanstalkd -y > /dev/null
sudo service beanstalkd restart

echo "Installing MongoDB..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org > /dev/null
sudo cp /vagrant/mongod.conf /etc/
sudo service mongod restart
echo "Done Provisioning"
