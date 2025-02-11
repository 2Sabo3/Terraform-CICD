#!/bin/bash
sudo yum update -y
sudo yum install -y httpd mariadb105-server php php-mysqlnd wget unzip php-fpm php-mysqli php-json php php-devel
sudo systemctl start httpd
sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
cd /var/www/html/
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
sudo chown ec2-user:apache /var/www/html/wordpress/
sudo chmod -R 777 /var/www/html/wordpress