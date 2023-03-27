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

(* ****** ****** *)


fun the_ln2_stream () =
  let
    fun ln2_helper (n, sign, sum) () =
      let
        val term = sign / Real.fromInt(n)
      in
        strcon_cons (sum + term, ln2_helper (n + 1, ~sign, sum + term))
      end
  in
    strcon_cons (1.0, ln2_helper (2, ~1.0, 1.0 / 2.0))
  end
    

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-01.sml] *)

(* ****** ****** *)


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-01.sml] *)
