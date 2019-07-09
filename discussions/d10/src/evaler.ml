open D9.Parser

(* (Parameterized) type of an environment. *)
type 'a env = (var * 'a) list

(* Type of a closure. *)
type closure = Closure of closure env * expr

(* Evaluates expression t. *)
let rec eval (t : expr) : expr =
  raise (Failure "unimplemented")

(* Evaluates term t in environment e (environment-passing-style). *)
and eval_eps (e : closure env) (t : expr) : closure =
  raise (Failure "unimplemented")

(* Evaluates term t with dynamic scoping. *)
let rec eval_dyn (t : expr) : expr =
  raise (Failure "unimplemented")

(* Evaluates term t in environment e with dynamic scoping
   (environment-passing-style). *)
and eval_dyn_eps (e : expr env) (t : expr) : expr =
  raise (Failure "unimplemented")
