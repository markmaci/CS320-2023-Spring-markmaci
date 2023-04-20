(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)
(*
HX-2023-04-20:
Given a finite or infinite stream fxss of
infinite streams: fxs_0, fxs_1, fxs_2, ...,
stream_zipstrm(fxss) returns an infinite stream
of streams: gxs_0, gxs_1, gxs_2, ..., where we have
gxs_j[i] = fxs_i[j]. Note that this is just the
stream version of stream_ziplst (see Assign07-01).
*)
(* ****** ****** *)


fun stream_zipstrm (fxss: 'a stream stream): 'a stream stream = fn () =>
  let
    fun get_heads (strms: 'a stream stream): 'a list =
      case strms() of
        strcon_nil => []
      | strcon_cons(strm, rest) => (stream_head strm) :: (get_heads rest)

    fun get_tails (strms: 'a stream stream): 'a stream stream =
      case strms() of
        strcon_nil => strcon_nil
      | strcon_cons(strm, rest) => strcon_cons(stream_tail strm, get_tails rest) 

    fun zip_elements (strms: 'a stream stream): 'a stream strcon =
      case strms() of
        strcon_nil => strcon_nil
      | strcon_cons(_, _) => strcon_cons(get_heads strms, stream_zipstrm (get_tails strms))
  in
    zip_elements fxss 
  end






(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-04.sml] *)

(* ****** ****** *)


(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-03.sml] *)
