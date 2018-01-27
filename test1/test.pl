#!/usr/bin/perl -w

use Data::Dumper;

my $sub = sub {print Dumper($_[0])};
my @list = ("hi there");

$sub->(@list);
