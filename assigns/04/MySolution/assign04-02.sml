(* ****** ****** *)
(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)


val list_subsets = fn (xs: 'a list) =>
  let
    val prepend = fn (ys: 'a list list, x: 'a) =>
      ys @ list_map(ys, fn(xs) => x :: xs)
  in
    list_foldright(xs, [[]], prepend)
  end

(* end of [CS320-2023-Spring-assign04-02.sml] *)
