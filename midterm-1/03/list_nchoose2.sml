(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-03: 10 points
*)
(* ****** ****** *)

(*
//
Given a list of distnct integers xs,
list_nchoose2(xs) returns a list of all
the pairs (x1, x2) such that x1 and x2 are
two elements from xs satisfying x1 <= x2.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//
For instance,
list_nchoose2([1,3,2]) =
[ (1,3), (1,2), (2,3) ]
list_nchoose2([3,2,1]) =
[ (2,3), (1,3), (1,2) ]
list_nchoose2([3,2,1,4]) =
[(2,3),(1,3),(1,2),(1,4),(2,4),(3,4)]
Note that the returned list is treated as a
set, and the order of the elements in the list
is insignificant.
*)

(* ****** ****** *)

val list_subsets = fn(xs: 'a list) => list_foldleft(xs, [[]], fn(item: 'a list list, x: 'a) => item @ list_map(item, fn(soFar) => soFar@[x]));

fun list_nth(l: int list, index: int): int = 
  (
    case l of 
    [] => raise Subscript
    |
    (x::l) => if index = 0 then x else list_nth(l, index-1)
  );

fun list_to_tuple(xs) = 
    (list_nth(xs,0),list_nth(xs,1))

fun ordered (xs) = 
    if list_nth(xs, 0) <= list_nth(xs, 1) then xs else list_reverse(xs); 


fun filter_for_pairs (l: int list list, result: int list list): int list list = 
    (
        case l of [] => result
        |
        (x::l) => if list_length(x) = 2 then filter_for_pairs(l,ordered(x)::result) else filter_for_pairs(l,result)
    )


fun
list_nchoose2(xs: int list): (int * int) list = 
    let
      val all = list_subsets(xs)
      val result = filter_for_pairs(all,[])
    in
      list_map(result, list_to_tuple)
    end


val test = list_nchoose2([1,3,2,4]);


(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_nchoose2.sml] *)
(* ****** ****** *)

(* ****** ****** *)
(* local variables: *)
(* compile-command: "sml < CS320-2023-Spring-midterm1-list_nchoose2.sml" *)






(* ****** ****** *)


(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_nchoose2.sml] *)
