# Discussion 2: There Will Be Cake

Due: Tuesday June 4th at 11:59:59PM

Points: 50P/50R/0S

## Introduction

Welcome to Aperture Science's Enrichment Center, a facility dedicated
testing Aperture's products. Due to significant budget cuts, Aperture
has mandated that all employees participate in enrichment center testing.
Unfortunately, employee records have been corrupted and tests may not
begin until they have been properly sanitized.

You will write the `ApertureScheduler` class in `scheduler.rb` to ensure
testing may resume.

### `phone?(s : String) -> Boolean`

A valid phone number can be in one two formats, `(XXX) XXX-XXXX`
or `XXX-XXX-XXXX`. Returns boolean indicating if `s` is a valid
phone number.

### `sanitize(records : Array) -> Array`

The `records` parameter is an array of comma-separated strings each
representing an employee record. You must return all the entries of
the array that are not corrupted. A valid element of record is of
the form: `<ID>,<NAME>,<HOMETOWN>,<DOB>,<EMAIL>`.

* `<ID>` is a 2-digit to 5-digit number.
* `<NAME>` consists of two capitalized alphabetic words.
* `<HOMETOWN>` is a capitalized alphabetic word.
* `<DOB>` is a date in `MM-DD-YYYY` format.
* `<EMAIL>` is an alphanumeric string followed by "@", another alphanumeric string, a ".", and then three alphabetic characters.

Here are examples of valid records:

* `10,Cave Johnson,Chicago,12-15-1901,lemons@aperturescience.com`
* `730,Caroline McLain,Portland,01-17-1930,potato@aperturescience.com`
* `54388,Doug Rattmann,Atlanta,05-20-1950,beans@gmail.com`

### `schedule(records : Array) -> Array`

The `records` parameter is the same as the above, a list of potentially
corrupt employee records. You must return all the non-corrupt entries
in the array, but modifying the format slightly.

1. Sort the entries of the output by last name.
2. Modify the names to be last name first.
2. Change the date of birth format to `YYYY-MM-DD`.
