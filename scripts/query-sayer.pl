#!/usr/bin/perl -w

use Sayer;

use Data::Dumper;

my $sayer = Sayer->new
  (DBName => $ARGV[0] || "sayer");

my $content = $sayer->Data->{2};

print Dumper
  (
   [
    $sayer->IData->{"fsfjsijs"},
    exists $sayer->IData->{"fsfjsijs"},
    $sayer->IData->{$content},
    exists $sayer->IData->{$content},
   ],
  );

# if (! exists ) {
#   print "Doesn't\n";
# } else {
#   print "Does\n";
# }
