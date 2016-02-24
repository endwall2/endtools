#! /bin/sh
#################################
# Program:  spamalertz.sh
# Type: Bourne shell script
# Version: 1.04
# Revision Date: Feb 23 2016
# Author: Endwall Development Team
#
# Description: Print log file of flagged terms
# Notes: invoke with root privalage
#
# Change Log: -Fixed flags to match endset.sh
#
# Instructions: $ chmod u+rwx spamalertz.sh
# Examples:     $ su
#               # ./spamalertz.sh
#               # ./spamalertz.sh Jan 5
#################################

### log file locations
infolog=/var/log/everything.log
tmp1=/tmp/store1.tmp

###################################
date

month="$(date +%b)" # get current month
day="$(date +%-d)"  # get current day

# if terminal values are entered set the date to those values
if [ "$#" -ge 2 ] ; then    
month=$1
day=$2
fi

# correction for if day <10 needs an extra white space
if [ "$day" -le 9 ] ; then
    day=" $day"
fi

###################################

grep -ah "$(echo "$month $day")" $infolog* > $tmp1

echo ~~~~~~~~~~~~~~~~~~ BLACKLIST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "BLACKLIST" "$tmp1"
echo 
echo ~~~~~~~~~~~~~~~~~~ IPv6 BLACKLIST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "IPv6-BLACKLIST" "$tmp1"
echo 
echo ~~~~~~~~~~~~~~~~~~ ATTACKERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "ATTACKER" "$tmp1"
echo 
echo ~~~~~~~~~~~~~~~~~~~SMTP BLACKLIST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "SMTP-BL" "$tmp1"
echo
echo ~~~~~~~~~~~~~~~~~~ HTTP BLACKLIST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "HTTP-BL" "$tmp1" | grep -a "DPT=80 " 
echo 
echo ~~~~~~~~~~~~~~~~~~ HTTPS BLACKLIST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "HTTP-BL" "$tmp1" | grep -a "DPT=443 "
echo 
echo ~~~~~~~~~~~~~~~~~~ DNS BLACKLIST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "DNS-BL" "$tmp1"
echo 
echo ~~~~~~~~~~~~~~~~~~ EMAIL SPAM~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "EMAIL SPAM" "$tmp1"
echo 
echo ~~~~~~~~~~~~~~~~~~ HTML SPAM~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
grep -ah "HTTP SPAM" "$tmp1"
echo 

rm $tmp1
date
exit 0
