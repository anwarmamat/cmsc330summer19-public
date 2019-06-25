open P3
open Regex
open Sets

(* Utility *)

(* Makes a fresh state number. *)
let fresh =
  let x = ref (-1) in
  fun () -> x := !x + 1; !x

(* Converts an extended regular expression to an NFA. *)
let rec nfa_of_regex (r : t) : (int, char) Nfa.t =
  match r with
  | Maybe r -> failwith "not implemented"
  | Plus r -> failwith "not implemented"
  | Chars (c :: ct) -> failwith "not implemented"
  | Not r -> failwith "not implemented"
  | _ -> nfa_of_regex_open r nfa_of_regex

(* Converts a generic NFA to an NFA where the states are
   integers. *)
and normalize_states (m : ('q, 's) Nfa.t) : (int, 's) Nfa.t =
  let f = Hashtbl.hash in
  { qs = List.map f m.qs;
    ss = m.ss;
    ts = List.map (fun (x, s, y) -> (f x, s, f y)) m.ts;
    q0 = f m.q0;
    fs = List.map f m.fs
  }
