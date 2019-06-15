open Funs

(***********************)
(* Part 2: Integer BST *)
(***********************)

type int_tree =
  | IntLeaf
  | IntNode of int * int_tree * int_tree

let empty_int_tree = IntLeaf

let rec int_insert x t =
  match t with
  | IntLeaf -> IntNode(x, IntLeaf, IntLeaf)
  | IntNode (y, l, r) when x > y -> IntNode (y, l, int_insert x r)
  | IntNode (y, l, r) when x = y -> t
  | IntNode (y, l, r) -> IntNode (y, int_insert x l, r)

let rec int_mem x t =
  match t with
  | IntLeaf -> false
  | IntNode (y, l, r) when x > y -> int_mem x r
  | IntNode (y, l, r) when x = y -> true
  | IntNode (y, l, r) -> int_mem x l

(* Implement the functions below. *)

let rec int_size t = failwith "unimplemented"

let rec int_max t = failwith "unimplemented"

let rec int_common t x y = failwith "unimplemented"

(***************************)
(* Part 3: Polymorphic BST *)
(***************************)

type 'a atree =
    Leaf
  | Node of 'a * 'a atree * 'a atree
type 'a compfn = 'a -> 'a -> int
type 'a ptree = 'a compfn * 'a atree

let empty_ptree f : 'a ptree = (f,Leaf)

(* Implement the functions below. *)

let pinsert x t = failwith "unimplemented"

let pmem x t = failwith "unimplemented"

let pinsert_all lst t = failwith "unimplemented"

let rec p_as_list t = failwith "unimplemented"

let pmap f t = failwith "unimplemented"

(*******************************)
(* Part 4: Shapes with Records *)
(*******************************)

type pt = { x: int; y: int }
type shape = 
    Circ of { radius: float; center: pt }
  | Rect of { width: float; height: float; upper: pt }

let area s = failwith "unimplemented"

let filter f lst = failwith "unimplemented"

let partition thresh lst = failwith "unimplemented"

let rec qs lst = failwith "unimplemented"
