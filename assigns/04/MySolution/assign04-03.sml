(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)
type
('xs, 'x0) forall_t =
'xs * ('x0 -> bool) -> bool
type
('xs, 'x0) exists_t =
'xs * ('x0 -> bool) -> bool
(* ****** ****** *)

val forall_to_exists = fn (forall_t: ('xs,'x0)forall_t) =>
fn (xs, p) => not(forall_t(xs, fn x => not (p x)))



(* end of [CS320-2023-Spring-assign04-03.sml] *)
