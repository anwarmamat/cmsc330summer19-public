val filter : ('a -> bool) -> 'a list -> 'a list
val set : int -> 'a -> 'a list -> 'a list
val rotate : int -> 'a list -> 'a list
val negate : ('a -> bool) -> 'a -> bool
val composes : ('a -> 'a) list -> 'a -> 'a
