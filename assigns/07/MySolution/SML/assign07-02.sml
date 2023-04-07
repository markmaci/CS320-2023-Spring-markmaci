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

fun generate_pairs(n): (int*int) stream = fn() =>
    let 
      fun generate_pairs_aux(n:int, i:int): (int * int) stream = fn() =>
           if i = n then strcon_cons((i,0), fn() => strcon_nil)
                else strcon_cons((i,n-i), generate_pairs_aux(n, i+1)) 
        in 
            generate_pairs_aux(n, 0)()
        end

fun filtered(n): (int*int) stream = fn() =>
    stream_make_filter(generate_pairs(n), fn (i, j) => i <= j)()

fun cube_sum (i: int, j: int): int =
  i * i * i + j * j * j

fun theNatPairs_cubesum_aux(n:int): (int * int) stream = fn () =>
    let
      fun helper(streamer : (int*int) stream): (int*int) stream = fn() =>
        let
          val x = stream_head(streamer)
          val xs = stream_tail(streamer)
        in
          strcon_cons(x,stream_merge2(theNatPairs_cubesum_aux(n+1), xs, fn ((i1, j1),(i2,j2)) => cube_sum(i1, j1) < cube_sum(i2, j2)))
        end

    in
      helper(filtered(n))()
    end

val theNatPairs_cubesum: (int * int) stream = fn () =>
  theNatPairs_cubesum_aux(0)()