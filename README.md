Sayer gets its name because it builds a context by asserting
interesting facts about arbitrary Perl data structures.  Sayer (along
with Thinker) is one of the most interesting projects of the FRDCSA.
What it does is index arbitrary perl data structures, and attempt to
derive interesting information and conclusions about that data using
machine learning.  For instance, if your data structure consisted of a
string, and that string contained a paragraph of text, sayer would
apply a decision tree or similar, set of tests, to determine that it
indeed was as we described.  It would represent this relation as a
graph, with verticies as data-points, I.e. the input, and "true", and
edges as function calls.  All data of course is stored to a database.
This graph data is then used as input to classifiers that attempt to
distill summarily interesting information about said data.  For
instance, if it is a sentence, it may well wish to perform various NLP
procedures, extracting things like named entities, and recursively
analyzing those within it's attention span.  It uses Perl as knowledge
representation interlingua.  The architecture is expansive, complex,
and beautiful and integrates many other FRDCSA systems.
