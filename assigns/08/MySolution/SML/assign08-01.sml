(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-04-07: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign08-01.sml] *)

fun list_insert_to_stream (element: 'a, list: 'a list): 'a list stream = fn() =>
  case list of
    [] => strcon_cons([element], fn()=> strcon_nil)
  | x::xs => 
    let val xss = list_insert_to_stream(element, xs) 
    in 
    stream_cons(element:: x ::xs, stream_make_map(xss, fn ys => x::ys))()
    end

fun permute_streams(xs: 'a list): 'a list stream = fn() => 
  case xs of 
    [] => strcon_cons([], fn() => strcon_nil)
  | x::xs => 
    let val xss = permute_streams(xs) 
    in 
    stream_concat(stream_make_map(xss, fn ys => list_insert_to_stream(x, ys)))() 
    end

fun stream_permute_list(xs: 'a list): 'a list stream = fn()=>
  permute_streams(xs)()