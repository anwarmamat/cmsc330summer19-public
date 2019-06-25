# Discussion 8: Extended Regular Expressions

50P/50R/0S

## Introduction

We have provided a complete implementation of `P3` with one
modification. The `Regex.t` type is extended to support four
new forms: `Maybe`, `Plus`, `Chars`, and `Not`.

```ml
type t =
  | Empty
  | Char of char
  | Union of t * t
  | Concat of t * t
  | Star of t
  | Maybe of t
  | Plus of t
  | Chars of char list
  | Not of t
```

* `Maybe` is the `?` in a Ruby regular expression.
* `Plus` is the `+` in a Ruby regular expression.
* `Chars` is a character class in a Ruby regular expression.
   You may assume the character class list will be non-empty.
* `Not` negates a regular expression, `Not r` will accept
   anything that did not accept `r` and reject anything
   that `r` accepted.

Complete `disc.ml` by completing the pattern matching cases
for `nfa_of_regex` to support these extended forms.
(Hint: For the `Not` case you will have to use the
provided `normalize_states` function.)

**All `dune` commands must be prefixed with `OCAMLPATH=dep`
for the dependencies to be loaded correctly.**
