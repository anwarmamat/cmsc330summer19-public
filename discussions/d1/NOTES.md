# Notes 1: All the Rubyists

Date: Thursday May 30th

## Do you `git` it?

Git it a distributed version control system.
It let's you manage and track versions of your code
and let's you easily share and collaborate
on programs with others.
After you've installed `git`, you need to configure it.

```
$ git config --global user.email "camoy@cs.umd.edu"
$ git config --global user.name "Cameron Moy"
```

To create repository you usually use `git init`.
If you're getting someone else's repository,
as you will do in this class,
you use `git clone`.

```
$ git clone https://github.com/anwarmamat/cmsc330summer19-public
```

This will download the repository.
If we make a change to the repository
you'll need to update your local copy.
You can use `git pull` for this.

```
$ git pull
```

You should frequently commit your code.
This saves a snapshot of the repository
that you can return to later.
Let's create a commit.

1. Make some changes.
2. To see what you've done issue `git status`.
3. Select the files that should be in the commit.
   You can do this with `git add file1 file2 ...`.
4. Doing `git status` again you should see these
   are now staged.
5. Run `git commit -m "Lorem ipsum"`. This will
   create a commit with the message "Lorem ipsum".
6. If you want to view this commit, run `git log`
   to see the entire history of commits.

This is the absolute bare minimum
you need to work with `git`.
There's a lot more,
feel free to look up more features!

## Why does Ruby feel different?

What's the biggest difference between Ruby and the languages you've
seen so far (i.e. Java and C)?

There are many possible answers. Here are some:

* Ruby makes you happy (whereas Java and C make you weep, or at least
  makes me weep...)
* Ruby is concise
* **Ruby is dynamically typed**

For me the last one if the most consequential. Let's take a look
at some examples.

```java
if (true) {
    System.out.println("A");
} else {
    System.out.println("A" * "B");
}
```

This program is **well-defined** meaning that if we could run it (by
perhaps bypassing the type checker) it would work fine and output
"A". However, this program is not **well-typed** and Java let's us
know there is a type error.

```
| Error:
| bad operand types for binary operator '*'
|   first type:  java.lang.String
|   second type: java.lang.String
|    System.out.println("A" * "B");
|                       ^-------^
```

However, in Ruby it works fine.

```ruby
if true then
    puts "A"
else
    puts ("A" * "B")
end
```

This outputs "A" as we expect.

Let's look at another difference. In Java we know that if we have
an ArrayList that the types of elements are fixed by its type
parameter.

```java
ArrayList<Integer> arr = new ArrayList<>();
arr.add(0);
arr.add(1);
arr.add("Hello"); // type error
```

However, in Ruby we don't have this restriction.

```ruby
arr = []
arr << 0
arr << 1
arr << "Hello"
```

This is fundamentally less restrictive than Java. But you may have
a counter-point! What about using `ArrayList<Object>`?

```java
ArrayList<Object> arr = new ArrayList<>();
arr.add(0);
arr.add(1);
arr.add("Hello"); // no type error
```

Since we can add elements of arbitrary type, isn't this a counterexample
showing that Java is just as flexible as Ruby?

The answer is no. Why? Because a list is only useful if you can
do something with its elements. If we fix the type parameter of
our list with Object we have basically no information about the
elements. Therefore, even though we know that the first two
elements in the list are numbers we couldn't even add them.

```java
arr.get(0) + arr.get(1);
|  Error:
|  bad operand types for binary operator '+'
|    first type:  java.lang.Object
|    second type: java.lang.Object
|  arr.get(0) + arr.get(1);
|  ^---------------------^
```

So our Java list is basically useless because we can't do
anything with the contents. However, in Ruby this will work fine
and gives 1.

```ruby
arr[0] + arr[1]
```

This is another example where a well-defined program is thrown
out by the type checker. We see that Java is more conservative
than Ruby because it rejects some perfectly fine programs. This
gets us into a crucial distinction in type systems.

1. A type system is **complete** if well-defined progams are
   always well-typed (i.e. the type checker doesn't throw out
   "good" programs).
2. A type system is **sound** if well-typed programs are always
   well-defined (i.e. a program that type checks can never go
   wrong at run-time).

Since Ruby will never throw out a good program it is complete
but not sound. Java is definitely not complete (we just saw
several examples), but it's more sound than Ruby since it does
eliminate many classes of runtime error.

We see that the tendency towards one side, soundness in Java
and completeness in Ruby, gives us very different kinds of
languages that "feel" very different.

## So what?

Ruby's completeness is problematic because it can make finding
bugs quite difficult and not always easily reproducible. You
don't get a static type checker to verify that what you write is
reasonable.

This means it is incumbent on us, the programmers, to ensure that
what we write makes sense from a type perspective. This means that
testing is more important than ever. Good style conventions can
also help. For example, annotating every method with its type
and purpose.

```ruby
# add : Integer Integer -> Integer
# Adds two integers together
def add(x, y)
  x + y
end
```
