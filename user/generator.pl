#!/usr/bin/perl -w

use Test::Compile tests => 1;

# locate all the Perl Modules on the system and generate a file that 'use's them.

# perhaps the naive approach is wrong because ?certain modules use
# other modules?, so what we need may be to use all the base modules?

# at least check that they are valid modules

my $OUT;
open(OUT,">user.pl") or die "JFDJDFLD\n";
print OUT "#!/usr/bin/perl -w\n\n";
my $seen = {};

my $files = `locate -r '\\.pm\$'`;
foreach my $file (split /\n/, $files) {
  next if $file =~ /wine/;
  if (-f $file) {
    # obtain the name of the module
    my $name = `grep -E '^package' "$file"`;
    if ($name =~ /^\s*package\s*(.+);\s*$/) {
      my $packagename = $1;
      next if exists $seen->{$packagename};
      $seen->{$packagename} = 1;
      my $fn = $packagename;
      $fn =~ s/::/\//g;
      $fn .= ".pm";
      # make sure it is in the load path
      if (PerlModuleLoads(Module => $fn) and
	  PerlModuleCompiles(File => $file)) {
	print OUT "use $packagename;\n";
      } else {
	print "Does not load: $file\n";
      }
    }
  }
}

print OUT "print \"hi\\n\";\n";
close(OUT);

sub PerlModuleCompiles {
  my (%a) = @_;
  return pm_file_ok($a{File}, "Valid Perl module file") or 0;
}

sub PerlModuleLoads {
  my (%a) = @_;
  my @path = @INC;
  while (@path) {
    my $root = shift @path;
    my $it = "$root/$a{Module}";
    # print "$it\n";
    return 1 if -f $it;
  }
}
