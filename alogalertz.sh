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
#                 ACKNOWLEDGEMENTS
#######################################################################
#  The Endwall development team would like to acknowledge the work and efforts
#  of Odilitime, who graciously hosted and promoted this firewall project.
#  Without his efforts and his wonderful website www.endchan.xyz endwall.sh would not
#  exist in the public domain at all in any form. So thanks to Odilitime for inspiring this work
#  and for hosting and promoting it. 
#  
#  Endwall,Endsets,Endlists, and Endtools are named in honor of Endchan.
#
#  Thank you also to early beta testers including a@a, and to other contributors 
#  as well as to the detractors who helped to critique this work and to ultimately improve it.  
#  
#  We also acknowledge debian.paste.net and gitweb for their hosting services, 
#  without which distribution would be limited / impossible, so thank you.
#
#  https://www.endchan.xyz, http://paste.debian.net, http://gitweb2zl5eh7tp3.onion  
#
#  We salute you! 
#  
#  In the end, may it all end well.
#
#  Endwall Development Team
#######################################################################
#                LICENSE AGREEMENT
#######################################################################
#  1)  You have the freedom to study the code.
#  2)  You have the freedom to distribute and share the code. 
#  2 a) The License, Header and Instructions must be attached to the code when re-distributed.
#  3)  You have the freedom to modify and improve the code.
#  3 a) When modified or improved, during re-distribution you must attatch the LICENSE AGREEMENT in its entirety.   
#  4)  You have the freedom to run the code on any computer of your choice.
#  4 a) You are free to run as many simultaneous instances of this code on as many computers as you wish for as long as you wish with any degree of simultaneity. 
#  6)  This program may be used for any purpose and in any context and any setting including for personal use, academic use and business or commercial use.
#  7)  This software is distributed without any warranty and without any guaranty and the creators do not imply anything about its usefulness or efficacy.
#  8) If you sustain finanical, material or physical loss as a result of using, running, or modifying this script you agree to 
#     hold the creators the "Endwall Development Team" or the programers involved in its creation free from prosecution, free from indemnity, and free from liability
#  9) If you find a significant flaw or make a significant improvement feel free to notify the original developers so that we may also
#     include your improvement in the next release; you are not obligated to do this but we would enjoy this courtesy tremendously.   
##############################################################################################

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

