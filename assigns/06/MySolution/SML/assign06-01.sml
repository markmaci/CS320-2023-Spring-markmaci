(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)


fun ln2_helper(x: real, n: int): real stream = fn() =>
  let
    val sign = if (n + 1) mod 2 = 0 then 1.0 else ~1.0
    val term = sign / Real.fromInt(n)
    val next = x + term
  in
    strcon_cons(next, ln2_helper(next, n+1))
  end


val the_ln2_stream: real stream = fn() =>
    ln2_helper(0.0, 1) ()

(* end of [CS320-2023-Spring-assign06-01.sml] *)
