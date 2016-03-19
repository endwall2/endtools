#! /usr/bin/python
######################################################################
# Program: iplookup.py 
# Type: python script
# Version: 1.08
# Date: March 18, 2016
# Author: Endwall Development Team
#
# Change Log:  - Added EULA
#              - Added country name
#              - Removed unused dependance on python-geoip
#              - Fixed comments to reflect change
#              - Fixed BUG (no GeoIPOrg.dat)
#
# Required programs:  python, pygeoip 
# Required files: GeoIP.dat,GeoLiteCity.dat,GeoIPOrg.dat       
# Downloaded from here: http://dev.maxmind.com/geoip/legacy/geolite/
#
######################################################################
#                   INSTRUCTIONS
######################################################################
#    DEBIAN/UBUNTU/Trisquel/GnuSense
#  $ apt-get install python python-pygeoip python2-pygeoip 
#    ARCH-LINUX/PARABOLA/ANTERGOS/MANJARO/ARCHBANG
#  $ pacman -S python python-pygeoip python2-pygeoip
#    FEDORA/CENTOS/RHEL/SCIENTIFIC LINUX
#  $ yum install python python-pygeoip
#
#  $ mkdir ~/geoip 
#  $ cd ~/geoip
#  $ wget http://b.1339.cf/gagzeqd.py
#  $ wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
#  $ wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
#  $ wget http://download.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz
#  $ gunzip *.gz
#  $ mv ~/geoip/gagzeqd.py ~/geoip/iplookup.py
#  $ chmod u+wrx iplookup.py
#  $ ./iplookup.py 8.8.8.8
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
##################################################################################################

import sys
import os
import pygeoip

gcount=pygeoip.GeoIP('GeoIP.dat')
gcit=pygeoip.GeoIP('GeoLiteCity.dat')
gasn=pygeoip.GeoIP('GeoIPASNum.dat')
#gorg=pygeoip.GeoIP('GeoIPOrg.dat')

for arg in sys.argv[1:]:
   print(arg)
   print(gcount.country_code_by_addr(arg), gcount.country_name_by_addr(arg))
   print(gasn.org_by_addr(arg))
   #print(gorg.org_by_addr(arg))
   print(gcit.record_by_addr(arg))

quit()
