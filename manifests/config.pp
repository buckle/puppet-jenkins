class jenkins::config (
  $home               = $jenkins::params::home,
  $java_cmd           = $jenkins::params::java_cmd,
  $user               = $jenkins::params::user,
  $java_options       = $jenkins::params::java_options,
  $port               = $jenkins::params::port,
  $ajp_port           = $jenkins::params::ajp_port,
  $debug_level        = $jenkins::params::debug_level,
  $enable_access_log  = $jenkins::params::enable_access_log,
  $handler_max        = $jenkins::params::handler_max,
  $handler_idle       = $jenkins::params::handler_idle,
  $args               = $jenkins::params::args
) inherits jenkins::params {
  file { 'jenkins configuration file':
    owner         => root,
    group         => root,
    mode          => 600,
    path          => $::osfamily ? {
      'RedHat'    => '/etc/sysconfig/jenkins',
      'Debian'    => '/etc/default/jenkins',
      default     => '/etc/default/jenkins',
    },
    content       => template('jenkins/jenkins.erb')
  }
}

