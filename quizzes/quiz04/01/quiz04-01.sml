<<<<<<< HEAD
use "./../../../mysmlib/mysmlib-cls.sml";

fun stream_cycling_list(xs: 'a list): 'a stream = fn() => 
    let
        fun cycle [] = strcon_nil
          | cycle (x::xs) = strcon_cons (x, fn() => cycle (xs @ [x]))
    in
        cycle xs
        
    end


val xs = [1, 2, 3, 4, 5];
val ys = stream_cycling_list xs;
=======
(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
Please put your implementation here for quiz04-01
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz04-01.sml] *)
>>>>>>> upstream/main
