#!/bin/bash

DISK=$1
count=1

if [[ ${DISK} == "" ]];then
    echo "Usage:$0 [sda | sdb | sdc ...]"
    exit 127
fi

while :
do
    res=$(iostat -xm | grep ${DISK})
    echo ${res} | awk  -v disk="${DISK}" -v count=${count} \
    '{ if($1 ~disk && ((count)%20 == 1)) {\
          print "---Time---|-rrqm/s-|-wrqm/s-|--r/s--|--w/s--|--rMB/s--|--wMB/s--|-avgrq-sz-|-avgqu-sz-|-await-|-r_await-|-w_await-|--%utili--"; \
       } else if ($1 ~disk) { \
    	   printf(" %s | %7s| %7s| %6s| %6s| %8s| %8s| %9s| %9s|%7s|%9s|%9s|%7s\n"\
		,strftime("%H:%M:%S"),$2, $3, $4, $5, $6, $7, $8, $9,$10,$11,$12,$14);\
       }\
    }'
    
    sleep 1
    count=$((${count} + 1))
    
done 
