#!/usr/bin/perl -w

use Sayer;

my $sayer = Sayer->new
  (
   Truncate => 1,
   DBName => $ARGV[0] || "sayer",
  );
