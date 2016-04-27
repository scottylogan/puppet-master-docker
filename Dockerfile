FROM debian:jessie
MAINTAINER Scotty Logan <scotty@catbert.net>

USER root

COPY setup.sh /setup.sh
RUN /setup.sh
COPY default-puppetserver /etc/default/puppetserver

VOLUME /etc/puppetlabs
VOLUME /var/log/puppetlabs
VOLUME /opt/puppetlabs/server/data

EXPOSE 8140
CMD /opt/puppetlabs/bin/puppetserver foreground
