#! /bin/bash

echo '* Working around permission errors locally by making sure that "puppet" uses the same uid and gid as the host volume'
TARGET_UID=$(stat -c "%u" /etc/puppetlabs/puppet)
echo '-- Setting puppet user to use uid '$TARGET_UID
usermod -o -u $TARGET_UID puppet || true
TARGET_GID=$(stat -c "%g" /etc/puppetlabs/puppet)
echo '-- Setting puppet group to use gid '$TARGET_GID
groupmod -o -g $TARGET_GID puppet || true
echo
chown -R puppet:puppet /var/run/puppetlabs

/opt/puppetlabs/bin/puppetserver foreground
