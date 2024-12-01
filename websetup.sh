#!/bin/bash 

#variable
tmp=/tmp/webdoc
url=https://www.tooplate.com/zip-templates/2134_gotto_job.zip

#debugging
set -x  #debugging 
set -e  #to exit if any error 

#script starts from here

echo "starting webload script"
echo "#########################################################"
echo "creating tmp file"
echo
mkdir -p $tmp 
echo "done"
echo
echo "downloading artifact"
echo
wget $url  -p $tmp

echo
echo "removing previus html file"
echo
rm /var/www/html/*
echo "done"
echo " unziping artifact"
echo
unzip $tmp/*.zip
echo "done"
echo
echo "loading atrifact in httpd service"
echo
cp -r $tmp/2134_gotto_job/* /var/www/html/
echo "done"
systemctl restart httpd 
echo 
echo "####################################################"
ifconfig | grep inet | sed -n '2p'
echo "#####################################################"

