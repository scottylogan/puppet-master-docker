FROM debian:jessie
MAINTAINER Scotty Logan <scotty@catbert.net>

USER root

RUN setup.sh

COPY ssh ~root/.ssh

VOLUME /etc/puppetlabs
VOLUME /var/log/puppetlabs

EXPOSE 8140
CMD /opt/puppetlabs/bin/puppetserver foreground
