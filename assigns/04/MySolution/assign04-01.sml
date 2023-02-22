(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)


val isPrime = fn (n0: int) =>
if n0 < 2 then false else
int1_forall(n0, fn i0 => if i0 <= 1 then true else n0 mod i0 <> 0);


(* end of [CS320-2023-Spring-assign04-01.sml] *)