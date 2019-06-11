open OUnit2
open D4.Disc

let f x = (x > 0)
let g x = (x < 0)
let a x = x + 3
let b x = x * 5

let test_public_filter ctxt =
  assert_equal [1; 3; 5] (filter f [1; 3; (-1); 5; (-3)]);
  assert_equal [(-1); (-3)] (filter g [1; 3; (-1); 5; (-3)]);
  assert_equal [] (filter g (filter f [1; 3; (-1); 5; (-3)]));
  assert_equal [] (filter f []);
  assert_equal [1; 3; 4] (filter f [1; 3; 4]);
  assert_equal [] (filter g [1; 3; 4])

let test_public_set ctxt =
  assert_equal ["a"; "d"; "c"] (set 1 "d" ["a"; "b"; "c"]);
  assert_equal ["x"] (set 0 "x" ["y"]);
  assert_equal [1; 3; 3] (set 1 3 [1; 2; 3])

let test_public_rotate ctxt =
  assert_equal ["c"; "d"; "a"; "b"] (rotate 2 ["a"; "b"; "c"; "d"]);
  assert_equal [] (rotate 2 []);
  assert_equal [1] (rotate 5 [1]);
  assert_equal ["a"; "b"; "c"; "d"] (rotate 0 ["a"; "b"; "c"; "d"]);
  assert_equal ["a"; "b"; "c"; "d"] (rotate 4 ["a"; "b"; "c"; "d"])

let test_public_negate ctxt =
  assert_equal (filter f [1; 3; (-1); 5; (-3)]) (filter (negate g) [1; 3; (-1); 5; (-3)]);
  assert_equal (filter g [1; 3; (-1); 5; (-3)]) (filter (negate f) [1; 3; (-1); 5; (-3)])

let test_public_composes ctxt =
  assert_equal 18 ((composes [a; b]) 3);
  assert_equal 28 ((composes [a; b]) 5);
  assert_equal 318 ((composes [a; b; (composes [a;b])]) 12)

let suite =
  "public" >::: [
    "filter" >:: test_public_filter;
    "set" >:: test_public_set;
    "rotate" >:: test_public_rotate;
    "negate" >:: test_public_negate;
    "composes" >:: test_public_composes
  ]

let _ = run_test_tt_main suite
