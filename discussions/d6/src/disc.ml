type 'a listy =
  Nil
| Cons of 'a * 'a listy

(* Applies f to all elements of xs. *)
let rec map (f : 'a -> 'b) (xs : 'a listy) : 'b listy =
  Nil

(* Folds left-to-right over xs with f and accumulator a. *)
let rec foldl (f : 'a -> 'b -> 'a) (a : 'a) (xs : 'b listy) : 'a =
  a

(* Folds right-to-left over xs with f and accumulator a. *)
let rec foldr (f : 'b -> 'a -> 'a) (xs : 'b listy) (a : 'a) : 'a =
  a

(* Returns (as an option) the last element that satisfies predicate p.
   Don't make find recursive. *)
let find (p : 'a -> bool) (xs : 'a listy) : 'a option =
  None

(* Returns if xs contains element e. Don't make contains recursive. *)
let contains (xs : 'a listy) (e : 'a) : bool =
  false
