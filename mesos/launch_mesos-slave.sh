#!/bin/bash


/usr/sbin/mesos-slave --master=192.168.2.14:5050 \
--work_dir= /data/mesos/slave \
--log_dir=/data/mesos/log/ \
--attributes='rack:hadoop;zone:toto;os:centos7' \
--containerizers=docker,mesos >> /data/mesos/log/slave-run.log 2>&1 &





#/usr/sbin/mesos-slave --master=zk://zookeeper.datalab.com:2181/mesos \
#--work_dir= /data/mesos/slave \
#--log_dir=/data/mesos/log/ \
#--attributes='rack:dev;zone:toto;os:centos7' \
#--containerizers=docker,mesos >> /data/mesos/log/slave-run.log 2>&1 &

