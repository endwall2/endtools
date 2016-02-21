#! /bin/bash
#################################
# Program:  spamalertz.sh
# Type: bash shell script
# Version: 1.03
# Revision Date: Feb 14 2016
# Author: Endwall Development Team
#
# Description: Print log file of flagged terms
# Notes: invoke with root privalage
#
# Change Log: -Fixed flags to match endset.sh
#
#
# Instructions: $ chmod u+rwx spamalertz.sh
# Examples:     $ su
#               # ./spamalertz.sh
#               # ./spamalertz.sh Jan 5
#################################

### log file locations

infolog=/var/log/everything.log*
tmp1=/tmp/store1.tmp
date

###################################
arg1="$1"  # argument 1 from terminal
arg2="$2"  # argument 2 from terminal

month="$(date +%b)" # get current month
day="$(date +%-d)"  # get current day

# if terminal values are entered set the date to those values
if [ "$arg1 " != " " ] ; then    
month=$arg1
day=$arg2
fi

# correction for if day <10 needs an extra white space
if [ "$day" -le 9 ] ; then
    day=" $day"
fi

###################################

cat $infolog | grep -a "$(echo "$month $day")" > $tmp1

echo ~~~~~~~~~~~~~~~~~~ BLACKLIST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $tmp1 | grep -a "BLACKLIST"
echo 
echo ~~~~~~~~~~~~~~~~~~ IPv6 BLACKLIST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $tmp1 | grep -a "IPv6-BLACKLIST"
echo 
echo ~~~~~~~~~~~~~~~~~~ ATTACKERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $tmp1 | grep -a "ATTACKER"
echo 
echo ~~~~~~~~~~~~~~~~~~~SMTP BLACKLIST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $tmp1 | grep -a "SMTP-BL"
echo
echo ~~~~~~~~~~~~~~~~~~ HTTP BLACKLIST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $tmp1 | grep -a "HTTP-BL" | grep -a "DPT=80 " 
echo 
echo ~~~~~~~~~~~~~~~~~~ HTTPS BLACKLIST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $tmp1 | grep -a "HTTP-BL" | grep -a "DPT=443 "
echo 
echo ~~~~~~~~~~~~~~~~~~ DNS BLACKLIST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $tmp1 | grep -a "DNS-BL"
echo 
echo ~~~~~~~~~~~~~~~~~~ EMAIL SPAM~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $tmp1 | grep -a "EMAIL SPAM"
echo 
echo ~~~~~~~~~~~~~~~~~~ HTML SPAM~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat $tmp1 | grep -a "HTTP SPAM"
echo 

rm $tmp1
date
exit 0
