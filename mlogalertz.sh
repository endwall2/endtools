#! /bin/sh
#######################################################
# Program : mlogalertz
# Type: Bourne Shell Script
# Description: Print mail log for a given day
# Notes: Invoke with root permisions
# Author: Endwall Development Team
# Version: 1.04
# Version Date: February 23 2016
#
#######################################################

mail=/var/log/mail.log

month="$(date +%b)"  # get the current month
day="$(date +%-d)"   # get the current day

if [ "$#" -ge  2 ] ; then   # if there are cli arguments   
 month=$1  # set the day to first argument
 day=$2    # set the month to second argument 
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
