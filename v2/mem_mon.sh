#!/bin/bash

count=1

while :
do
    res=$(top -b -n 1 | grep "KiB Mem"  | sed 's/,/ /g') 
    echo ${res} | awk -v count=${count} \
    '{ if($2 ~ /Mem/ && ((count)%20 == 1)) {\
          print "---Time---|---Total---|---Used---|---Used(%)---" \
       } else if ($2 ~/Mem/) { \
    	       total = $4; \
               free = $6; \
               used = $8; \
               bufche = $10; \
    	   printf(" %s | %10s|%10s| %5s\n", strftime("%H:%M:%S"), total, used, used/total); \
       } \
    }'
    
    sleep 1
    count=$((${count} + 1))
done
