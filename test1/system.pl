#!/usr/bin/perl -w

use Data::Dumper;

my ($count_data,$count_code) = (0,0);
my ($illgraph,$graph,$data,$code,$igraph,$idata,$icode,@tmp) = HashRefs();

my $debug = 0;

sub HashRefs {
  # could even do this with the symbol table
  my @l;
  foreach my $i (1..100) {
    push @l, {};
  }
  return @l;
}

# we need some data and functions

# data
my $c = `cat doc.pl`;
foreach my $line (split /\n/, $c) {
  AddData($line);
}

sub GetDataID {
  $tmp = Dumper(\@_);
  if (exists $idata->{$tmp}) {
    return $idata->{$tmp};
  }
}

sub AddData {
  $tmp = Dumper(\@_);
  if (! exists $idata->{$tmp}) {
    $data->{$count_data} = $tmp;
    $idata->{$tmp} = $count_data;
    $count_data++;
    return 1;
  } else {
    return 0;
  }
}

print Dumper($data) if $debug;

# functions
# just use a few functions for now to test it out

my @functions =
  (
   # 'sub {print Dumper($_[0])}',
   'sub {split / /, $_[0]}',
   'sub {substr $_[0], 0, 10}',
   'sub {uc $_[0]}',
   'sub {lc $_[0]}',
  );

foreach my $function (@functions) {
  $code->{$count_code} = $function;
  $icode->{$function} = $count_code;
  ++$count_code;
}

print Dumper($code) if $debug;

# now, go about constructing a graph from this

# for now, just iterate over everything, a few layers deep

my $finished;
while (! $finished) {
  $finished = 1;
  foreach my $dataid (keys %$data) {
    # eval each function on each data point and add to the graph
    foreach my $codeid (keys %$code) {
      # print "executing code $codeid on data $dataid and storing result\n";
      # obtain code ref
      my $c1 = $code->{$codeid};
      my $cref = eval $c1;

      # obtain data list
      my $d1 = $data->{$dataid};
      $VAR1 = undef;
      eval $d1;
      my @dlist = @$VAR1;
      $VAR1 = undef;

      # execute the code on the data
      my @res = $cref->(@dlist);
      # need to store this

      $finished *= ! AddData(@res);

      my $resultid = GetDataID(@res);
      if (! defined $resultid) {
	die "id not defined: ".Dumper(\@res)."\n\n";
      }
      # now store the result of the execution

      $graph->{$dataid}->{$codeid} = $resultid;
      $igraph->{$resultid}->{$codeid} = $dataid;

      $illgraph->{$data->{$dataid}}->{$code->{$codeid}} = $data->{$resultid};

      # print Dumper([$c1,\@dlist,\@res]);#  if $debug;
    }
  }
}

print Dumper($illgraph);
