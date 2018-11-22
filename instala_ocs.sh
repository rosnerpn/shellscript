#!/bin/bash
################################
###Script_Instalação_OCS########  		   
###Criado_por_Rosner_Nascimento# 
###email_ros.tecinfo@gmai.com###
###Data_criação_25_03_15########
################################

echo "Script para Instalação do OCS Inventory Server 2.5"

 
apt-get update -y
apt-get install php-curl apache2-dev gcc perl-modules-5.22 make apache2 mysql-server php perl libapache2-mod-perl2 libapache2-mod-php libio-compress-perl libxml-simple-perl libdbi-perl libdbd-mysql-perl libapache-dbi-perl libsoap-lite-perl libnet-ip-perl php-mysql php-gd php7.0-dev php-mbstring php-soap php-xml php-pclzip libarchive-zip-perl php7.0-zip
apt-get install make build-essential mysql-client snmp nmap -y

echo "Instalando os módulos PERL"

apt-get install libxml-simple-perl -y
apt-get install libio-compress-perl -y
apt-get install libdbi-perl -y 
apt-get install libdbd-mysql-perl -y
apt-get install libapache-dbi-perl -y
apt-get install libnet-ip-perl -y
apt-get install libsoap-lite-perl -y 
apt-get install libarchive-zip-perl -y  

cpan -i XML::Entities
cpan -i Compress::Zlib
cpan -i Apache::SOAP
cpan -i Apache2::SOAP

echo "Instalando os Módulos do PHP"
apt-get install libphp-pclzip -y
apt-get install php-gd -y
apt-get install php-curl php-xml php-soap php-mysql php-zip -y
apt-get install php-mbstring -y
apt-get install php-net-ldap -y

echo "Criando pasta OCS_Inventory"
cd ..
mkdir OCS_Inventory && cd OCS_Inventory
echo "Efetuando Download do OCS_Inventory 2.5"
wget https://github.com/OCSInventory-NG/OCSInventory-ocsreports/releases/download/2.5/OCSNG_UNIX_SERVER_2.5.tar.gz

echo "Descompactando arquivo"
tar -xzvf OCSNG_UNIX_SERVER_2.5.tar.gz
cd OCSNG_UNIX_SERVER_2.5
echo "iniciando a instalação"
./setup.sh

echo "Configurando Apache e PHP"
a2enconf ocsinventory-reports
a2enconf z-ocsinventory-server
chown -R www-data:www-data /var/lib/ocsinventory-reports/

echo "Reiniciando servidor Apache"
service apache2 restart

echo "Alterando os parametros do do PHP.ini"

sed -i 's/post_max_size = 8M/post_max_size = 512M/' /etc/php/7.0/apache2/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 512M/' /etc/php/7.0/apache2/php.ini


echo "Reiniciando servidor Apache"
service apache2 restart
