# Notes 2: There Will Be Cake
Date: Tuesday June 5th

<!--- ADMIN: Work on P1, should have made very good progress. Due on
      Friday. Should be almost done by next discussion.
      Quiz on Thursday. -->

<!--- TIME: 10 minutes -->

## Why regular expressions?

Hopefully it's clear by now that regular expressions are extremely
useful. They're commonplace in a wide range of applications.

Here are several:

* Websites typically have some constraints on passwords. Maybe they
  have to be a certain length and have some certain characters.
* Along the same lines, we may want to validate some other user
  input. For example, that an entered email address or phone number
  is actually valid.
* If we're searching for something on our computer, sometimes regular
  exact string search is not enough. Unix search tools like `grep`
  allow for matching by regular expression.
* Given some textual input, we may want to extract part of it out.
  Regular expressions are often used for this purpose.

Right, so they're useful but why are we talking about them in this
course? One of the goals of 330 is to learn how languages are
implemented. There will be a project doing exactly this, implementing
a programming language called SmallC in OCaml.

Recall that we spoke about three notions: well-formed, well-defined,
well-typed. Well-formed meant that the program was syntactically
correct. In turns out that regular expressions will be a critically
important tool in verifying that input is well-formed.
