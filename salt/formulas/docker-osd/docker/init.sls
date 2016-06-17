set apt to works with https:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates

configure docker repository:
  pkgrepo.managed:
    - humanname: Docker repository
    - name: deb https://apt.dockerproject.org/repo ubuntu-trusty main
    - dist: ubuntu-trusty
    - file: /etc/apt/sources.list.d/docker.list
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - keyserver: p80.pool.sks-keyservers.net
    - refresh_db: true
    - require_in:
      - pkg: install docker engine
    - require:
      - pkg: set apt to works with https

install docker engine:
  pkg.installed:
    - name: docker-engine

configure docker to listen on all interfaces:
  file.managed:
    - name: /etc/default/docker
    - source: salt://docker/files/docker.cfg

restart daemon when configuration change:
  cmd.wait:
    - name: service docker restart
    - watch:
      - file: configure docker to listen on all interfaces
