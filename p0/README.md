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
to develop programs in these languages.
We recommend installing these packages on your local machine.

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
* [Rust](https://www.rust-lang.org)
* [SQLite3](https://sqlite.org)

We recommend installing the following additional packages:

* [Graphviz](http://graphviz.org)
* [utop](https://opam.ocaml.org/packages/utop)

The next sections
will help guide you through installing these
on different operating systems.
Read the section relevant to you.
Some of these steps may take a long time,
be patient.

These instructions may require slight (or large) modifications
depending on your setup.
Search engines are your friend if something goes wrong.
If you are unable to install **anything**,
please come to office hours
**as soon as possible**.

### macOS

First, we will install the Homebrew package manager.

* `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Check your Ruby version with `ruby -v`.
If it's older than 2.2.2
you'll need to install a newer version
using `brew install ruby`.

Next, we can install some of the software through Homebrew.

* `brew install git ocaml opam rust graphviz`

macOS already comes with Ruby and the Ruby Gems package manager.
We only need to install the required gems.

* `sudo gem install sqlite3 sinatra`

If it hangs installing documentation for Sinatra,
hit Ctrl-C.
It will have successfully installed anyway.

The OCaml package manager needs some initial configuration.

* `opam init`
* When prompted to modify `~/.bash_profile` (or another file) type "y".
* `source ~/.bash_profile` (or the file mentioned above).

Next, we will install the required OCaml packages through OPAM.

* `opam install dune ounit utop`

### Windows 10

Enable the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
and install Ubuntu.
Then follow the instructions in the Linux section below.

### Linux

These instructions will assume you have a Debian-based system.
This includes distributions like Ubuntu.
If you have a different distribution,
use the native package manager.

First, we add the OCaml package archive.

* `sudo add-apt-repository ppa:avsm/ppa`
* `sudo apt-get update`

We install all the packages we need.

* `sudo apt-get install git-all ruby-dev sqlite3 libsqlite3-dev ocaml ocaml-native-compilers camlp4 opam make m4 curl graphviz default-jre`

We will install some gems.

* `sudo gem install sqlite3 sinatra`

If it hangs installing documentation for Sinatra,
hit Ctrl-C.
It will have successfully installed anyway.

The OCaml package manager needs some initial configuration.

* `opam init`
* If it hangs at "Fetching repository information" press Enter. This may take awhile, be patient.
* When prompted to modify `~/.bash_profile` (or another file) type "y".
* `source ~/.bash_profile` (or the file mentioned above).

Next, we will install the required OCaml packages through OPAM.

* `opam install dune ounit utop`

Finally, we'll install Rust. Note this may take some time.

* `curl https://sh.rustup.rs -sSf | sh`

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
