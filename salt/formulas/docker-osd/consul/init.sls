{% set consul_version = '0.6.3' %}
{% set consul_sha1 = 'b0532c61fec4a4f6d130c893fd8954ec007a6ad93effbe283a39224ed237e250' %}
{% set consul_configdir = '/etc/consul.d' %}
{% set consul_datadir = '/tmp/consul' %}
{% set consul_if = pillar['scality']['prod_iface'] %}

include:
  - docker
  - osd

install consul {{ consul_version }}:
  pkg.installed:
    - name: unzip
  archive.extracted:
    - name: /usr/local/bin
    - source: https://releases.hashicorp.com/consul/{{ consul_version }}/consul_{{ consul_version }}_linux_amd64.zip
    - source_hash: sha256={{ consul_sha1 }}
    - archive_format: zip
    - if_missing: /usr/local/bin/consul
    - require:
      - pkg: install consul {{ consul_version }}
  file.managed:
    - name: /usr/local/bin/consul
    - mode: 0755
    - require:
      - archive: install consul {{ consul_version }}

consul data directory:
  file.directory:
    - name: {{ consul_datadir }}
   
consul configuration directory:
  file.directory:
    - name: {{ consul_configdir }}

#run consul:
#  cmd.run:
#    - name: nohup /usr/local/bin/consul agent -server -bind={{ grains['ip_interfaces'][consul_if][0] }} -config-dir={{ consul_configdir }} -data-dir={{ consul_datadir }} &
#    - unless: pgrep consul
#    - require:
#      - file: consul data directory
#      - file: consul configuration directory
