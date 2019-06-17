type 'a listy = Nil | Cons of 'a * 'a listy
val map : ('a -> 'b) -> 'a listy -> 'b listy
val foldl : ('a -> 'b -> 'a) -> 'a -> 'b listy -> 'a
val foldr : ('b -> 'a -> 'a) -> 'b listy -> 'a -> 'a
val find : ('a -> bool) -> 'a listy -> 'a option
val contains : 'a listy -> 'a -> bool
