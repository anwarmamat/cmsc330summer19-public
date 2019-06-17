# Notes 6: The Listiest of Lists
Date: Tuesday June 18th

<!--- ADMIN: You should have started with P2B. -->
<!--- ADMIN: There is an OCaml quiz next discussion. -->

<!--- TIME: 20 minutes -->

## More and more types

<!--- CUE: Put up columns on the board with the categories below (unlabeled).
      Ask for as many types as people can think of and put in the categories.
      Then try to get people to label them. -->

As you've probably noticed, types are super important in OCaml. The most
basic are called **base types**. These are the basic indivisible types that
OCaml provides. Some examples include `int`, `float`, and `string`.

Most of the other types we've seen have been **constructed types**. These are
types that are formed by some combination of other types.

* Function Type - For example `fun x -> x + 1` will have type `int -> int`.
* Product Type - Tuples are product types. For example `("hello", 5)` will have
  type `string * int`. Records are also product types. They can be thought
  of as nameless and named product types respectively. Values of a product type
  must contain values of all the types in the product.
* Sum (Variant, Tagged Union) Type - Variants are sum types. For example if we
  define `type coin = Head | Tail`, then `Head` will have the type `coin`. Values
  of a sum type must be one of the types in the sum.

At this point, we should make the distinction between two concepts, that
of **value constructors** and **type constructors**. These are the entities
that allow us to create values and types respectively. They live in two
separate universes. The value constructors live at the expression level,
while the type constructors live at the type level.

* `fun _ -> _` is a value constructor of functions, while `_ -> _` is a
  type constructor of the function type.
* `(_, _)` is a value constructor of pairs, while `_ * _` is a type
  constructor of the pair type.
* `Head` is a value constructor for `coin`.

Another important sort of type are **parametric types** known as generics in
Java. Here is a classic example.

```ocaml
type 'a option =
  Some of 'a
| None
```

Here we aren't defining a single type, but rather a custom type constructor
that generates a whole family of types. Here `_ option` is our type
constructor and we have two value constructors: `Some _` and `None`.

Another common type is a **recursive type**. This is a type that can refer to
itself. Here is a classic example.

```ocaml
type 'a listy
  Cons of ('a * 'a listy)
| Nil
```

This combines together a lot of what we've already seen, so let's review.

* Here we are defining the parametric type `listy`, which isn't a single type but
  rather a whole family of types. 
* The `listy` type is also a sum type because we have two variants: `Cons` and `Nil`.
* The `Cons` value constructor takes in a product type, in particular a tuple.
* This tuple happens to refer to `'a listy` meaning that this is also a recursive
  type.

## Debugging OCaml

While the type system of OCaml is excellent, this of course does not obviate the
need for debugging skills. One of the crudest debugging techniques is printing.
Of course we can do this with OCaml too. Take factorial.

```ocaml
let rec fact n =
  if n = 0 then 1 else n * fact (n - 1)
in fact 3
```

Suppose we wanted to print out the value of `n` on each iteration. We can use
imperative OCaml to do so.

```ocaml
let rec fact n =
  print_int n; print_string "\n";
  if n = 0 then 1 else n * fact (n - 1)
in fact 3
```

This is annoying though and OCaml has a better way of tracking the values coming
into and out of a function. This is with the `#trace` directive. In your OCaml
top-level define `fact`. Then run `#trace fact;;`. Now, if you run `fact 3` you
will see a full trace of the function.

```ocaml
let rec fact n = if n = 0 then 1 else n * fact (n - 1);;
(* val fact : int -> int = <fun> *)

#trace fact;;
(* fact is now traced. *)

fact 3;;
(* fact <-- 3
   fact <-- 2
   fact <-- 1
   fact <-- 0
   fact --> 1
   fact --> 1
   fact --> 2
   fact --> 6
   : int = 6 *)
```

OCaml also has a debugging tool similar to `gdb` called `ocamldebug` that you
can use. Personally I have never used this type of tool. Why? If you find that
you need to debug in this way, you're probably not designing your functions well.
Break up your functions into smaller pieces and unit test them individually.
