(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-16: 30 points
//
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
Please give a NON-RECURSIVE implementation that solves the 8-queen puzzle.
//

//
fun
queen8_puzzle_solve(): board_t list =
(*
returns a list of boards consisting of all the solutions to the puzzle.
*)
//
*)

type board_t =
int * int * int * int * int * int * int * int

val board_foreach = fn (bd: board_t, work: int -> unit) =>
let
    val (x0, x1, x2, x3, x4, x5, x6, x7) = bd
in
    work(x0); work(x1); work(x2); work(x3);
    work(x4); work(x5); work(x6); work(x7); ()
end


val board_get = fn (bd, i) => 
let 
    val (x0, x1, x2, x3, x4, x5, x6, x7) = bd in
    if i = 0 then x0
    else if i = 1 then x1
    else if i = 2 then x2
    else if i = 3 then x3
    else if i = 4 then x4
    else if i = 5 then x5
    else if i = 6 then x6
    else if i = 7 then x7
    else raise Fail "board_get: index out of range"
end


val board_set = fn (bd, i, j) =>
let val (x0, x1, x2, x3, x4, x5, x6, x7) = bd in
    if i = 0 then (j, x1, x2, x3, x4, x5, x6, x7)
    else if i = 1 then (x0, j, x2, x3, x4, x5, x6, x7)
    else if i = 2 then (x0, x1, j, x3, x4, x5, x6, x7)
    else if i = 3 then (x0, x1, x2, j, x4, x5, x6, x7)
    else if i = 4 then (x0, x1, x2, x3, j, x5, x6, x7)
    else if i = 5 then (x0, x1, x2, x3, x4, j, x6, x7)
    else if i = 6 then (x0, x1, x2, x3, x4, x5, j, x7)
    else if i = 7 then (x0, x1, x2, x3, x4, x5, x6, j)
    else raise Fail "board_set: index out of range"
end

val safety_test1 = fn(i0: int, j0: int, i: int, j: int) => 
j0 <> j andalso abs (i0 - i) <> abs_int (j0 - j);

val safety_test2 = fn(i0: int, j0: int, bd: board_t, i: int) => 
list_forall(list_tabulate(i, fn n => (n, board_get (bd, n))), fn (r, c) => safety_test1 (i0, j0, r, c))


val board_get_boards = fn (i, bd) =>
int1_foldleft(8, [], fn (res, j) => if safety_test2(i, j + 1, bd, i) then res @ [board_set(bd, i, j + 1)] else res)



val queen8_puzzle_solve = fn () =>
int1_foldleft(8, [(~1, ~1, ~1, ~1, ~1, ~1, ~1, ~1)], fn (res, i) => list_concat(list_map(res, fn bd => board_get_boards(i, bd))))









(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-04.sml] *)