
#!/bin/bash
    sudo apt update
    sudo apt install nginx -y


# أضف إعدادات الـ Nginx كـ Proxy
cat <<EOL > /etc/nginx/sites-available/default
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://10.0.1.100;  
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOL

sudo systemctl start nginx
    
sudo systemctl enable nginx

sudo systemctl restart nginx
