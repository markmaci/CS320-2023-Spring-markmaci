(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-31: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst(stream_list: 'a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)

fun stream_is_empty(stream: 'a stream): bool = 
    if stream_length(stream) = 0 then true
    else false

fun
stream_ziplst(stream_list: 'a stream list): 'a list stream = fn () =>
let 
fun stream_ziplst_aux(stream_list: 'a stream list): 'a list stream = fn () =>
    if list_exists(stream_list, stream_is_empty) then strcon_nil
    else
    strcon_cons(list_map(stream_list, fn s => 
         stream_head(s)),
     stream_ziplst_aux(list_map(stream_list, fn s => stream_tail(s))))

in
    stream_ziplst_aux(stream_list)()
end


(* end of [CS320-2023-Spring-assign07-01.sml] *)
