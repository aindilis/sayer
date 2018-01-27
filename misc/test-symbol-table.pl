#!/usr/bin/perl -w

use Clear;

foreach my $key (keys %Mod::) {
  if ($key =~ /::$/) {
    print $key."\n";
  }
}
