#!/bin/bash
# Install NGINX
if [ -f /etc/os-release ]; then
  . /etc/os-release
  if [[ "$ID" == "amzn" ]]; then
    yum install nginx -y
  elif [[ "$ID" == "ubuntu" ]]; then
    apt-get update -y
    apt-get install nginx -y
  fi
fi

# Insert 'charset UTF-8;' into the http block of nginx.conf
sed -i '/http {/a \    charset UTF-8;' /etc/nginx/nginx.conf

# Enable and start NGINX
systemctl enable nginx
systemctl start nginx
