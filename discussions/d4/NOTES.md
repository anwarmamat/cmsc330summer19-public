# Notes 4: O'Cam El Exercises

Date: Tuesday June 12th

<!--- TIME: 40 minutes -->

## Why does OCaml feel different?

What's the biggest difference between OCaml and the languages
you've seen in other classes (i.e. Java and C)?

<!--- CUE: Give a few minutes for discussion and ask for answers.
      It's open-ended so just about anything is acceptable. -->

OCaml emphasizes functional programming whereas the other languages
emphasize imperative style. But what does this actually mean?
To answer this, it might be advantageous to think about something
more familiar.

## A digression

Let's think about the words statement and expression. These are
often thrown around, but what's the actual difference?

<!--- CUE: Give a few minutes for discussion and ask for answers. -->

Here's one way of thinking about it.

* An **expression** evaluates to a value.
* A **statement** doesn't.

In all the languages we know, `1 + 1` would be an expression because
it evaluates to a value, namely `2`. However, in Java we know that
the following is not an expression.

<!--- NOTE: Use the JShell repl for these. -->

```java
if (true) { int x; }
```

This does not evaluate to anything.

```java
System.out.println(if (true) { int x; });
```

If we attempt to run this, we get the following error.

```java
|  Error:
|  illegal start of expression
|  System.out.println(if (true) { int x; });
|                     ^
```

So, this is what we mean by expression and statement. However, there
is a catchphrase that captures another perspective. The catchphrase
is "statements do, expressions are."

Since statements don't evaluate to anything, really all we care about
is their side effects (i.e. their state mutation). With expressions
we typically care only about what the expression evaluates to. Often
(but not always) expressions have no side effects at all.

## Imperative and functional programs

With that distinction under our belts, we point out the central
difference between the two styles.

* An **imperative** program computes primarily through state-mutating
  operations (usually statements).
* A **functional** program computes primarily through evaluation of
  functions without side effects (usually only using expressions).

Here is an example of computing the factorial of a pre-existing
variable called `n` in both Java and OCaml.

```java
int result = 1;
for (int i = 2; i <= n; ++i) {
    result *= i;
}
```

In just this fragment of code, we have a bunch of state mutating
statements.

1. When `result` is initialized.
2. The entire for loop is another statement with several
   sub-statements.
3. The loop counter initializer `int i = 2;` is a statement.
4. So too is the increment operation `++i`.
5. The body of the loop is a statement and mutates variable `result`.

Contrast this with the OCaml version.

<!--- NOTE: Use the utop repl for this. -->

```ocaml
let rec fact m =
  if m = 0 then 1 else m * (fact (n-1))
in fact n
```

Here, everything is an expression. Additionally, none of these
expressions have any state mutation. No variables are ever assigned
to here. In fact, OCaml doesn't have any statements.

## A word of caution

Notice I've been careful thus far not to say OCaml is a functional
programming language or that Java is an imperative one. I've
only described programs themselves as "imperative" or "functional."
This is intentional.

In fact almost every programming language used today is multi-paradigm
meaning that it supports different styles of programming. You can
write imperative programs in OCaml and functional programs in Java.
However, some languages are more suitable or emphasize one style over
another. Java heavily favors imperative object-oriented style while
OCaml heavily favors functional style.

When you hear people say that OCaml is a "functional programming
language," this is true since most OCaml programs are written to
minimize state mutation. But note that this is a generalization and
should not be interpreted to mean you can only write functional programs
in OCaml.

## Where does Ruby fit?

So, is Ruby imperative or functional?

<!--- CUE: Give a few minutes for discussion and ask for answers.
      It's open-ended so just about anything is acceptable. -->

Like most languages Ruby supports many paradigms. Hence, the answer
is both. I would say that it leans towards imperative, since Ruby
is highly object-oriented and state mutation is usually quite
prevalent. However, there are a couple of features of Ruby that
bring it closer to functional programming.

1. Ruby supports code blocks. They aren't first-class functions, but
   they fit into the idea of "code as data" which is a functional idea.
2. Almost everything in Ruby is an expression. While many of these
   expressions mutate state, we usually treat these expressions as
   statements and throw away their value.

The second point deserves some more clarification. Take the Ruby
version of the Java program above.

<!--- NOTE: Use the irb repl for this. -->

```ruby
result = 1
for i in (2..n) do
    result *= n
end
```

We are using constructs similar to the Java version and we're using
them as statements. However, they aren't statements!

```ruby
puts (result = 1)
puts (for i in (2..n) do
    puts (result *= n)
end)
```

This runs perfectly fine. In the Java version, putting a print around
the for loop wouldn't be valid. Now, the values these evaluate to
aren't very meaningful (indeed that's why we threw them out originally),
but they are expressions nonetheless.

So, while Ruby tends toward the imperative end of the spectrum, it
is more definitely more functional than say C.

## Type annotations

When you start to write more complicated OCaml programs, you'll
inevitably want to make some helper functions. This is great! In fact,
most students don't write enough helper functions. If the body of your
function is more than a couple lines (where a line is 80 characters long
maximum) you **need** to redesign it.

When introducing such functions, you should **always** annotate the
parameter types and return type and include a brief purpose statement.
Here is an example of a well-written function.

```ocaml
(* Returns lst with n added to every element. *)
let rec add_to_list (lst : int list) (n : int) : int list =
  match lst with
    [] -> []
  | h::t -> (h + n)::(add_to_list t n)
```

Since OCaml has type inference, the type annotations are not strictly
necessary. However, if a function is used incorrectly (as is often the
case when writing code) OCaml will infer the wrong type for the function.
You'll then start to get weird type errors in places you don't expect.

Countless students have spent hours debugging these sorts of issues that
could have been avoided by using type annotations. Don't be one of them.
Annotate your types.

## Practicalities

Like Ruby, OCaml has a REPL that you can interact with.
Our preferred REPL is `utop`.
You can load your project into `utop`
with `dune utop src` in your project directory.
This is great for testing.

You can run the tests in any project with
`dune runtest -f`.
