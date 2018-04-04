#!/bin/bash
docker build -t basex_centos ./
mkdir -p ~/work/basex_centos/data
docker run -d -it -p 1984:1984 --volume ~/work/basex_centos/data:/usr/local/lib/basex/basex/data basex_centos
