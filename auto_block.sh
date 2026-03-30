#!/bin/bash

grep "FAIL LOGIN" /var/log/vsftpd.log | awk '{print $(NF-3)}' | sort | uniq -c | while read count ip
do
    if [ $count -gt 5 ]; then
        echo "Blocking $ip"

        iptables -C INPUT -s $ip -j DROP 2>/dev/null
        if [ $? -ne 0 ]; then
            iptables -A INPUT -s $ip -j DROP
        fi
    fi
done
