(*
//
Assign01-03: 10 points
//
Please implement a function that converts a given
xlist 'xs' into another xlist 'ys' by removing the
constructor 'mylist_reverse':
//
fun xlist_remove_reverse(xs: 'a xlist): 'a xlist
//
In particular, your implementation should guarantee:
1. 'xs' and 'ys' represent the same list
2. 'ys' does NOT make any use of 'xlist_reverse'
3. 'xs' and 'ys' use the same number of 'xlist_append'
//
*)

use "./../MySolution/assign01-02.sml";

fun xlist_remove_reverse(xs: 'a xlist): 'a xlist =
    let 
        fun aux(xs: 'a xlist, revRemoved: bool): 'a xlist = 
            case xs of
                xlist_nil => xlist_nil
                | xlist_cons(x, xs') => if revRemoved then xlist_snoc(aux(xs', revRemoved), x) else xlist_cons(x, aux(xs', revRemoved))
                | xlist_snoc(xs', x) => if revRemoved then xlist_cons(x, aux(xs', revRemoved)) else xlist_snoc(aux(xs', revRemoved), x)
                | xlist_append(xs', ys') => xlist_append(aux(xs', revRemoved), aux(ys', revRemoved))
                | xlist_reverse(xs') => aux(xs', not revRemoved)
    in
        aux(xs, false) end;
