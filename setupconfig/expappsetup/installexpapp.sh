sudo apt update
sudo apt install openjdk-8-jdk
sudo mkdir /opt/tomcat
sudo tar xzvf apache-tomcat-10.0.13.tar.gz -C /opt/tomcat --strip-components=1
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
chown -R tomcat: /opt/tomcat
chmod -R 755 /opt/tomcat
sudo cp tomcat.service /etc/systemd/system/tomcat.service
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat
sudo cp manager-context.xml /opt/tomcat/webapps/manager/META-INF/context.xml
sudo cp host-manager-context.xml /opt/tomcat/webapps/host-manager/META-INF/context.xml
unzip expenseswebapp 
sudo mkdir /opt/tomcat/webapps/expenseswebapp
sudo cd /opt/tomcat/webapps/expenseswebapp
sudo cp -rf expenseswebapp/* .
