package Rival::Symbol::Table;

use Rival::Symbol::Table::Package;

use Data::Dumper;

use Class::MakeMethods::Standard::Hash
  (
   scalar => [qw(Root)]
  );

sub new {
  my ($self,%args) = @_;
  my $a = Rival::Symbol::Table::Package->new
    (
     Name => "main::",
     Package => undef,
    );
  # print ref($a), "\n", $a->isa('Rival::Symbol::Table::Symbol'), "\n";
  print Dumper($a);
}

1;
