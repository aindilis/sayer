use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Org::FRDCSA::Sayer',
    AUTHOR              => 'Andrew J. Dougherty <andrewdo@frdcsa.org>',
    VERSION_FROM        => 'lib/Org/FRDCSA/Sayer.pm',
    ABSTRACT_FROM       => 'lib/Org/FRDCSA/Sayer.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Org-FRDCSA-Sayer-*' },
);
