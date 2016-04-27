#! /bin/sh

#[ `id -u` -ne 0 ] && exec sudo $0 $*

rm -rf data/puppetserver/.ssh data/puppetserver/.aws
cp -pr ssh data/puppetserver/.ssh
cp -pr aws data/puppetserver/.aws

( exec docker run --rm \
    -h puppet.catbert.net \
    --name puppetmaster \
    -v $PWD/etc:/etc/puppetlabs \
    -v $PWD/log:/var/log/puppetlabs \
    -v $PWD/data:/opt/puppetlabs/server/data \
    -p 8140:8140 \
    puppetmaster \
  >puppetmaster.out \
  2>puppetmaster.err & \
) &


