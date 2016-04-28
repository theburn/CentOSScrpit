#!/bin/bash

count=1

while :
do
   res=$(top -b -n 1    | grep "Cpu" |  sed 's/,/ /g')
   echo ${res} | awk  -v count=${count} \
   '{ if($1 ~ /Cpu/ && ((count)%20 == 1)) {\
         printf "---Time---|---User---|---Sys---|---Nice---|---Idle---|---Wait---|---Hirq---|---Sirq---|---ST---|-Used(%)-\n"; \
      } else if ($1 ~/Cpu/) { \
              us = $2;\
   	      sy = $4; \
              ni = $6; \
              id = $8; \
              wa = $10; \
              hi = $12; \
              si = $14; \
              st = $16; \
   	   printf(" %s | %9s|%9s| %9s| %9s| %9s| %9s| %9s| %7s| %5s\n",strftime("%H:%M:%S"),us, sy, ni, id, wa, hi, si, st,(100 - id));  \
      }\
   }'
   sleep 1
   count=$((${count} + 1))
done
