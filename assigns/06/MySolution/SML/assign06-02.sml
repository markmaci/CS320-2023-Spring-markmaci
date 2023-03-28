(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 pointsno
Please enumerate all the pairs of natural
numbers. Given pairs (i1, j1) and (i2, j2),
(i1, j1) should be enumerated ahead of (i2, j2)
if i1+j1 < i2+j2.
*)

(* ****** ****** *)

fun generate_pairs(n:int): (int*int) stream = fn() =>
    let 
        fun generate_pairs_aux(n:int, i:int): (int*int) stream = fn () =>
            if i = n then strcon_cons((i,0), fn() => strcon_nil)
            else strcon_cons((i,n-i), generate_pairs_aux(n, i+1))
    in 
        generate_pairs_aux(n, 0)()
    end

  

fun print_stream (str: (int*int) stream) (n:int) = fn () =>
    let
        val count = ref 0
    in
        stream_foreach(str, fn(i, j) =>
            if !count < n then (
                count := !count + 1;
                print("(" ^ Int.toString(i) ^ " , " ^ Int.toString(j) ^ ")")
            )
            else
                ()
        )
    end


fun theNatPairs_helper(n:int): (int*int) stream = fn () =>
  stream_append(generate_pairs(n), theNatPairs_helper(n+1))()

val theNatPairs: (int*int) stream = fn() =>
    theNatPairs_helper(0)()






(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-02.sml] *)

(* ****** ****** *)





(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-02.sml] *)
