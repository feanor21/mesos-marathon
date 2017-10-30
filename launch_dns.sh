docker run -d --net=host -v /home/sympo/mesos-dns-config.json:/config.json mesosphere/mesos-dns -v=2 -config=/config.json
