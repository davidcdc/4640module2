#!/bin/bash -x

#scp todoapp.service todoapp:

ssh todoapp sudo setenforce 0

#scp -r setup/ todoapp:
#ssh todoapp bash setup/install.sh

ssh todoapp sudo useradd todoapp
ssh todoapp sudo dnf install -y git

sudo -u todoapp git clone https://github.com/timoguic/ACIT4640-todo-app.git /home/todoapp/app

ssh todoapp curl -sL https://rpm.nodesource.com/setup_14.x
ssh todoapp sudo dnf install -y nodejs
ssh todoapp sudo dnf install -y mongodb-org
ssh todoapp sudo systemctl start mongod
ssh todoapp sudo systemctl status mongod
ssh todoapp sudo npm install
ssh todoapp sudo systemctl start nodejs

ssh todoapp sudo sudo firewall-cmd --list-all
ssh todoapp sudo sudo firewall-cmd --zone=public --add-port=8080/tcp
ssh todoapp sudo sudo firewall-cmd --runtime-to-permanent
ssh todoapp sudo firewall-cmd --zone=public --add-service=http
ssh todoapp sudo firewall-cmd --runtime-to-permanent

ssh todoapp sudo systemctl daemon-reload
ssh todoapp sudo systemctl enable todoapp
ssh todoapp sudo systemctl start todoapp.service

ssh todoapp sudo dnf install -y epel-release
ssh todoapp sudo dnf install -y nginx
ssh todoapp sudo systemctl status nginx
ssh todoapp sudo systemctl enable nginx
ssh todoapp sudo systemctl start nginx

ssh todoapp sudo firewall-cmd --list-all
ssh todoapp sudo firewall-cmd --zone=public --add-service=http
ssh todoapp sudo firewall-cmd --runtime-to-permanent

