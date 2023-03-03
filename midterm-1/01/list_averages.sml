(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
int2real
coerces an int into a real:
*)
val int2real = Real.fromInt
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-01: 10 points
*)
(* ****** ****** *)
(*
Given a list of reals xs, list_averages(xs)
returns another list ys of reals such that:
ys[0] = xs[0] / 1.0
ys[1] = (xs[0] + xs[1]) / 2.0
ys[2] = (xs[0] + xs[1] + xs[2]) / 3.0
In general, ys[i] is the average of the first
(i+1) elements in xs.
//
For instance,
list_averages([]) = []
list_averages([1.0,2.0,3.0]) = [1.0,1.5,2.0]
list_averages([1.0,2.0,3.0,4.0]) = [1.0,1.5,2.0,2.5]
//
Note that you are allowed to define recursive
functions in your implementation of list_averages.
//
*)
(* ****** ****** *)
(*
fun
list_averages(xs: real list): real list = ...
*)
(* ****** ****** *)

fun list_take(xs: real list, n: int): real list =
    case xs of
        [] => []
      | y::ys =>
        if n <= 0 then []
        else y::list_take(ys, n-1)

val taketest = list_take([1.0,2.0,3.0], 2)

fun list_averages(xs: real list): real list = 
    let
        fun list_averages_aux(xs: real list, ys: real list, n: int): real list =
            case xs of
                [] => ys
              | _ =>
                if n > length xs then ys
                else
                    let
                        val sum = list_foldleft(list_take(xs, n), 0.0, op +)
                        
                        val avg = sum / real(n)
                    in
                        list_averages_aux(xs, ys @ [avg], n+1) 
                    end
    in
        list_averages_aux(xs, [], 1)
    end

(* ****** ****** *)
    

val test = list_averages([1.0,2.0,3.0])
val test2 = list_averages([1.0,2.0,3.0,4.0])
    

    


(* end of [CS320-2023-Spring-midterm1-list_averages.sml] *)