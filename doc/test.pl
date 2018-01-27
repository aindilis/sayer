#!/usr/bin/perl -w

# this is a silly system to just state things about data structures,
# etc.

# can something be two things, in the same context?

# don't use assertions, but use some other form of knowledge
# representation

# Example of what not to do:
# {
#  "?X is longer than ?Y",
#  "?X is capitalized",
# }


# we want to say things that hold true of data structures

# for instance

(eval 'my $string1 = "this is a string" and substr($string1,0,4) eq "this";') == 1;

# this is kind of equivalent to saying 

["isa", substr($string1,0,4), "this"]

# what I'm getting at

["isa", substr($string1,0,4), "InDictionary"]

# but "InDictionary" is too vague, we need something like

["IsTrue", $dict->Contains(substr($string1,0,4))]

# or

# the key here is to store the code as the knowledge itself, and use
# the code to prove things, prove things about data structures/code

$linkgrammar->IsSentence($string1);

# so that eventually you have a huge base of facts that can be used to
# help to recognize efficiently certain things, e.g.

# rather than test over every possible thing that might be true, you
# can detect features of things that could be true

# for instance

my $string2 = "/usr/bin/test";

# the feature

substr($string2,0,1) eq "/"

# suggests we check if the whole thing is a file name

# being a file name, we can suggest to detect whether the file exists
# on this filesystem, i.e.

-f $string2

# the software may eventually learn efficient (for lack of a better
# word) decision trees that it can use to quickly "recognize"
# important facts about datastructures.

# question, how do we represent variable results, i.e. '`date`'

# so code segments are stored as text and then become subject to the
# same rules as data structures!

# how do we cache results of fixed functions?
