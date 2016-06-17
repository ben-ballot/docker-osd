# docker-osdSetup consul
############

# On consul master
consul agent -server -data-dir /tmp/consul --bootstrap-expect 1 -bind=172.16.70.101 -config-dir=/etc/consul.d -node=swarm-1 &

# On consul members
consul agent -data-dir /tmp/consul  -bind=172.16.70.102 -config-dir=/etc/consul.d  &
consul agent -data-dir /tmp/consul -bind=172.16.70.20 -config-dir=/etc/consul.d -node=conn-1 &


# Result is :
root@docker-swarm-1:~# consul members
    2016/06/17 12:19:14 [INFO] agent.rpc: Accepted client: 127.0.0.1:55665
    Node            Address             Status  Type    Build  Protocol  DC
    conn-1          172.16.70.20:8301   alive   client  0.6.3  2         dc1
    docker-swarm-2  172.16.70.102:8301  alive   client  0.6.3  2         dc1
    swarm-1         172.16.70.101:8301  alive   server  0.6.3  2         dc1

Setup OSD
################
osd -d -f /opt/go/src/github.com/libopenstorage/openstorage/etc/config/config.yaml --kvdb=consul-kv://127.0.0.1:8500 &

Create NFS volume
#################
osd nfs create vol01
docker volume create -d nfs --name=vol01
docker run --volume-driver=nfs -v vol01:/ring --rm -ti ubuntu bash
