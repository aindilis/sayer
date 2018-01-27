#!/usr/bin/perl -w

use Data::Dumper;
use Tie::MLDBM;

my %args;
$args{Password} ||= `cat /etc/myfrdcsa/config/perllib`;
chomp $args{Password};
tie %cache, 'Tie::Hash', 
  {
   'db'        =>  "mysql:database=sayer",
   'table'     =>  'data',
   'key'       =>  'id',
   'user'      =>  'root',
   'password'  =>  $args{Password},
   'CLOBBER'   =>  0
  } or die $!;


$cache{"Test"} = 2;
