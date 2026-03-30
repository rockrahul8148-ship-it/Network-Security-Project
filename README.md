# Automated Network Threat Detection & Response System

## 📌 Overview
This project demonstrates a basic SOC (Security Operations Center) workflow where a brute-force attack is detected and automatically blocked using firewall rules.

## 🛠️ Tools Used
- Kali Linux
- Metasploitable2
- Hydra
- Bash Scripting
- iptables

## ⚙️ Working
1. Hydra used to simulate brute-force attack  
2. Logs generated in /var/log/vsftpd.log  
3. detect.sh extracts attacker IP  
4. auto_block.sh blocks IP automatically  

## 🔍 detect.sh
```bash
#!/bin/bash
grep "FAIL LOGIN" /var/log/vsftpd.log | awk '{print $NF}' | sort | uniq -c
```
## 🚫 auto_block.sh
```bash
#!/bin/bash
grep "FAIL LOGIN" /var/log/vsftpd.log | awk '{print $NF}' | sort | uniq -c | while read count ip
do
  if [ $count -gt 5 ]; then
    echo "Blocking $ip"
    sudo iptables -A INPUT -s $ip -j DROP
  fi
done
```
