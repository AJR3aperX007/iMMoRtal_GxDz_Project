#!/bin/bash


# Run Lynis Scan and output to log to Desktop

sudo lynis audit system >> /home/sysadmin/Desktop/lsystem_scan.log

cat /home/sysadmin/Desktop/lsystem_scan.log
