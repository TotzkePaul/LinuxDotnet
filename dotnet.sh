#!/bin/bash


#read -p "Enter user: " user
#echo paul
#PATH="/home/"
#PATH+=$user
#PATH+="/www/" 
#echo  "$PATH"


mkdir  /home/paul/www/
sudo apt-get update

sudo apt-get install samba

cd /etc/samba/


sudo mv /etc/samba/smb.conf /etc/samba/backsmb.conf


echo "#" >> /etc/samba/smb.conf
echo "[global]" >> /etc/samba/smb.conf
echo "workgroup = Workgroup" >> /etc/samba/smb.conf
echo "server string = My Samba Share %v" >> /etc/samba/smb.conf
echo "security = user" >> /etc/samba/smb.conf
echo "map to guest = bad user" >> /etc/samba/smb.conf
echo "dns proxy = no" >> /etc/samba/smb.conf
echo "#" >> /etc/samba/smb.conf
echo "[www]" >> /etc/samba/smb.conf
echo "comment = This is a folder accessible from everyone" >> /etc/samba/smb.conf
echo "path = /home/paul/www" >> /etc/samba/smb.conf
echo "browsable = yes" >> /etc/samba/smb.conf
echo "guest ok = yes" >> /etc/samba/smb.conf
echo "read only = no" >> /etc/samba/smb.conf
echo "create mask = 0755" >> /etc/samba/smb.conf

echo "restart samba"
sudo /etc/init.d/samba restart


#Get curl and unzip
sudo apt-get install unzip curl

#Instal DNVM:
curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh

#To install DNX for .NET Core:
sudo apt-get install libunwind8 gettext libssl-dev libcurl4-openssl-dev zlib1g libicu-dev uuid-dev

dnvm upgrade -r coreclr


#To install DNX for Mono:
sudo apt-get install mono-complete

#Install libuv - Libuv is an IO library that is used by Kestrel, an HTTP server for hosting ASP.NET 5 web applications.
sudo apt-get install make automake libtool curl
curl -sSL https://github.com/libuv/libuv/archive/v1.8.0.tar.gz | sudo tar zxfv - -C /usr/local/src
cd /usr/local/src/libuv-1.8.0
sudo sh autogen.sh
sudo ./configure
sudo make
sudo make install
sudo rm -rf /usr/local/src/libuv-1.8.0 && cd ~/
sudo ldconfig

# Add localhost for apache-server4
# echo "ServerName localhost" >> /etc/apache2/conf-available/servername.conf

sudo service apache2 stop

#Installation of libapache2-mod-mono hangs:
#https://bugs.launchpad.net/ubuntu/+source/mod-mono/+bug/1308047

#Install ASP.NET MVC under Linux with Mono
echo "lib apache mod-mono"
sudo apt-get install -y libapache2-mod-mono
echo "mono apache server"
sudo apt-get install -y mono-apache-server4

sudo chown -R www-data:www-data /home/paul/www
sudo service apache2 restart
