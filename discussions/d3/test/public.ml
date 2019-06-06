open OUnit2
open D3.Disc

let test_public_fact ctxt =
  assert_equal 1 (fact 1);
  assert_equal 120 (fact 5)

let test_public_unary ctxt =
  assert_equal "" (unary 0);
  assert_equal "1" (unary 1);
  assert_equal "1111111" (unary 7)

let test_public_sum_digits ctxt =
  assert_equal 0 (sum_digits 0);
  assert_equal 3 (sum_digits 120)

let test_public_binary ctxt =
  assert_equal "" (binary 0);
  assert_equal "1" (binary 1);
  assert_equal "10" (binary 2);
  assert_equal "111" (binary 7)

let suite =
  "public" >::: [
    "fact" >:: test_public_fact;
    "unary" >:: test_public_unary;
    "sum_digits" >:: test_public_sum_digits;
    "binary" >:: test_public_binary
  ]

let _ = run_test_tt_main suite
