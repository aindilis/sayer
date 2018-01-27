#!perl -T

use Test::More tests => 4;

BEGIN {
	use_ok( 'Org::FRDCSA::Sayer' );
	use_ok( 'Org::FRDCSA::Sayer::DBDHash' );
	use_ok( 'Org::FRDCSA::Sayer::Preconditions' );
	use_ok( 'Org::FRDCSA::Sayer::Tie' );
}

diag( "Testing Org::FRDCSA::Sayer $Org::FRDCSA::Sayer::VERSION, Perl $], $^X" );
