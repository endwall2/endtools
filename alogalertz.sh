#! /bin/sh
#################################################
# Program: aloglertz.sh
# Type: Bourne shell script
# Description: Print the apache log by date
# Author: Endwall Development Team
# Notes: Invoke with root privaleges
# Version: 1.05
# Version Date: Mar 18 2016
# Instructions: $ chmod u+rwx alogalertz.sh
# Examples:     $ su
#               # ./alogalertz.sh
#               # ./alogalertz.sh Jan 5
#################################################
#######################################################################
#                LICENSE AGREEMENT
#######################################################################
#  1)  You have the freedom to study the code.
#  2)  You have the freedom to distribute and share the code. 
#  2a) The License, Header and Instructions must be attached to the code when re-distributed.
#  3)  You have the freedom to modify and improve the code.
#  3b) When modified or improved, during redistribution you must attatch the the LICENSE AGREEMENT in its entirety.   
#  4)  You have the freedom to run the code on any computer of your choice.
#  4a) You are free to run as many simultaneous instantiations of this code on as many computers as you wish for as long as you wish with any degree of simultaneity. 
#  6)  This program may be used for any purpose and in any context and any setting including for personal use, academic use and business or comercial use.
#  6)  This software is distributed without any warranty and without any guaranty and the creators do not imply anything about its usefulness or efficacy.
#  7) If you sustain finanical, material or physical loss as a result of using, running, or modifying this script you agree to 
#     hold the creators the "Endwall Development Team" or the programers involved in its creation free from prosecution, free from indemnity, and free from liability
#  8) If you find a significant flaw or make a significant improvement feel free to notify the original developers so that we may also
#     include your improvement in the next release; you are not obligated to do this but we would enjoy this courtesy.   
#
######################################################################### 

http_log=/var/log/httpd/access_log
ssl_log=/var/log/httpd/ssl_access_log

month=$(date +%b)
day=$(date +%-d)

if [ "$#" -ge 2 ] ; then
 month="$1"
 day="$2"
fi

day1="$day"
day2="$day"

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

