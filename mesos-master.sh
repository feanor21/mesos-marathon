IP=$( ip addr |grep inet |grep 192 |cut -d ' ' -f6 |cut -f1 -d '/')

docker start zookeeper

#nohup sudo mesos-master --work_dir=/data/mesos/master --log_dir=/root/mesos/log --quorum=1 --ip=$IP --cluster=datalab

#nohup sudo mesos-master --work_dir=/data/mesos/master  --no-hostname_lookup --log_dir=/root/mesos/log --quorum=1 --ip=$IP --cluster=datalab \
#--zk=zk://192.168.2.14:3000,192.168.2.11:3000,192.168.2.12:3000,/mesos &

nohup sudo mesos-master --work_dir=/data/mesos/master \
--no-hostname_lookup	 --log_dir=/root/mesos/log --quorum=1 --ip=$IP --cluster=datalab \
--zk=zk://192.168.2.14:3000/mesos &
