(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
// 10 points for stream_take
// 10 points for stream_drop
//
Given a stream fxs, stream_take(fxs, n)
returns another stream containing the first
n items in fxs (or all the elements of fxs if
fxs contains fewer than n elements).
//
Given a stream fxs, stream_drop(fxs, n)
returns another stream containing all but the
first n elements of fxs.
//
*)

(* ****** ****** *)

fun stream_take_helper(fxs: 'a stream, index: int): 'a stream = fn() =>
    case index of 
        0 => strcon_nil
      | _ => case fxs() of
            strcon_nil => strcon_nil
          | strcon_cons(x, fxss) => strcon_cons(x, stream_take_helper(fxss, index - 1))


fun stream_take (fxs: 'a stream, n: int): 'a stream = fn() =>
    stream_take_helper(fxs, n)()

(* ****** ****** *)

fun stream_drop_helper(fxs: 'a stream, index: int): 'a stream = fn() =>
    case index of 
        0 => fxs()
      | _ => case fxs() of
            strcon_nil => strcon_nil
          | strcon_cons(x, fxss) => stream_drop_helper(fxss, index - 1) ()


fun stream_drop (fxs: 'a stream, n: int): 'a stream =  fn() =>
    stream_drop_helper(fxs, n)() 

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-00.sml] *)
