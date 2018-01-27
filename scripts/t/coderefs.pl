#!/usr/bin/perl -w

use Data::Dumper;

my $sub = sub {print $_};

my $dumped = Dumper($sub);
print $dumped."\n\n";

eval $dumped;
my $thing = $VAR1;

print Dumper($thing)."\n\n";
