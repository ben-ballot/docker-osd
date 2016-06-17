{% set goversion = '1.6' %}
{% set gosha1 = '5470eac05d273c74ff8bac7bef5bad0b5abbd1c4052efbdbc8db45332e836b0b' %}

include:
  - docker

install golang {{ goversion }}:
  archive.extracted:
    - name: /usr/local
    - source: https://storage.googleapis.com/golang/go{{ goversion }}.linux-amd64.tar.gz
    - source_hash: sha256={{ gosha1 }}
    - archive_format: tar
    - tar_options: v
    - if_missing: /usr/local/go
  file.directory:
    - name: /opt/go
    - user: root
    - group: root

{% set current_path = salt['environ.get']('PATH') %}
get osd sources:
  cmd.run:
    - name: go get -d github.com/libopenstorage/openstorage || true
    - env:
      - GOPATH: '/opt/go'
      - GOROOT: '/usr/local/go'
      - PATH: {{ [current_path, '/usr/local/go/bin:/opt/go/bin']|join(':') }}
    - require:
      - archive: install golang {{ goversion }}
      - file: install golang {{ goversion }}

compile osd:
  cmd.run:
    - name: cd $GOPATH/src/github.com/libopenstorage/openstorage && make install
    - env:
      - GOPATH: '/opt/go'
      - GOROOT: '/usr/local/go'
      - PATH: {{ [current_path, '/usr/local/go/bin:/opt/go/bin']|join(':') }}
    - unless: test -x $GOPATH/bin/osd
    - require:
      - cmd: get osd sources

osd configuration file:
  file.managed:
    - name: /opt/go/src/github.com/libopenstorage/openstorage/etc/config/config.yaml
    - source: salt://osd/files/config.yaml.{{ grains['fqdn'] }}
