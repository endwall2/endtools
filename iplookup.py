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
