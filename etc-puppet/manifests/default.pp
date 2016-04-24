node default {
  class { 'puppet::master':
    environments    => 'directory',
    environmentpath => '/etc/puppet/env',
    autosign        => true,
  }
  ->
  file {
    [
      '/etc/puppet/env',
      '/etc/puppet/env/production',
      '/etc/puppet/env/development',
      '/etc/puppet/env/production/manifests',
      '/etc/puppet/env/development/manifests',
      '/etc/puppet/env/production/modules',
      '/etc/puppet/env/development/modules',
    ]:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}
