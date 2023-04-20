(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
A sequence xs of integers captures '231'
if there are three integers a, b, and c
appearing as a subsequence of in satisfying
c < a < b. Note that a, b, and c doe not have
to appear consecutively in xs.

For instance, [1,3,4,2] does capture '231'
For instance, [1,2,4,3] does not capture '231'
For instance, [1,2,3,4] does not capture '231'
*)

(* ****** ****** *)

fun check_231(a, b, remaining) =
    case remaining of
        [] => false
        | c :: remaining_tail =>
        if c < a andalso a < b then
            true
        else
            check_231(a, b, remaining_tail)

fun perm_capture_231(xs: int list): bool = 
    case xs of
        [] => false
        | x :: xss =>
            case xss of
            [] => false
            | y :: xss_tail => 
                check_231(x, y,xss) orelse perm_capture_231(xss) 

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-05.sml] *)
