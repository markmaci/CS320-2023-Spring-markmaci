(*
//
Assign01-01: 10 points
//
Please implement a function
that computes the size of an xlist DIRECTLY:
//
fun xlist_size(xs: 'a xlist): int
//
That is, you should NOT convert xlist into list
and then compute the size of the converted list
//
*)

use "../assign01.sml";
use "../assign01-lib.sml";

fun xlist_size(xs: 'a xlist): int =
  case xs of
    xlist_nil => 0
  | xlist_cons(x, xs) => 1 + xlist_size(xs)
  | xlist_snoc(xs, x) => 1 + xlist_size(xs)
  | xlist_append(xs1, xs2) => xlist_size(xs1) + xlist_size(xs2)
  | xlist_reverse(xs) => xlist_size((xs))



