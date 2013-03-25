class jenkins(
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
  #include jenkins::repo
  include jenkins::package
  include jenkins::service

  class { 'jenkins::config':
    home               => $home,
    java_cmd           => $java_cmd,
    user               => $user,
    java_options       => $java_options,
    port               => $port,
    ajp_port           => $ajp_port,
    debug_level        => $debug_level,
    enable_access_log  => $enable_access_log,
    handler_max        => $handler_max,
    handler_idle       => $handler_idle,
    args               => $args
  }

  #Class['jenkins::repo'] ->
  Class['jenkins::package'] ->
  Class['jenkins::config'] -> Class['jenkins::service']
}
# vim: ts=2 et sw=2 autoindent
