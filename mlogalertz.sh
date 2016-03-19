#! /bin/sh
#######################################################
# Program : mlogalertz
# Type: Bourne Shell Script
# Description: Print mail log for a given day
# Notes: Invoke with root permisions
# Author: Endwall Development Team
# Version: 1.05
# Version Date: March 18 2016
## Instructions: $ chmod u+rwx mlogalertz.sh
# Examples:     $ su
#               # ./mlogalertz.sh
#               # ./mlogalertz.sh Jan 5
#######################################################
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
mail=/var/log/mail.log

month="$(date +%b)"  # get the current month
day="$(date +%-d)"   # get the current day

if [ "$#" -ge  2 ] ; then   # if there are cli arguments   
 month="$1"  # set the day to first argument
 day="$2"    # set the month to second argument 
fi

if [ "$day" -le "9" ]  # correction for day<10
then
  day=" $day"          # add a whitespace
fi

echo "$month $day"
if [ "$#" -ge 2 ] ; then  
  echo ~~~~~~~~~~~~~~~~~~~~~~~~MAIL LOG OLD ~~~~~~~~~~~~~~~~~~~~~~~
  grep -ah "$(echo "$month $day")" "$mail"* 
  echo
else
  echo ~~~~~~~~~~~~~~~~~~~~~~~~~~MAIL LOG~~~~~~~~~~~~~~~~~~~~~~~~~
  grep -ah "$(echo "$month $day")" "$mail"
  echo
fi

date
exit 0
