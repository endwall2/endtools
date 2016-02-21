#! /bin/bash
#######################################################
# Program : mlogalertz
# Type: bash Script
# Description: Print mail log for a given day
# Notes: Invoke with root permisions
# Author: Endwall Development Team
# Version: 1.03
# Version Date: February 13 2016
#
#######################################################

mail=/var/log/mail.log
mail_old=/var/log/mail.log*

date

arg1="$1"  # get first commandline argument
arg2="$2"  # get the second commandline argument

month="$(date +%b)"  # get the current month
day="$(date +%-d)"   # get the current day

if [ "$arg1 " != " " ] ; then   # if there are cli arguments   
 month=$arg1  # set the day to first argument
 day=$arg2    # set the month to second argument 
fi

if [ "$day" -le "9" ]  # correction for day<10
then
  day=" $day"          # add a whitespace
fi

if [ "$arg1 " != " " ] ; then  
  echo ~~~~~~~~~~~~~~~~~~~~~~~~MAIL LOG OLD ~~~~~~~~~~~~~~~~~~~~~~~
  cat $mail_old | grep "$(echo "$month $day")"
  echo
else
  echo ~~~~~~~~~~~~~~~~~~~~~~~~~~MAIL LOG~~~~~~~~~~~~~~~~~~~~~~~~~
  cat $mail | grep "$(echo "$month $day")"
  echo
fi
