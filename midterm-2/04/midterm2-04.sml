(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
// A non-empty sequence of numbers forms a
// "drawdown" if every number in the sequence does not
// exceed the first one. A maximal drawdown is one that
// is not contained in any longer drawdowns.
// Please implement a function stream_drawdowns that takes
// an infinite stream fxs of integers and returns a stream
// enumerating all the maximal drawdowns in fxs.
//
*)

(* ****** ****** *)


fun
stream_drawdowns(fxs: int stream): int list stream = 
let fun 
  stream_drawdowns_aux(fxs: int stream): int list stream = 
  let fun
    stream_drawdowns_aux_aux(fxs: int stream, acc: int list): int list stream =
    let val
      head = stream_head(fxs)
    in
      if head < head fxs then
        stream_cons(acc, stream_drawdowns_aux_aux(stream_tail(fxs), hd::acc))
      else
        stream_cons(acc, stream_drawdowns_aux_aux(stream_tail(fxs), [hd]))
    end
  in
    stream_drawdowns_aux_aux(fxs, stream_head(fxs))
  end
in
    stream_drawdowns_aux(fxs)
    end

(* ****** ****** *)


(* end of [CS320-2023-Spring-midterm2-04.sml] *)
