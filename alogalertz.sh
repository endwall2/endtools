#! /bin/sh
#################################################
# Program: aloglertz.sh
# Type: Bourne shell script
# Description: Print the apache log by date
# Author: Endwall Development Team
# Notes: Invoke with root privaleges
# Version: 1.04
# Version Date: Feb 23 2016
#################################################

http_log=/var/log/httpd/access_log
ssl_log=/var/log/httpd/ssl_access_log

month=$(date +%b)
day=$(date +%-d)

if [ "$#" -ge 2 ] ; then
 month="$1"
 day="$2"
fi

day1=$day
day2=$day

if [ "$day" -le "9" ] ; then
 day1=" $day"
 day2="0$day"
fi

echo "$month $day"
if [ "$# " -ge 2 ] ; then
echo ~~~~~~~~~~~~~~~~~~~~~~~~Apache HTTP ACCESS LOG OLD~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "$(echo "$day2/$month/")" "$http_log"*
echo ~~~~~~~~~~~~~~~~~~~~~~~~Apache SSL ACCESS LOG OLD~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "$(echo "$day2/$month/")" "$ssl_log"*

else 

echo ~~~~~~~~~~~~~~~~~~~~~~~~Apache HTTP ACCESS LOG ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "$(echo "$day2/$month/")" "$http_log"
echo ~~~~~~~~~~~~~~~~~~~~~~~~Apache SSL ACCESS LOG ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "$(echo "$day2/$month/")" "$ssl_log"

fi

date

exit 0

