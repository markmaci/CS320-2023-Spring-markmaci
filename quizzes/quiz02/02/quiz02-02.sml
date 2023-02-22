

use "./../../../mysmlib/mysmlib-cls.sml";

(*
implement a function that takes two lists xs and ys 
of integers and checks whether there exists a pair (x,y)
such that |x-y| < 10 where x is in xs and y is in ys *)

val abs = fn(x: int) => if x>=0 then x else ~x;

val quiz02_02: (int list * int list) -> bool = 
    fn(xs, ys) => 
        let
        fun check(x, ys) = 
            case ys of
            [] => false
            | y::ys' => if abs(x-y) < 10 then true else check(x, ys')
        in
        case xs of
            [] => false
        | x::xs' => if check(x, ys) then true else quiz02_02(xs', ys)
        end;


(*testing*)



