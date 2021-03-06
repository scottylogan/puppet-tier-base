# == Class: base
#
# Full description of class base here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'base':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class base (
  # default values are in base/data
  $httpd_name,
  $tomcat_name,
  $jre_name,
  $jdk_name,
  $mod_ssl_name
) {

  package {
    [
      'curl',
      'openssl',
      'sudo',
      'unzip',
      'wget',
      'less',
      $jre_name,
      $jdk_name,
      $httpd_name,
      $tomcat_name,
    ]:
    ensure => latest,
  }

  if ($mod_ssl_name != 'none') {
    package { $mod_ssl_name:
      ensure => latest,
      require => Package[$httpd_name],
    }
  }

  file { '/etc/puppetlabs/code/hiera.yaml':
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => '0644',
    source => "puppet:///modules/${module_name}/hiera.yaml",
  }

  file { '/etc/tier':
    ensure => directory,
    owner  => 0,
    group  => 0,
    mode   => '0751',
  }

  file {
    [
      '/usr/local',
      '/usr/local/bin',
    ]:
    ensure => directory,
    owner  => 0,
    group  => 0,
    mode   => '0755',
  }

  file { '/usr/local/bin/tierconfig':
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => '0755',
    source => "puppet:///modules/${module_name}/tierconfig",
  }

}

