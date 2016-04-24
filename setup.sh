#! /bin/bash

curl -o /tmp/pl.deb https://apt.puppetlabs.com/pool/jessie/PC1/p/puppetlabs-release-pc1/puppetlabs-release-pc1_1.0.0-2jessie_all.deb
dpkg -i /tmp/pl.deb
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
echo 'deb https://deb.nodesource.com/node_4.x jessie main' > /etc/apt/sources.list.d/nodesource.list
apt-get -qq update
apt-get -qq dist-upgrade
apt-get -qq install curl less git puppet-agent puppetserver nodejs

/opt/puppetlabs/puppet/bin/gem install r10k librarian-puppet

rm -rf /etc/puppet /etc/puppetlabs /var/log/puppetlabs
mkdir /etc/puppetlabs /var/log/puppetlabs

ssh-keyscan    github.com gitlab.com  >/etc/ssh/ssh_known_hosts
ssh-keyscan -H github.com gitlab.com >>/etc/ssh/ssh_known_hosts

