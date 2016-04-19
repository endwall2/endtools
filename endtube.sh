# /bin/sh
#################################################################################################################################################
# NAME: endtube.sh
# TYPE: BOURNE SHELL SCRIPT
# DESCRIPTION: Downlods youtube video files from an input list 
#              anonymously using youtube-dl and torsocks
#
# AUTHOR:  ENDWALL DEVELOPEMENT TEAM
# CREATION DATE:   APRIL 9 2016
# VERSION: 0.04
# REVISION DATE: APRIL 18 2015
#
# DEPENDANCIES: torsocks,youtube-dl,calc,od,head,urandom,sleep
#
# INSTRUCTIONS:  do the following at a command prompt
#
#  $  mkdir ~/bin
#  $  chmod u+wrx endtube.sh
#  $  cp endtube.sh ~/bin
#  $  export PATH=$PATH:~/bin
#  $  sudo systemctl start tor
#  $  sudo systemctl status tor
#  $  cd downloads
#  $  mkdir videos
#  $  cd videos
#  $  cp youtube_links.txt ~/downloads/videos
#  $  endtube youtube_links.txt
#
##################################################################################################################################################
##############################################################################################################################################################################
#                               LICENSE AGREEMENT  
##############################################################################################################################################################################
#  BEGINNING OF LICENSE AGREMENT
#  TITLE:  THE ENDWALL END USER LICENSE AGREEMENT (EULA) 
#  VERSION: 1.04 
#  VERSION DATE: April 11, 2016
#   
#  WHAT CONSTITUES "USE"? WHAT IS A "USER"?
#  0) a) Use of this program means the ability to study, posses, run, copy, modify, publish, distribute and sell the code as included in all lines of this file,
#        in text format or as a binary file consituting this particular program or its compiled binary machine code form, as well as the the performance 
#        of these aforementioned actions and activities. 
#  0) b) A user of this program is any individual who has been granted use as defined in section 0) a) of the LICENSE AGREEMENT, and is granted to those individuals listed in section 1.
#  WHO MAY USE THIS PROGRAM ?
#  1) a) This program may be used by any living human being, any person, any corporation, any company, and by any sentient individual with the willingness and ability to do so.
#  1) b) This program may be used by any citizen or resident of any country, and by any human being without citizenship or residency.
#  1) c) This program may be used by any civilian, military officer, government agent, private citizen, public official, soveriegn, monarch, head of state,
#        dignitary, ambassdor, noble, commoner, clergy, layity, and generally all classes and ranks of people, persons, or human beings mentioned and those not mentioned.
#  1) d) This program may be used by any human being of any gender, including men, women, and any other gender not mentioned.       
#  1) e) This program may be used by anyone of any afiliation, political viewpoint, political affiliation, religious belief, religious affiliation, and by those of non-belief or non affiliation.
#  1) f) This program may be used by any person of any race, ethnicity, identity, origin, genetic makeup, physical apperance, mental ability, and by those of any other physical 
#        or non physical characteristics of differentiation.
#  1) g) This program may be used by any human being of any sexual orientation, including heterosexual, homosexual, bisexual, asexual, or any other sexual orientation not mentioned.
#  1) h) This program may be used by anyone. 
#  WHERE MAY A USER USE THIS PROGRAM ?
#  2) a) This program may be used in any country, in any geographic location of the planet Earth, in any marine or maritime environment, at sea, subsea, in a submarine, underground,
#        in the air, in an airplane, derigible, blimp, or balloon, and at any distance from the surface of the planet Earth, including in orbit about the Earth or the Moon,
#        on a satellite orbiting about the Earth or about any planet, on any space transport vehicle, and anywhere in the solar system including the Moon, Mars, and all other solar system planets not listed.  
#  2) b) This program may be used in any residential, commercial, business, and governmental property or location and in all public and private spaces. 
#  2) c) This program may be used anywhere.
#  IN WHAT CONTEXT OR CIRCUMSTANCES MAY A USER USE THIS PROGRAM?
#  3)  This program may be used by any person, human being or sentient individual for any purpose and in any context and in any setting including for personal use, academic use,
#      business use, commercial use, government use, non-governmental organization use, non-profit organization use, military use, civilian use, and generally any other use 
#      not specifically mentioned.
#  WHAT MAY A "USER" DO WITH THIS PROGRAM ?
#  4) Any user of this program is granted the freedom to study the code.
#  5) a) Any user of this program is granted the freedom to distribute, publish, share the code with any neighbor of their choice electronically or by any other method of transmission. 
#  5) b) The LICENCSE AGREEMENT, ACKNOWLEDGEMENTS, Header and Instructions must remain attached to the code when re-distributed.
#  5) c) Any user of this program is granted the freedom to sell this software as distributed or to bundle it with other software or salable goods.
#  6) a) Any user of this program is granted the freedom to modify and improve the code.
#  6) b) When modified or improved, any user of this program is granted the freedom of re-distribution of their modified code if and only if the user attatchs the LICENSE AGREEMENT
#        in its entirety to their modified code before re-distribution.
#  6) c) Any user of this software is granted the freedom to sell their modified copy of this software or to bundle their modified copy with other software or salable goods.
#  7) a) Any user of this program is granted the freedom to run this code on any computer of their choice.
#  7) b) Any user of this program is granted the freedom to run as many simultaneous instances of this code, on as many computers as they are able to and desire, and for as long as they desire and are
#        able to do so with any degree of simultaneity in use. 
#  WHAT MUST A "USER" NOT DO WITH THIS PROGRAM ?
#  8) Any user of this program is not granted the freedom to procur a patent for the methods presented in this software, and agrees not to do so.
#  9) Any user of this program is not granted the freedom to arbitrarily procur a copyright on this software as presented, and agrees not to do so.
#  10) Any user of this program is not granted the freedom to obtain or retain intelectual property rights on this software as presented and agrees not to do so.
#  11) a) Any user of this program may use this software as part of a patented process, as a substitutable input into the process; however the user agrees not to attempt to patent this software as part of their patented process. 
#      b) This software is a tool, like a hammer, and may be used in a process which applies for and gains a patent, as a substitutable input into the process;
#         however the software tool itself may not be included in the patent or covered in the patent as a novel invention, and the user agrees not to do this and not to attempt to do this.
#  WHO GRANTS THESE FREEDOMS ?
#  10) The creators of this software are the original developer, and anyone listed as being a member of the Endwall Development Team, as well as ancillary contributors, and user modifiers and developers of the software. 
#  11) The aformentioned freedoms of use listed in sections 4),5),6),and 7) are granted by the creators of this software and the Endwall Development Team to any qualifying user listed in section 1) and 
#      comporting with any restrictions or qualifications mentioned in sections 2), 3), 8), 9), 10) and 11) of this LICENSE AGREEMENT.
#  WHAT RELATIONSHIP DO THE USERS HAVE WITH THE CREATORS OF THE SOFTWARE ?
#  12)  This software is distributed without any warranty and without any guaranty and the creators do not imply anything about its usefulness or efficacy.
#  13)  If the user suffers or sustains financial loss, informational loss, material loss, physical loss or data loss as a result of using, running, or modifying this software 
#       the user agrees that they will hold the creators of this software, the "Endwall Development Team" and the programers involved in its creation, free from prosecution, 
#       free from indemnity, and free from liability, and will not attempt to seek restitution or renumeration for any such loss real or imagined.
#  END OF LICENSE AGREEMENT
##################################################################################################################################################################################
#  ADITIONAL NOTES:
#  14)  If a user finds a significant flaw or makes a significant improvement to this software, please feel free to notify the original developers so that we may also
#       include your user improvement in the next release; users are not obligated to do this, but we would enjoy this courtesy tremendously.
#
#  15)  Sections 0) a) 0) b) and 1) a) are sufficient for use; however sections 1) b) through 1) h) are presented to clarify 1 a) and to enforce non-discrimination and non-exlusion of use.  
#       For example some people may choose to redefine the meaning of the words "person" "human being" or "sentient individual" to exclude certain types of people.
#       This would be deemed unacceptable and is specifically rejected by the enumeration presented.  If the wording presented is problematic please contact us and suggest a change,
#       and it will be taken into consideration.  
#################################################################################################################################################################################

##  get input list from shell argument 

unsorted=$1

# randomly sort this list
sort -R $unsorted > temp.srt

list=temp.srt

for link in $(cat "$list" ); do  

# pick a random user agent
n=$( calc $(head -c2 /dev/urandom | od -A n -i) % 15  | awk '{print $1}')
# set the user agent
#echo "$n"
if [ $n -le 5 ]
then 
UA="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:4$n.0) Gecko/20100101 Firefox/4$n.0"
else 
 case $n in 
 ( 6 )  UA="Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0" ;;
 ( 7 )  UA="Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0" ;;
 ( 8 )  UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0" ;;
 ( 7 )  UA="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36" ;;
 ( 9 )  UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36" ;;
 ( 10 ) UA="Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.0 Safari/537.36" ;;
 ( 11 ) UA="Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36" ;;
 ( 12 ) UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36" ;;
 ( 13 ) UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36" ;;
 ( 14 ) UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36" ;;
 esac
fi
echo "$UA"

# generate a random number time delay
delay=$(calc 20+$(head -c 2 /dev/urandom | od -A n -i) % 180 | awk '{print $1}')

echo "Delaying download for "$delay" seconds"
# wait by delay time
sleep "$delay"
echo "Downloading "$link""
# initiate download and change user agent
torsocks youtube-dl --user-agent "$UA" "$link" 
done
# sometimes the download cuts off so don't delete the file until its all done
rm "$list"

exit 0
 
