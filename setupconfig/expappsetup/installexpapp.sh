sudo apt update
sudo apt install -y openjdk-8-jdk
sudo mkdir /opt/tomcat
cd /home/ubuntu/expapp/setupconfig/expappsetup
sudo tar xzvf apache-tomcat-8.5.85.tar.gz -C /opt/tomcat --strip-components=1
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
sudo chown -R tomcat: /opt/tomcat
sudo chmod -R 755 /opt/tomcat
sudo cp tomcat.service /etc/systemd/system/tomcat.service
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat
sudo cp manager-context.xml /opt/tomcat/webapps/manager/META-INF/context.xml
sudo cp host-manager-context.xml /opt/tomcat/webapps/host-manager/META-INF/context.xml
unzip expenseswebapp 
sudo mkdir /opt/tomcat/webapps/expenseswebapp
sudo cp -rf expenseswebapp/* /opt/tomcat/webapps/expenseswebapp/.
unzip expngapp 
sudo mkdir /opt/tomcat/webapps/expngapp
sudo cp -rf expngapp/* /opt/tomcat/webapps/expngapp/.
sudo chown -R tomcat: /opt/tomcat
sudo chmod -R 777 /opt/tomcat/webapps
export SERVERIP=` dig +short myip.opendns.com @resolver1.opendns.com`
echo "SERVERIP="$SERVERIP >> /opt/tomcat/webapps/expenseswebapp/config.txt
echo "SERVERPORT=8080" >> /opt/tomcat/webapps/expenseswebapp/config.txt
sudo sed -i 's+href="/"+href="/expngapp/"+g' /opt/tomcat/webapps/expngapp/index.html
sudo cp /home/ubuntu/expapp/setupconfig/processDynamoDBConfig.py /home/ubuntu/expapp/setupconfig/expappsetup/.
source create-fdconfig.sh
sudo systemctl restart tomcat
