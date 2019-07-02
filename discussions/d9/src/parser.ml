open Lexer

(* Types *)
type var = string
type expr =
  Fun of var * expr
| App of expr * expr
| Var of var

(* Parsing helpers *)

let tok_list = ref []

(* Returns next token in the list. *)
let lookahead () : token =
  match !tok_list with
    [] -> raise (Failure "no tokens")
  | (h::t) -> h

(* Matches the top token in the list. *)
let consume (a : token) : unit =
  match !tok_list with
    (h::t) when a = h -> tok_list := t
  | _ -> raise (Failure "bad match")

(* Parses a token list. *)
let rec parse (toks : token list) : expr =
  tok_list := toks;
  let exp = parse_M () in
  if !tok_list <> [Tok_EOF] then
    raise (Failure "did not reach EOF")
  else
    exp

(* Parses the M (term) rule. *)
and parse_M () : expr =
  Var "implement this function"

(* Parses the X (variable) rule. *)
and parse_X () : expr =
  Var "implement this function"

(* Returns string representation of the AST. *)
let rec string_of_expr (m : expr) : string =
  "implement this function"
