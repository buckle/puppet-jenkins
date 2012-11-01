class jenkins::params {
  $home="/var/lib/jenkins"
  $java_cmd=""
  $user="jenkins"
  $java_options="-Djava.awt.headless=true"
  $port="8080"
  $ajp_port="8009"
  $debug_level="5"
  $enable_access_log="no"
  $handler_max="100"
  $handler_idle="20"
  $args=""
}