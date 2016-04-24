#! /bin/sh

[ `id -u` -ne 0 ] && exec sudo $0 $*

( exec docker run --rm \
    -h puppet.catbert.net \
    --name puppetmaster \
    -v $PWD/etc:/etc/puppetlabs \
    -v $PWD/log:/var/log/puppetlabs \
    -p 8140:8140 \
    puppetmaster \
    /opt/puppetlabs/bin/puppetserver foreground \
  >puppetmaster.out \
  2>puppetmaster.err & \
) &


