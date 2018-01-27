package Rival::Symbol::Table::Symbol;

use Class::MakeMethods::Standard::Hash
  (
   new => 'new',
   scalar => [qw(Name Package)]
  );

1;
