package Rival::Symbol::Table::Package;

use base 'Rival::Symbol::Table::Symbol';

use Data::Dumper;

use Class::MakeMethods::Standard::Hash
  (
   new => 'new',
   scalar => [qw()]
  );

sub SubPackages {
  my ($self,%args) = @_;
  foreach my $key (keys %main::) {
    if ($key =~ /::$/) {
      print $key."\n";
    }
  }
}

1;
