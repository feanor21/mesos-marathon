#!/bin/bash
mesos-master --work_dir=/data/mesos/master \
--log_dir=/data/mesos/log \
--quorum=1 \
--zk=zk://zookeeper.datalab.com:2181/mesos \
--ip=192.168.1.14 \
--cluster=datalab >> /data/mesos/log/master-run.log 2>&1 &
