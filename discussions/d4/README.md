# Discussion 4: O'Cam El Exercises

Due: Tuesday June 11th (Late June 12th) at 11:59:59PM

Points: 100P/0R/0S

## List functions

### `filter : ('a -> bool) -> 'a list -> 'a list`

Remove elements from the given list
that do not return `true`
when passed into the function.

```ml
filter (fun x -> x > 0) [1; 3; (-1); 5; (-3)]
= [1; 3; 5]
```

### `set : int -> 'a -> 'a list -> 'a list`

Set the element at the given position of the list to be the given element.
You may assume the index is in range.

```ml
set 1 "d" ["a"; "b"; "c"]
= ["a"; "d"; "c"]
```

### `rotate : int -> 'a list -> 'a list`

Move every element over in the list by the given amount (looping around).

```ml
rotate 2 ["a"; "b"; "c"; "d"]
= ["c"; "d"; "a"; "b"]
```

### `negate : ('a -> bool) -> 'a -> bool`

Given a function construct a new function
that returns the negation
of the result of the passed in function.

```ml
filter (negate (fun x -> x > 0)) [1; 3; (-1); 5; (-3)]
= [-1; -3]
```

### `composes : ('a -> 'a) list -> 'a -> 'a`

Given a list of functions, compose the functions together.

```ml
composes [fun x -> x + 1; fun x -> x * 2] 10
= 21
```
