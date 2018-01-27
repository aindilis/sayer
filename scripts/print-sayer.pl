#!/usr/bin/perl -w

use Sayer;

my $sayer = Sayer->new
  (DBName => $ARGV[0] || "sayer");

$sayer->PrintAllInformation;

