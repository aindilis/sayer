#!/usr/bin/perl -w

package Foo;

use Class::MakeMethods::Standard::Hash
  (
   new => 'new',
   scalar => [qw(Bar Baz)]
  );

package BigFoo;

use base 'Foo';
use Class::MakeMethods::Standard::Hash
  (
   scalar => [qw(Zonk Zank)],
  );

package main;

use Data::Dumper;

my $a = BigFoo->new(Bar=>1, Baz=>2, Zonk=>3);
print ref($a), "\n", $a->isa('Foo'), "\n";
print Dumper($a);
