FROM debian:jessie
MAINTAINER Scotty Logan <scotty@catbert.net>

USER root

COPY setup.sh /setup.sh
RUN /setup.sh
COPY default-puppetserver /etc/default/puppetserver

VOLUME /etc/puppetlabs
VOLUME /var/log/puppetlabs
VOLUME /root/.ssh
VOLUME /opt/puppetlabs/server/data/puppetserver/.ssh
VOLUME /opt/puppetlabs/server/data/puppetserver/.aws

EXPOSE 8140
CMD /opt/puppetlabs/bin/puppetserver foreground
