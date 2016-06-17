#!/usr/bin/make

snapshot_name ?= snap01 

# Centos 6
centos6_keys:
	docker-compose run --rm key_generator centos6-supervisor 10004 10004
	docker-compose run --rm key_generator centos6-store-1 10004 10004
	docker-compose run --rm key_generator centos6-store-1 10004 10004
	docker-compose run --rm key_generator centos6-connectors-1 10004 10004

centos6_up:
	vagrant up centos6-supervisor centos6-store-1 centos6-store-2 centos6-connectors-1

centos6_halt:
	vagrant halt centos6-supervisor centos6-store-1 centos6-store-2 centos6-connectors-1

centos6_reload: 
	vagrant reload centos6-supervisor centos6-store-1 centos6-store-2 centos6-connectors-1

centos6_snapshot:
	vagrant snap take centos6-supervisor --name "$(snapshot_name)"
	vagrant snap take centos6-store-1 --name "$(snapshot_name)"
	vagrant snap take centos6-store-2 --name "$(snapshot_name)"
	vagrant snap take centos6-connectors-1 --name "$(snapshot_name)"

centos6_gosnap:
	vagrant snap go centos6-supervisor --name $(snapshot_name)
	vagrant snap go centos6-store-1 --name $(snapshot_name)
	vagrant snap go centos6-store-2 --name $(snapshot_name)
	vagrant snap go centos6-connectors-1 --name $(snapshot_name)

clean_centos6:
	vagrant destroy -f centos6-supervisor centos6-store-1 centos6-store-2 centos6-connectors-1

# Centos 7
centos7_keys:
	docker-compose run --rm key_generator centos7-supervisor 10004 10004
	docker-compose run --rm key_generator centos7-store-1 10004 10004
	docker-compose run --rm key_generator centos7-store-2 10004 10004
	docker-compose run --rm key_generator centos7-connectors-1 10004 10004

centos7_up:
	vagrant up centos7-supervisor centos7-store-1 centos7-store-2 centos7-connectors-1

centos7_halt:
	vagrant halt centos7-supervisor centos7-store-1 centos7-store-2 centos7-connectors-1

centos7_reload: 
	vagrant reload centos7-supervisor centos7-store-1 centos7-store-2 centos7-connectors-1

centos7_snapshot:
	vagrant snapshot take centos7-supervisor $(snapshot_name)
	vagrant snapshot take centos7-store-1 $(snapshot_name)
	vagrant snapshot take centos7-store-2 $(snapshot_name)
	vagrant snapshot take centos7-connectors-1 $(snapshot_name)

centos7_gosnap:
	vagrant snapshot go centos7-supervisor $(snapshot_name)
	vagrant snapshot go centos7-store-1 $(snapshot_name)
	vagrant snapshot go centos7-store-2 $(snapshot_name)
	vagrant snapshot go centos7-connectors-1 $(snapshot_name)

clean_centos7:
	vagrant destroy -f centos7-supervisor centos7-store-1 centos7-store-2 centos7-connectors-1

# Ubuntu Trusty
trusty_keys:
	docker-compose run --rm key_generator trusty-supervisor 10004 10004
	docker-compose run --rm key_generator trusty-store-1 10004 10004
	docker-compose run --rm key_generator trusty-store-2 10004 10004
	docker-compose run --rm key_generator trusty-connectors-1 10004 10004

trusty_up:
	vagrant up trusty-supervisor trusty-store-1 trusty-store-2 trusty-store-3 trusty-connectors-1 trusty-connectors-2

trusty_halt:
	vagrant halt trusty-supervisor trusty-store-1 trusty-store-2 trusty-store-3 trusty-connectors-1 trusty-connectors-2

trusty_reload: 
	vagrant reload trusty-supervisor trusty-store-1 trusty-store-2 trusty-store-3 trusty-connectors-1 trusty-connectors-2

trusty_snapshot:
	vagrant snapshot take trusty-supervisor $(snapshot_name)
	vagrant snapshot take trusty-store-1 $(snapshot_name)
	vagrant snapshot take trusty-store-2 $(snapshot_name)
	vagrant snapshot take trusty-store-3 $(snapshot_name)
	vagrant snapshot take trusty-connectors-1 $(snapshot_name)
	vagrant snapshot take trusty-connectors-2 $(snapshot_name)

trusty_gosnap:
	vagrant snapshot go trusty-supervisor $(snapshot_name)
	vagrant snapshot go trusty-store-1 $(snapshot_name)
	vagrant snapshot go trusty-store-2 $(snapshot_name)
	vagrant snapshot go trusty-store-3 $(snapshot_name)
	vagrant snapshot go trusty-connectors-1 $(snapshot_name)
	vagrant snapshot go trusty-connectors-2 $(snapshot_name)

clean_trusty:
	vagrant destroy -f trusty-supervisor trusty-store-1 trusty-store-2 trusty-store-3 trusty-connectors-1 trusty-connectors-2
