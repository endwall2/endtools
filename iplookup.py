#! /usr/bin/python
######################################################################
# Program: iplookup.py 
# Type: python script
# Version: 1.07
# Date: February, 9, 2016
# Author: Endwall Development Team
#
# Change Log:  -Removed unused dependance on python-geoip
#              -Fixed comments to reflect change
#              -Fixed BUG (no GeoIPOrg.dat)
#
# Required programs:  python, pygeoip 
# Required files: GeoIP.dat,GeoLiteCity.dat,GeoIPOrg.dat       
# Downloaded from here: http://dev.maxmind.com/geoip/legacy/geolite/
#
######################################################################
#                   INSTRUCTIONS
######################################################################
#    DEBIAN/UBUNTU/Trisquel/GnuSense
#  $ sudo apt-get install python python-pygeoip python2-pygeoip 
#    ARCH-LINUX/PARABOLA/ANTERGOS/MANJARO/ARCHBANG
#  $ sudo pacman -S python python-pygeoip python2-pygeoip
#    FEDORA/CENTOS/RHEL/SCIENTIFIC LINUX
#  $ sudo yum install python python-pygeoip
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
#
#  Feel free to modify and improve this script
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
   print(gcount.country_code_by_addr(arg))
   print(gasn.org_by_addr(arg))
   #print(gorg.org_by_addr(arg))
   print(gcit.record_by_addr(arg))

quit()
