#!/usr/bin/perl -w

# use System::Assert;
use BOSS::Config;
use Capability::NER;
use Corpus::Sources;
use Lingua::EN::Extract::Dates;
use Sayer;

use Data::Dumper;

$specification = q(
	-t		Truncate the databases
  );

my $config =
  BOSS::Config->new
  (Spec => $specification);
my $conf = $config->CLIConfig;
$UNIVERSAL::systemdir = "/var/lib/myfrdcsa/codebases/minor/sayer";

my $sayer = Sayer->new
  (
   Truncate => exists $conf->{'-t'},
  );

$UNIVERSAL::ne = Capability::NER->new
  (EngineName => "Stanford");
$UNIVERSAL::de = Lingua::EN::Extract::Dates->new;

my $mysql = PerlLib::MySQL->new
  (DBName => "unilang");

my $res = $mysql->Do
  (
   Statement => "select * from messages where Sender='UniLang-Client' and Contents != 'Register' and length(Contents) < 200 limit 100",
   Array => 1,
  );

foreach my $entry (@$res) {
  next unless $entry->[4] =~ /\w/;
  # we want to add the data and say that it is a unilang entry dumped

  # we want to be able to assert things about this data, such as this is a unilang entry (so it can extract the )

  # develop something that takes a bunch of entries and determines
  # what features qualify for something as being a unilang entry or
  # something.

  # perhaps we can add to the code execution tests for asserted knowledge of the data structure

  # operator learning can work here, i.e. learning planning steps

  # # $sayer->Assert(Data => [$entry], IsA => "hash ref containing the records of a unilang entry, instantiated")

  # have NL descriptions of properties

  # incorporate the tests that "file" command uses

  $sayer->Assert
    (
     Data => [$entry],
     Flags => {
	       "isa hash ref containing the records of a unilang entry, instantiated" => 1,
	      },
     Facts => [
	       [
		"isa",
		Sayer::Sp->new("<entryid>"),
		"hash ref containing the records of a unilang entry, instantiated",
	       ],
	      ],
    );

  $sayer->Analyze
    (
     Data => [$entry],
    );
}

# print Dumper($sayer);

