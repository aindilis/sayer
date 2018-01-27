#!/usr/bin/perl -w

use Sayer::DBDHash;

use Data::Dumper;

tie my %hash, 'Sayer::DBDHash', "test";

$hash{"this"} = "that";
$hash{"these"} = "those";

print $hash{"this"}."\n";
print Dumper([keys %hash]);
