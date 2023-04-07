(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-03-31: 20 points
Please implement the following function
that enumerates all the pairs (i, j) of natural
numbers satisfying $i <= j$; a pair (i1, j1) must
be enumerated ahead of another pair (i2, j2) if the
following condition holds:
  i1*i1*i1 + j1*j1*j1 < i2*i2*i2 + j2*j2*j2
//
val
theNatPairs_cubesum: (int * int) stream = fn () =>
//
*)

(* ****** ****** *)
 
(* end of [CS320-2023-Spring-assign07-02.sml] *)

fun cube_sum (i: int, j: int): int =
  i * i * i + j * j * j

fun cube_sum_lte ((i1, j1), (i2, j2)): bool =
  cube_sum(i1, j1) < cube_sum(i2, j2)

fun theNatPairs_cubesum_aux(n:int): (int * int) stream = fn () =>
    let
      fun helper (i0: int): (int * int) stream = fn () =>
        strcon_cons((i0, i0), stream_merge2(stream_tabulate(~1, fn j0 => (i0, i0 + j0 + 1)), helper(i0 + 1), cube_sum_lte))
    in
      helper(n)()
    end

val theNatPairs_cubesum: (int * int) stream = fn () =>
  theNatPairs_cubesum_aux(0)()


(* val () = stream_foreach(theNatPairs_cubesum, fn (x, y) => (print("("^Int.toString(x)^","^Int.toString(y)^")"); print("\n"))) *)