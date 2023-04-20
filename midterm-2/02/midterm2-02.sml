(* ****** ****** *)

use "./../../mysmlib//mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
The mytree datatype is defined as follows.
Each node in mytree contains a stored element
plus a list of children, where the list can be
empty.
//
Please implement a function mytree_dfs_streamize
that enumerates a given mytree in a depth-first manner.
//
*)
(* ****** ****** *)

datatype 'a mytree =
  mytree_node of 'a * ('a mytree list)

(* ****** ****** *)

fun mytree_dfs_helper(t0: 'a mytree): 'a stream = fn () => 
  case t0 of
    mytree_node (x, []) =>
     strcon_cons(x, fn() => strcon_nil)
  | mytree_node (x, y::ys_tail) =>
   stream_cons(x, stream_append(mytree_dfs_helper(y),mytree_dfs_helper(mytree_node(x,ys_tail))))()


fun mytree_dfs_streamize(t0: 'a mytree): 'a stream = fn() =>
  mytree_dfs_helper(t0)()

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-02.sml] *)
