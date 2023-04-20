(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
Given a list xs and a natural number k0,
perm_counting_out(xs, k0) returns a permutation
of xs where the elements are listed according to
the order they are "counted out" in the following
process of counting:
//
Counting of the elements xs goes left to right
and the first count is 0. When the count reaches
k0, the element being counted is removed (that is,
the element is counted out) and counting starts again
with the following element. If counting reached the
last element remaining in the list, then the next element
to be counted is the first element in the list. Counting
stops when all the elements are counted out.
//
For instance,
perm_counting_out([1,2,3], 0) = [1,2,3]
perm_counting_out([1,2,3], 1) = [2,1,3]
perm_counting_out([1,2,3], 2) = [3,1,2]
perm_counting_out([1,2,3], 3) = [1,3,2]
perm_counting_out([1,2,3,4], 1) = [2,4,3,1]
perm_counting_out([1,2,3,4], 3) = [4,1,3,2]
//
*)

(* ****** ****** *)

fun last_x(xs: int list, x: int): int list =
    let
        val n = length(xs)
        val start_idx = n - x
        fun last_x_helper(xs: int list, i: int): int list =
            case xs of
                [] => []
              | y::ys => if i >= start_idx
                             then y::last_x_helper(ys, i+1)
                             else last_x_helper(ys, i+1)
    in
        last_x_helper(xs, 0)
    end;


fun perm_counting_out(xs: int list, k0: int): int list =
    let
        fun perm_counting_out_aux(xs: int list, k0: int, k: int, acc: int list): int list =
            case xs of
                [] => list_reverse(acc)
            | x::xs_tail =>
                if k = k0 then
                    perm_counting_out_aux(xs_tail, k0, 0, x :: (acc @ xs_tail))
                else
                    perm_counting_out_aux(xs_tail @ [x], k0, k+1, acc)

    in
        last_x(perm_counting_out_aux(xs, k0, 0, []), length (xs))
    end;

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-06.sml] *)
