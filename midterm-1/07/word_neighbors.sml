(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-07: 20 points
*)
(* ****** ****** *)
(*
Note that you are not allowed to define
recursive functions for solving this one.
*)
(* ****** ****** *)
(*
Here are some functions that you
can use in your solution to this one.
*)
val
strsub = String.sub
val
string_length = String.size
val
string_implode = String.implode
val
string_filter =
foreach_to_filter_list(string_foreach)
val
string_tabulate =
fn(len, fopr) =>
string_implode(list_tabulate(len, fopr))

(* ****** ****** *)

(*
A word here is defined to be a (possibly empty)
sequence of lowcase letters in the English alphabet.
Two words w1 and w2 are neighbors if they are of the
same length and differ by exactly one letter.
//
For instance, [water] and [later] are neighbors.
For instance, [abcde] and [abxde] are neighbors.
For instance, [abcde] and [abcde] are not neighbors.
//
Given a word, the function [word_neighbors] returns
a list consisting of *all* the neighbors of the word.
//
fun word_neighbors(word: string): string list = ...
//
Please give an implementation of word_neighbors.
Note that you are NOT allowed to define recursive functions
in your implementation
//
*)

(* ****** ****** *)

val AB =
"abcdefghijklmnopqrstuvwxyz"

(* ****** ****** *)

val
string_iforeach =
foreach_to_iforeach(string_foreach)
val
string_imap_list =
fn(cs, ifopr) =>
foreach_to_map_list(string_iforeach)(cs, ifopr)

fun word_neighbors word =
  let
    val len = string_length word
    val indices = list_tabulate (len, fn x => x)
    fun get_neighbors_at_index index =
      let
        val c = strsub (word, index)
        val exclude_self = list_filter([#"a", #"b", #"c", #"d", #"e", #"f", #"g", #"h", #"i", #"j", #"k", #"l", #"m", #"n", #"o", #"p", #"q", #"r", #"s", #"t", #"u", #"v", #"w", #"x", #"y", #"z"],(fn x => x <> c))
        fun get_neighbor ch =
          let
            val new_word = string_tabulate (len, fn i => if i = index then ch else strsub (word, i))
          in
            if new_word <> word then [new_word] else []
          end
      in
        list_concat (list_map (exclude_self, get_neighbor))
      end
  in
    list_concat (list_map(indices, get_neighbors_at_index))
  end



(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-word_neighbors.sml] *)
