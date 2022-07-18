#!/bin/bash

if ! [ $1 ]
then
  echo "Error: No arguments!!"
  exit 1
fi
webip=$(ping -c 1 -4 $1 2>/dev/null)
if [ $? != 0 ]
then
  echo "Web domain not found!"
  exit 1  
fi
webip=$(echo $webip | tr -d "[()]" | cut -d " " -f 2)
echo "$1 ip: $webip"
echo $webip | xclip -sel clip
echo "ip address copied to clipboard!!"
exit 0
