sub Sub1 {
  require System::LinkParser;
  my $lp = System::LinkParser->new;
  $lp->CheckSentence(Sentence => $_) > 0;
}

sub Sub2 {
  -f $_;
}

sub Sub3 {
  -d $_;
}

# assemble a corpus of expressions, that we can use to build tests,
# etc.  use the PPI to get it
