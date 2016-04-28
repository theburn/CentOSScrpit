#!/bin/bash

ifdev=$1
mon_file=/proc/net/dev
split_num=0



if [[ ${ifdev} == "" ]];then
    echo "Usage: $0 [em1 | eth0 | enp0s25 ...]"
    exit 127
fi


while :
do

if_res=$(cat ${mon_file} | grep ${ifdev})
old_recv=$(echo ${if_res} | awk '{print $2}')
old_send=$(echo ${if_res} | awk '{print $10}')

sleep 1

split_num=$(($split_num+1))
if_res=$(cat ${mon_file} | grep ${ifdev})

echo ${if_res} | awk -v num=${split_num} -v dev=${ifdev}  \
                     -v old_recv=${old_recv} -v old_send=${old_send} \
			'{if($1 ~dev && (num%20 == 1)) {\
		            print "---Time---|---IFDev---|-Send(KB/s)-|-Recv(KB/s)-" \
			} else if($1 ~dev) {\
                            new_recv=$2; \
                            new_send=$10; \
			    printf(" %s | %10s|%12s| %8s\n", strftime("%H:%M:%S"), dev, (new_send-old_send)/1024, (new_recv-old_recv)/1024); \
			}\
			}'
done


