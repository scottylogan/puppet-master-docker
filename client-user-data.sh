#! /bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get -qq update
apt-get -qq install curl apt-transport-https
curl -o /tmp/pl.deb https://apt.puppetlabs.com/pool/jessie/PC1/p/puppetlabs-release-pc1/puppetlabs-release-pc1_1.0.0-2jessie_all.deb
dpkg -i /tmp/pl.deb
apt-get -qq update
apt-get -qq dist-upgrade
apt-get -qq install curl less git puppet-agent 

