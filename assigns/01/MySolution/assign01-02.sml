(*
//
Assign01-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the XlistSubscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)

use "./../MySolution/assign01-01.sml";

fun xlist_sub(xs: 'a xlist, i0: int): 'a =
if xlist_size(xs) - 1 < i0 then raise XlistSubscript
else
  case xs of
    xlist_nil => raise XlistSubscript
    | xlist_cons(x, xs) => if i0 = 0 then x else xlist_sub(xs, i0 - 1)
    | xlist_snoc(xs, x) => if i0 < xlist_size(xs) then xlist_sub(xs, i0) else x
    | xlist_append(xs, ys) => if i0 = 0 then xlist_sub(xs, i0) else if xlist_size(xs) > i0 then xlist_sub(xs, i0) else xlist_sub(ys, i0 - xlist_size(xs))
    | xlist_reverse(xs) => xlist_sub(xs, xlist_size(xs) - i0 - 1)
