(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)

(* ****** ****** *)

fun list_longest_ascend(xs: int list): int list =
    let
        fun helper (xs: int list, head: int): int list =
            case xs of
                [] => []
            | x1::xs =>
                if x1 >= head then
                    x1::helper(xs, head)
                else
                    helper(xs, head)
    in
        case xs of
            [] => []
        | x1::xs => 
        let
            val sequence = x1::list_longest_ascend(helper(xs, x1))
            val rest = list_longest_ascend(xs)
        in
            if length(sequence) >= length(rest) then
                sequence
            else
                rest
        end
    end

(* end of [CS320-2023-Spring-assign03-04.sml] *)
