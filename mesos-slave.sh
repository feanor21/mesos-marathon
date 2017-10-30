#!/bin/bash
IP=$( ip addr |grep inet |grep 192 |cut -d ' ' -f6 |cut -f1 -d '/')
rm -rf /meta/slaves/latest
chmod +rx -R /home/sympo/meso*
mkdir -p /home/sympo/mesos_log/
mkdir -p /home/sympo/mesos_slave_workdir 
nohup /usr/sbin/mesos-slave --master=zk://192.168.2.14:3000/mesos \
--advertise_ip=$IP \
--work_dir= /home/sympo/mesos_slave_workdir \
--no-hostname_lookup \
--log_dir=/home/sympo/mesos_log/ \
--attributes="rack:pc;zone:sympo;os:ubuntu" \
--containerizers=docker,mesos >> /home/sympo/mesos_log/slave-run.log 2>&1 & 


