# Project 0: Setup

Due: June 3 (Late June 4) at 11:59:59 PM

Points: 100P/0R/0S

This project is simply to get your system ready.
You will "submit" this project for a grade.

## Installation

In this course,
among other things,
you will learn three different programming languages:
Ruby, OCaml, and Rust.
To complete the projects
you have to install the appropriate software
to develop programs in these languages
on your local machine.

Here are the packages you are required to install:

* [Git](https://git-scm.com/)
* [Ruby](https://www.ruby-lang.org)
  - [minitest](https://rubygems.org/gems/minitest)
  - [sqlite3](https://rubygems.org/gems/sqlite3)
  - [sinatra](https://rubygems.org/gems/sinatra)
* [OCaml](http://ocaml.org)
  - [OPAM](https://opam.ocaml.org)
  - [OUnit](https://opam.ocaml.org/packages/ounit)
  - [dune](https://opam.ocaml.org/packages/dune)
  - [utop](https://opam.ocaml.org/packages/utop)
* [Rust](https://www.rust-lang.org)
* [SQLite3](https://sqlite.org)
* [Graphviz](http://graphviz.org)

The next sections
will help guide you through installing these
on different operating systems.
Read the section relevant to you.
Some of these steps may take a long time,
be patient.
**Read all instructions very carefully.**

If you are unable to install **anything**,
please come to office hours
**as soon as possible**.

### macOS

1. Install the [Homebrew package manager](https://brew.sh/).
2. Run `brew install ruby git graphviz`.
3. Run `sudo gem install minitest sqlite3 sinatra -N` to install the Ruby packages.
4. Read [this instruction guide](https://github.com/janestreet/install-ocaml)
   for installing OCaml and OPAM.
5. Run `opam install -y ounit dune utop`.
5. Install the [Rust](https://www.rust-lang.org/tools/install) language.

### Windows 10

1. Enable the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
2. Install Ubuntu from the Microsoft Store.
3. Follow the instructions in the Linux section.

### Linux

These instructions will assume you have a Debian-based system.
This includes distributions like Ubuntu.
If you have a different distribution,
use the native package manager.

1. Run `sudo apt install ruby-dev git sqlite3 libsqlite3-dev graphviz default-jre`
2. Run `sudo gem install minitest sqlite3 sinatra -N` to install the Ruby packages.
3. Read [this instruction guide](https://github.com/janestreet/install-ocaml)
   for installing OCaml and OPAM.
4. Run `opam install -y ounit dune utop`.
5. Install the [Rust](https://www.rust-lang.org/tools/install) language.

## Testing and Submitting

To test that your setup is correct,
run `ruby public.rb`.
This will run the public tests.
You should pass everything.

Submit directly to the Submit Server
by executing the submission script
on a computer with Java and network access.
Run the command
`java -jar submit.jar`
from this directory.
Make sure that your submission is received
by checking the Submit Server after submitting.

This will be the submission process
for all projects in this course.
