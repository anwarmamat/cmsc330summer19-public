open OUnit2
open D9.Lexer
open D9.Parser

let test_student_sanity ctxt =
  assert_equal 1 1

let suite =
  "student" >::: [
    "sanity" >:: test_student_sanity
  ]

let _ = run_test_tt_main suite
