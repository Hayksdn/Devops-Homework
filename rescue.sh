#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install -y nginx 
cd /var/www/html/ 


for page in page1.html page2.html page3.html; do
 sudo touch $page
 sudo chown www-data:www-data $page
 sudo chmod 644 $page
 done

if ( sudo systemctl is-active --quiet apache2 ) then
 echo "Nginx is running. Force restarting now..." 
 sudo systemctl restart nginx
 else
 echo "Nginx is dead. Starting it now..."
 sudo systemctl start nginx
fi
 sudo journalctl -u nginx -n 5