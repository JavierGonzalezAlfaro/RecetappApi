#!/usr/bin/env bash

apt-get update
apt-get install -y apache2

apt-get dist-upgrade

sudo apt-get install -y mysql-server

sudo apt-get install python-software-properties software-properties-common
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.1 php7.0-cli php7.1-common php7.1-mbstring php7.1-intl php7.1-xml php7.1-mysql php7.1-mcrypt

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo apt-get install -y git

if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
