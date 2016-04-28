#!/bin/bash

top -b -d 1 |sed 's/,/ /g' |  awk \
"BEGIN{ count=0; }"\
'{ if($1 ~ /Cpu/ && ((++count)%20 == 1)) {\
      print "---Time---|---User---|---Sys---|---Nice---|---Idle---|---Wait---|---Hirq---|---Sirq---|---ST---|-Used(%)-"; \
   } else if ($1 ~/Cpu/) { \
	   us = $2;\
	   sy = $4; \
           ni = $6; \
           id = $8; \
           wa = $10; \
           hi = $12; \
           si = $14; \
           st = $16; \
	   printf(" %s | %9s|%9s| %9s| %9s| %9s| %9s| %9s| %7s| %5s\n",strftime("%H:%M:%S"),us, sy, ni, id, wa, hi, si, st,(100 - id));\
   }\
}'
