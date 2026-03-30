#!/bin/bash
grep "FAIL LOGIN" /var/log/vsftpd.log \
| awk '{print $NF}' | sort | uniq -c

