#!/bin/sh
export PATH=/usr/local/bin:$PATH
cd "$(dirname $0)"
docker-compose run workstation