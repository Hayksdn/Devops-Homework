#!/bin/bash

apt update && apt upgrade -y
apt install -y nginx 
cd /var/www/html/ 


for page in page1.html page2.html page3.html; do
touch $page
chown www-data:www-data $page
chmod 644 $page
 done

if ( systemctl is-active --quiet nginx ) then
 echo "Nginx is running. Force restarting now..." 
systemctl restart nginx
 else
 echo "Nginx is dead. Starting it now..."
systemctl start nginx
fi
journalctl -u nginx -n 5