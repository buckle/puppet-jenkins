class jenkins::firewall {
  if defined("firewall") and tagged("bke_firewall") {
    firewall { "500 allow jenkins inbound traffic":
      action => 'accept',
      state  => "NEW",
      dport  => [8080],
      proto  => "tcp",
    }
  }
}

