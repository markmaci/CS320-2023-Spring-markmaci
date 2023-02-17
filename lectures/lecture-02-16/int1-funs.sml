(* ****** ****** *)
use
"./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

fun
palindrome_test
(word: string): bool =
let
val len = String.size(word)
in
  int1_forall
  ( (len+1)div(2)
  , fn(i) =>
    String.sub(word, i) = String.sub(word, len-i-1))
end (* end of [palindrome_test(word)]: let *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-int1-funs.sml] *)
