#! /bin/sh
#################################
# Program:  spamalertz.sh
# Type: Bourne shell script
# Version: 1.05
# Revision Date: Mar 18 2016
# Author: Endwall Development Team
#
# Description: Print log file of flagged terms
# Notes: invoke with root privalage
#
# Change Log: - Added EULA
#             - Fixed flags to match endset.sh
#
# Instructions: $ chmod u+rwx spamalertz.sh
# Examples:     $ su
#               # ./spamalertz.sh
#               # ./spamalertz.sh Jan 5

######################################################################### 
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
#
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
month="$1"
day="$2"
fi

# correction for if day <10 needs an extra white space
if [ "$day" -le 9 ] ; then
    day=" $day"
fi

###################################

grep -ah "$(echo "$month $day")" "$infolog"* > $tmp1
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
