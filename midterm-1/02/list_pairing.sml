(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-01: 10 points
*)
(* ****** ****** *)
(*
Given a list xs, list_pairing(xs) returns
a list of pairs and an option; the 1st pair
consists of the first and last elements in xs,
and the 2nd pair consists of the second and the
second last elements in xs, and so on and so forth;
and the option is NONE if |xs| is even, and it is
SOME(xm) if |xs| is odd and xm is the middle element
in xs.
//
For instance, we have:
//
list_pairing([]) = ([], NONE)
list_pairing([1]) = ([], SOME(1))
list_pairing([1,2]) = ([(1,2)], NONE)
list_pairing([1,2,3]) = ([(1,3)], SOME(2))
list_pairing([1,2,3,4]) = ([(1,4),(2,3)], NONE)
//
*)
(* ****** ****** *)
(*
fun
list_pairing
(xs: 'a list): ('a * 'a) list * 'a option = ...
*)
(* ****** ****** *)

fun list_take (xs: 'a list, n: int, out: 'a list) = 
  let
  val x = if n = 0 then out else 
  (case xs of [] => []
    |
    (x::xs) => x::list_take(xs, n - 1, out)
  )
  in x
  end

fun list_nth(lst: 'a list, index: int): 'a = 
  (case lst of 
    [] => raise Subscript
    |
    (x::lst) => if index = 0 then x else list_nth(lst, index - 1)
  )

fun list_pairing(xs : 'a list)  =
  let
    val reversed = list_reverse(xs)
    val n = list_length(xs) div 2
    val pairs = list_zip2(list_take(xs, n + 1,[]), list_take(reversed,n + 1,[]))
    val even_or_odd = list_length(xs) mod 2 = 1
    val lsts = list_take(pairs, n, [])
  in
    if even_or_odd = false then (list_take(pairs, n, []), NONE) else 
    (list_take(pairs, n, []), SOME(#1(list_nth(pairs, n))))
  end



(* end of [CS320-2023-Spring-midterm1-list_pairing.sml] *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_pairing.sml] *)
