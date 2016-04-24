FROM debian:jessie
MAINTAINER Scotty Logan <scotty@catbert.net>

USER root

RUN apt-get -qq update && \
    apt-get -qq dist-upgrade && \
    apt-get -qq install curl less git && \
    curl -o /tmp/pl.deb https://apt.puppetlabs.com/pool/jessie/PC1/p/puppetlabs-release-pc1/puppetlabs-release-pc1_0.9.2-1jessie_all.deb && \
    dpkg -i /tmp/pl.deb && \
    apt-get -qq update && \
    apt-get -qq install puppet-agent puppetserver && \
    /opt/puppetlabs/puppet/bin/gem install r10k librarian-puppet

RUN rm -rf /etc/puppet /etc/puppetlabs /var/log/puppetlabs && \
    mkdir /etc/puppetlabs /var/log/puppetlabs

RUN ssh-keyscan    github.com gitlab.com >/etc/ssh/ssh_known_hosts && \
    ssh-keyscan -H github.com gitlab.com >>/etc/ssh/ssh_known_hosts
COPY ssh ~root/.ssh

VOLUME /etc/puppetlabs
VOLUME /var/log/puppetlabs

EXPOSE 8140
CMD /opt/puppetlabs/bin/puppetserver foreground
