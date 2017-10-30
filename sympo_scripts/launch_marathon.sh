#!/bin/bash

nohup sudo /home/sympo/mesos/marathon-1.4.3/bin/start --master zk://192.168.2.14:3000/mesos \
--zk zk://192.168.2.14:3000/marathon >> /home/sympo/marathon/log/marathon.log 2>&1 &

