open OUnit2
open P3.Regex
open D8.Disc
open TestUtils

let test_maybe ctxt =
  let m1 = nfa_of_regex (Maybe (Char 'a')) in
  assert_nfa_accept m1 "" ;
  assert_nfa_accept m1 "a" ;
  assert_nfa_deny m1 "b" ;
  assert_nfa_deny m1 "aa"

let test_plus ctxt =
  let m1 = nfa_of_regex (Plus (Char 'a')) in
  assert_nfa_deny m1 "" ;
  assert_nfa_accept m1 "a" ;
  assert_nfa_deny m1 "b" ;
  assert_nfa_accept m1 "aa"

let test_chars ctxt =
  let m1 = nfa_of_regex (Chars ['a'; 'b'; 'c']) in
  assert_nfa_deny m1 "" ;
  assert_nfa_accept m1 "a" ;
  assert_nfa_accept m1 "b" ;
  assert_nfa_accept m1 "c" ;
  assert_nfa_deny m1 "aa" ;
  assert_nfa_deny m1 "d"

let test_not ctxt =
  let m1 = nfa_of_regex (Not (Union (Char 'a', Char 'b'))) in
  assert_nfa_accept m1 "" ;
  assert_nfa_deny m1 "a" ;
  assert_nfa_deny m1 "b" ;
  assert_nfa_accept m1 "aa" ;
  assert_nfa_accept m1 "bb" ;
  assert_nfa_accept m1 "ab"

let suite =
  "public"
  >::: [ "maybe" >:: test_maybe;
         "plus"  >:: test_plus;
         "chars" >:: test_chars;
         "not"   >:: test_not ]

let _ = run_test_tt_main suite
