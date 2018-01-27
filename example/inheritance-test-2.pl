#!/usr/bin/perl -w

package Foo;

use PerlLib::SwissArmyKnife;

use Class::MethodMaker
  (
   new_with_init => 'new',
   get_set=> [qw(Bar Baz)]
  );

sub init {
  my ($self,%args) = @_;
  $self->Bar($args{Bar});
}


package BigFoo;

use PerlLib::SwissArmyKnife;

use base 'Foo';

use Class::MethodMaker
  (
   new_with_init => 'new',
   get_set => [qw(Zonk Zank)],
  );

sub init {
  my ($self,%args) = @_;
  print Dumper(\%args);
  $self->Zonk($args{Zonk});
  Foo->init(%args);
}

sub Bar {
  my ($self,@list) = @_;
  Foo->Bar(@list);
}

package main;

use Data::Dumper;

my $a = BigFoo->new
  (
   Bar => 1,
   Baz => 2,
   Zonk => 3,
  );

print ref($a), "\n", $a->isa('Foo'), "\n";
print Dumper($a);

print Dumper([$a->Bar,$a->Baz,$a->Zonk]);
