#!/bin/bash

echo "Listing all users and home directories" > /var/log/sre_user_audit.log
cut -d: -f1,6 /etc/passwd >> /var/log/sre_user_audit.log

echo "Checking sudoers" >> /var/log/sre_user_audit.log
getent group sudo >> /var/log/sre_user_audit.log
