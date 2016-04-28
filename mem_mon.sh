#!/bin/bash

top -b -d 1 | sed 's/,/ /g' |awk \
"BEGIN{ count=0; }"\
'{ if($2 ~ /Mem/ && ((++count)%20 == 1)) {\
      print "---Time---|---Total---|---Used---|---Used(%)---" \
   } else if ($2 ~/Mem/) { \
	   total = $4; \
           free = $6; \
           used = $8; \
           bufche = $10; \
	   printf(" %s | %10s|%10s| %5s\n", strftime("%H:%M:%S"), total, used, used/total); \
   } \
}'
