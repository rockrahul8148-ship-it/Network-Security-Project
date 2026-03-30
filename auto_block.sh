#!/bin/bash

grep "FAIL LOGIN" /var/log/vsftpd.log | awk '{print $NF}' | sort | uniq -c | while read count ip
do
    if [ "$count" -gt 5 ]; then
        echo "Blocking $ip"
        iptables -A INPUT -s $ip -j DROP
    fi
done
