# Notes 7: Are You Having Fun?

Date: Thursday June 20th

<!--- ADMIN: You should be almost done with P2B, it's due next
      discussion. -->

<!--- TIME: 20 minutes -->
<!--- CUE: Do the OCaml quiz. -->

<!--- TIME: 10 minutes -->

## Scopes

```ocaml
let foo = "bar" in
let append_foo x = x ^ foo in
let foo = "baz" in
append_foo "hello "
```

<!--- CUE: Vote on what you think will be returned. -->

Here there are only two options that make much sense. The first we call
**lexical scoping** where the definition `foo` at the moment `append_foo`
is defined is used. This means our result would be `hello bar`.

The other is called **dynamic scoping** where the definition of `foo` at
the moment of invocation is used. This would result in `hello baz`.

It turns out that almost all modern programming languages use lexical
scoping. Why? Say `append_foo` was some library function. If our language
used dynamic scoping then our definition of `foo` could potentially be
overwritten with a user's definition of `foo`. Nothing that we defined
would be safe because the consumer of our function may have modified it.
This is extremely dangerous.

With lexical scoping, we're assured that no matter what the user has
done, we still get to use our definition of `foo`. It hasn't been tampered
with at all.

<!--- TIME: 10 minutes -->

## What are closures?

From Wikipedia:

> A closure is a technique for implementing lexically scoped name binding
> in a language with first-class functions. Operationally, a closure is a
> record storing a function together with an environment. The environment
> is a mapping associating each free variable of the function (variables
> that are used locally, but defined in an enclosing scope) with the value
> or reference to which the name was bound when the closure was created.

A closure is the data structure that implements lexically scoped functions.
Despite what you might have originally thought, a function is not only
comprised of the body. It's defined environment is also a component.

The terminology is confusing, but here's an analogy. **Closures are to
functions as linked lists are to lists.** Closures are an internal
language concept that are used to implement functions, but the word is
not synonymous with the word function. Just like a linked list is not the
exact same thing as a list.

Often times we'll have a function and call it a closure, just as we may
call a list a linked list if it happens to be so. Mostly we use the word
closure to emphasize the fact that the function's environment is non-empty.
It's an indicator that suggests the function has inherited some variable
bindings from it's parent scope.

<!--- TIME: 10 minutes -->

## Currying and partial application

Let's suppose we have a language that only supports single-parameter
functions. How would we replicate the ability to have multiple parameters?
One option is to use tuples.

```ocaml
let add (x, y) = x + y
in add (1, 1)
```

This works fine, but there is a more elegant solution. This more elegant
solution doesn't even rely on tuples.

```ocaml
let add = fun x -> fun y -> x + y
in add 1 1
```

Here, `add 1` produces a new function that (because of lexical scoping)
has `x` bound to 1. This is called **partially applying**, and `add 1`
is a **partially applied function**. I think of it as a modified version
of the original function where one of the arguments is fixed.

When we apply this function to another 1 by doing `add 1 1`, this will produce 2.
OCaml automatically converts multi-argument functions into this nested
function form. This transformation is called **currying**. Such a function
is called a **curried** function.

<!--- TIME: 30 minutes -->
<!--- CUE: Work on the graded exercise "Are You Having Fun?" -->
