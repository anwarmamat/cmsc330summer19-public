open OUnit2
open D6.Disc

let test_map ctxt =
  let add1 = (+) 1 in
  let dbl = ( * ) 2 in
  
  let xs = Cons (1, Cons (2, Nil)) in
  assert_equal Nil @@ map add1 Nil;
  assert_equal (Cons (2, Cons (3, Nil))) @@ map add1 xs;
  assert_equal (Cons (2, Cons (4, Nil))) @@ map dbl xs

let test_foldl ctxt =
  let xs = Cons (1, Cons (2, Cons (3, Nil))) in
  assert_equal 0 @@ foldl (-) 0 Nil;
  assert_equal (-6) @@ foldl (-) 0 xs
      
let test_foldr ctxt =
  let xs = Cons (1, Cons (2, Cons (3, Nil))) in
  assert_equal 0 @@ foldr (-) Nil 0;
  assert_equal 2 @@ foldr (-) xs 0
  
let test_find ctxt =
  let t = fun x -> true in
  let f = fun x -> false in
  let eq1 = (=) 1 in
  let even = fun x -> (x mod 2) = 0 in
  
  let xs = Cons (1, Cons (2, Cons (4, Nil))) in
  assert_equal None @@ find t Nil;
  assert_equal None @@ find f xs;
  assert_equal (Some 4) @@ find even xs;
  assert_equal (Some 1) @@ find eq1 xs

let test_contains ctxt =
  let xs = Cons (1, Cons (2, Cons (4, Nil))) in
  assert_equal false @@ contains Nil 1;
  assert_equal false @@ contains xs 0;
  assert_equal true @@ contains xs 2

let suite =
  "public" >::: [
    "map" >:: test_map;
    "foldl" >:: test_foldl;
    "foldr" >:: test_foldr;
    "find" >:: test_find;
    "contains" >:: test_contains
  ]

let _ = run_test_tt_main suite
