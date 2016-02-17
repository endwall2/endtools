#! /usr/bin/bash
#################################################
# Program: aloglertz.sh
# Type: bash shell script
# Description: Print the apache log by date
# Author: Endwall Development Team
# Notes: Invoke with root privaleges
# Version: 1.03
# Version Date: Feb 13 2016
#################################################

http_log=/var/log/httpd/access_log
ssl_log=/var/log/httpd/ssl_access_log
http_log_old=/var/log/httpd/access_log*
ssl_log_old=/var/log/httpd/ssl_access_log*
date

arg1="$1"
arg2="$2"

 month="$(date +b%)"
 day="$(date +%-d)"

if [ "$arg1 " != " " ] ; then
 month=$arg1
 day=$arg2
fi

day1=$day
day2=$day

if [ "$day" -le "9" ] ; then
 day1=" $day"
 day2="0$day"
fi

#echo "$month $day1 $day2"

if [ "$arg1 " != " " ] ; then

echo ~~~~~~~~~~~~~~~~~~~~~~~~Apache HTTP ACCESS LOG OLD~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $http_log_old | grep "$(echo "$day2/$month/")"
echo ~~~~~~~~~~~~~~~~~~~~~~~~Apache SSL ACCESS LOG OLD~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $ssl_log_old | grep "$(echo "$day2/$month/")"

else 

echo ~~~~~~~~~~~~~~~~~~~~~~~~Apache HTTP ACCESS LOG OLD~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $http_log | grep "$(echo "$day2/$month/")"
echo ~~~~~~~~~~~~~~~~~~~~~~~~Apache SSL ACCESS LOG OLD~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $ssl_log | grep "$(echo "$day2/$month/")"

fi

date

exit 0

