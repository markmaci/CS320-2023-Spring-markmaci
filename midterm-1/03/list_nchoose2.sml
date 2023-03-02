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

fun all_pairs(xs: int list): (int * int) list =
    let
        fun pairs(x: int, ys: int list): (int * int) list =
            let
                fun pairs_helper(y: int, zs: int list): (int * int) list =
                    case zs of
                        [] => []
                      | z::zs' => (x,y)::pairs_helper(y, zs') 
            in
                case ys of
                    [] => []
                  | y::ys' => pairs_helper(y, ys') @ pairs(x, ys')
            end
    in
        case xs of
            [] => []
          | x::xs' => pairs(x, xs') @ all_pairs(xs')
    end

val allPairsTest = all_pairs([3,2,1,4])


fun list_nchoose2(xs: int list): (int * int) list =
    let
        val allPairs = all_pairs(xs)
        val filteredPairs = list_filter(allPairs, fn (x1,x2) => x1 <= x2)
    in
        filteredPairs
    end


val test = list_nchoose2([3,2,1,4])

(* ****** ****** *)


(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_nchoose2.sml] *)
