# Discussion 10: NanOCaml Semantics

Due: Tuesday July 9th at 11:59:59PM

Points: 50P/50R/0S

## Introduction

We are implementing a stripped down version of OCaml called NanOCaml.
Today, we will focus only on the semantics of NanOCaml, in other words
writing the evaluator. You are expected to implement the `eval`
and `eval_dyn` functions (along with their helpers).

First, complete the exercise in [the notes](NOTES.pdf). Show a
teaching assistant your answer before continuing.

`eval` uses the environment semantics for lexically-scoped NanOCaml
from Figure 1 of the notes. You may find the `List.assoc_opt` function
helpful for looking things up in your environment.
`eval_dyn` uses the semantics of dynamically-scoped NanOCaml from
Figure 2. You will have written some of this yourself, so make sure you
get the rules right!

Our semantics define a partial function (i.e. not all inputs have
an output).  **If a term does not evaluate under our semantics, you
must raise an exception (any will do).** For example, attempting to
evaluate an unbound variable or apply something other than a function
would yield an error.

## The REPL

Once you've written the evaluator, our language pipeline will be complete.
You can write programs in your language and run them! Provided is an
interface to your language `OCAMLPATH=dep dune exec bin/repl.bc`.

As a challenge, try to discover a term in your language that doesn't terminate.
You can also extend NanOCaml to implement more and more features of real
OCaml. Or you can come up with your own unique language features.
