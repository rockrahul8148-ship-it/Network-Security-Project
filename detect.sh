#!/bin/bash

grep "FAIL LOGIN" /var/log/vsftpd.log | awk '{print $(NF-3)}' | sort | uniq -c

