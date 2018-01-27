#!/usr/bin/perl -w

use Data::Dumper;

require System::LinkParser;

my $lp = System::LinkParser->new;

my $object1 = "This is great.";

print Dumper($lp->CheckSentence(Sentence => $object1));
