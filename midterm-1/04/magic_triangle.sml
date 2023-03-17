(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-04: 10 points
*)
(* ****** ****** *)
(*
Magic Triangle:
             1
           1   1
         1   2   1
       1   3   3   1
     1   4   6   4   1
   1   5   10  10  5   1
 1   6   15  20  15  6   1

THe magic triangle has the following structure:
- All numbers on the left and right borders are 1.
- All numbers in the interior (non-border) are the sum of the
  numbers in the row directly above it.

The following example shows how row 5 is computed from row 4.

row 4:      1     4     6     4    1
           / \   / \   / \   / \  / \
row 5:    1   1+4   4+6   6+4  4+1   1


We can represent a magic triangle in SML as an int list list where each row
is stored as a nested int list.

row 0  [[1]
row 1   [1,  1]
row 2   [1,  2,  1]
row 3   [1,  3,  3,  1]
row 4   [1,  4,  6,  4,  1]
row 5   [1,  5,  10, 10, 5,  1]
row 6   [1,  6,  15, 20, 15, 6,  1]]
...


Please implement a function that produces a magic triangle with n row.

triangle 0 = [[1]]
triangle 1 = [[1], [1, 1]]
triangle 2 = [[1], [1, 1], [1, 2, 1]]
triangle 3 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
triangle 4 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
...
triangle n = ???

Hint: You might want a helper function to compute the current row from
the previous.

*)

(* ****** ****** *)

fun get_last (xs: 'a list): 'a =
  case xs of
    [] => raise Fail "get_last"
  | [x] => x
  | x::ys => get_last ys

fun magic_triangle (n : int) : int list list =
  let
    fun next_row prev_row =
      let
        fun sum lst =
          case lst of
            [] => []
          | [x] => [x]
          | x::y::xs => (x + y) :: sum (y::xs)
      in
        [1] @ sum prev_row 
      end

    fun generate_rows n acc =
      if n = 0 then acc
      else generate_rows (n-1) (acc @ [next_row (get_last acc)])
  in
    generate_rows n [[1]]
  end

val test = magic_triangle 6

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-magic_triangle.sml] *)

(* ****** ****** *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-magic_triangle.sml] *)