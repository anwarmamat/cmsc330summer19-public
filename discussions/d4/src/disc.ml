(* Returns elements in xs satisfying predicate f. *)
let rec filter (f : 'a -> bool) (xs : 'a list) : 'a list =
  failwith "unimplemented"

(* Sets the kth element of xs to r. *)
let rec set (k : int) (r : 'a) (xs : 'a list) : 'a list =
  failwith "unimplemented"

(* Rotates the list xs by k positions. *)
let rec rotate (k : int) (xs : 'a list) : 'a list =
  failwith "unimplemented"

(* Return the negation of the predicate f. *)
let negate (f : 'a -> bool) : 'a -> bool =
  failwith "unimplemented"

(* Returns the composition of functions fs. *)
let rec composes (fs : ('a -> 'a) list) : 'a -> 'a =
  failwith "unimplemented"
