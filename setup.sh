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

# Add charset UTF-8 to the http block
sed -i '/http {/a \    charset UTF-8;' /etc/nginx/nginx.conf

# Create a custom index.html with a specific <h1> tag
cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <h1>Hello from EC2!</h1>
</body>
</html>
EOF

# Enable and start nginx
systemctl enable nginx
systemctl start nginx
