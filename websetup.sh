#!/bin/bash 

#variable
echo "enter the Url: "
read a
tmp=/tmp/webdoc

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
rm -rf $tmp/*
cd $tmp
wget $url
unzip *.zip
echo
echo "removing previus html file"
echo
echo "loading atrifact in httpd service"
echo
filename=$(ls $tmp| grep -v *.zip)
echo $filename
cp -r $tmp/$filename/* /var/www/html/
echo "done"
systemctl restart httpd 
echo 
echo "####################################################"
ifconfig | grep inet | sed -n '2p'
echo "#####################################################"


