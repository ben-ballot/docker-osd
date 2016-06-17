SERVERS = [
    { :name => 'centos6-supervisor', :ip => '172.16.69.10', :box => 'bento/centos-6.7', :sup_ip => '172.16.69.10' },
    { :name => 'centos6-store-1', :ip => '172.16.69.11', :box => 'bento/centos-6.7', :sup_ip => '172.16.69.10' },
    { :name => 'centos6-store-2', :ip => '172.16.69.12', :box => 'bento/centos-6.7', :sup_ip => '172.16.69.10' },
    { :name => 'centos6-store-3', :ip => '172.16.69.13', :box => 'bento/centos-6.7', :sup_ip => '172.16.69.10' },
    { :name => 'centos6-connectors-1', :ip => '172.16.69.20', :box => 'bento/centos-6.7', :sup_ip => '172.16.69.10' },
    { :name => 'centos6-connectors-2', :ip => '172.16.69.21', :box => 'bento/centos-6.7', :sup_ip => '172.16.69.10' },
    { :name => 'trusty-supervisor', :ip => '172.16.70.10', :box => 'ubuntu/trusty64', :sup_ip => '172.16.70.10' },
    { :name => 'trusty-store-1', :ip => '172.16.70.11', :box => 'ubuntu/trusty64', :sup_ip => '172.16.70.10' },
    { :name => 'trusty-store-2', :ip => '172.16.70.12', :box => 'ubuntu/trusty64', :sup_ip => '172.16.70.10' },
    { :name => 'trusty-store-3', :ip => '172.16.70.13', :box => 'ubuntu/trusty64', :sup_ip => '172.16.70.10' },
    { :name => 'trusty-connectors-1', :ip => '172.16.70.20', :box => 'ubuntu/trusty64', :sup_ip => '172.16.70.10' },
    { :name => 'trusty-connectors-2', :ip => '172.16.70.21', :box => 'ubuntu/trusty64', :sup_ip => '172.16.70.10' },
    { :name => 'docker-swarm-1', :ip => '172.16.70.101', :box => 'ubuntu/trusty64', :sup_ip => '172.16.70.10' },
    { :name => 'docker-swarm-2', :ip => '172.16.70.102', :box => 'ubuntu/trusty64', :sup_ip => '172.16.70.10' }
]

DISKS = [
    { :id => 1, :path => 'ssd01.vmdk', :ssd => 'on', :size => 10240 },
    { :id => 2, :path => 'ssd02.vmdk', :ssd => 'on', :size => 10240 },
    { :id => 3, :path => 'disk03.vmdk', :ssd => 'off', :size => 10240 },
    { :id => 4, :path => 'disk04.vmdk', :ssd => 'off', :size => 10240 },
    { :id => 5, :path => 'disk05.vmdk', :ssd => 'off', :size => 10240 },
    { :id => 6, :path => 'disk06.vmdk', :ssd => 'off', :size => 10240 },
    { :id => 7, :path => 'disk07.vmdk', :ssd => 'off', :size => 10240 },
    { :id => 8, :path => 'disk08.vmdk', :ssd => 'off', :size => 10240 },
    { :id => 9, :path => 'disk09.vmdk', :ssd => 'off', :size => 10240 },
    { :id => 10, :path => 'disk10.vmdk', :ssd => 'off', :size => 10240 }
]
