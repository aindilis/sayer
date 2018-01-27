#!/usr/bin/perl -w

# the goal of this program now is to memoize results of function calls

# as this already exists, let's check that out


# we need to find some way of indexing stored data structures

# use Memoize;

use Data::Dumper;

# so we can compute a graph which is a set of functions being performed on data

my ($graph,$data,$code,$igraph,$idata,$icode,@_) = HashRefs();

sub HashRefs {
  # could even do this with the symbol table
  my @l;
  foreach my $i (1..100) {
    push @l, {};
  }
  return @l;
}

# we need some data and functions

# so you take the data, and then you call functions on the data, and
# then store the results, with links between data

# i.e.

# $graph->{$datakey}->{$codekey} = $datakey2;
# $igraph->{$codekey}->{$datakey} = $datakey2;
# .
# .
# .
# .

# $data->{$datakey} = Dumper(["the data"]);
# $code->{$coderef} = 'evalable code';

# once we have this graph, we can arrive at chains of function
# execution over data structures, so we can represent interesting data
# in terms of lists of function executions, what we really want is trees

# each function application ought to have some justification, or is
# that very context dependent?

# for instance, if we have certain existing chains stemming from the
# graph, we can thus choose to execute a new function?  maybe watch
# the resources there.

# for instance, if we already have an edge:
# 'sub {$surnamelist->Contains($_)}' pointing to '$VAR1 = [1]', i.e. we know that it is a surname,
# then we might do some other thing to it.

# obviously, now what about taking multiple inputs, joining them, and
# passing them to a function?

# for instance, we have the data points ["Mary"] and ["John"], and we
# call code on [["Mary"],["John"]], like AreMarriedP()?



# as a side note, perhaps we can automatically detect through sporadic
# observations functions that change on input

# once we have that, we can then build proof trees?
# i.e.



# $ref = \&getGlobalName();


# maybe we can automatically determine some effective preconditions for calling...

# finding arrows that have the same result could be an interesting way
# of connecting things, for instance, if point function evaluations
# point to "Mary", when that shows that the inputs and/or functions
# have something in common




# here is an idea for some basic cognition

# suppose we have two halves of a piece of data.  the system might
# recognize that one half is abruptly terminated, maybe there is a
# function: SentenceFragmentP, well, if it can determine which half of
# the sentence has been cut off, it could then initiate a search
# through its data of something that would "fit", and find all
# possible matches, or rather the most likely match.

# could employ schizophrenic codebreaking logic here for whatever
# reason, just to have some basic abilities

# perhaps we can have goal oriented approach here.  for instance, if
# the goal is to figure out what the context of a given piece of
# information is, well then it may begin searching for relevant
# information, and or theorems.

# why would you call a function on a piece of data?  only if you
# thought that it might return something useful.  So based on what we
# already know about a piece of information, we should attempt to emake
# deductions.  How do we code those relationships?

# one thing, we probably don't want to diverse too much from the focus
# of the initial piece of data.  We aren't interested (necessarily) to
# the same degree on a particular word as we are the whole thing,
# unless that word happens to have something useful

# here is a rule, if we have a sentence:

# what is the meaning of the sentence?
# how does the sentence relate to the task at hand?

# we can prune conclusions for relevance

# we need to make use of predicates for storing knowledge.

# we can represent the code segments as data, and then we can point
# things like, 'IsaPredicateP($_[0])' to the code.  So if we have:

# [$data,'sub {IsaPredicateP($_[0]})','$VAR1 = [1];'] in the graph, we
# know that data is a predicate.

# we can then query over all the items that match
# [?X,?Y,'$VAR1 = [1];']
# and
# [?Y,'sub {IsaPredicateP($_[0]})','$VAR1 = [1];']

# obtain all the "truths" of the system, and likewise for '$VAR1 =
# [0];' for all the falsehoods.

# it must obviously be noted that we are right now knee deep in
# FreeKBS territory, and that the two projects mesh incredibly well,
# with a little working around the edges, such as adding deductions
# about how the data is stored, which all works right into the premise
# of the system, knowing things about data, i.e. whether the data is
# stored in arg3 as a data::dumper result or just a scalar string.  I
# wonder how you would represent that in the system:

# results that have trivial differences and are easily recomputed
# should be marked as such
