(*
//
Assign01-04: 10 points
//
Please recall the following question in Assign00:
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
//
This time you are asked to implement the following
function that only turns a legal representation of an integer
into an integer. By a legal representation of an integer, we
mean a string consisting of a non-empty sequence of digits (where
the digit '0' can be a leading digit).
//
fun str2int_opt(cs: string): int option
//
*)

(* ****** ****** *)

use "./../MySolution/assign01-03.sml";

fun power(x: int, n: int): int =
            if n = 0 then 1
            else x * power(x, n - 1)

fun str2int_opt(cs: string): int option = 
                let
                    fun aux(cs: string, result: int, index: int, n: int): int option=
                        if cs = "" then NONE
                        else if index < 0 then SOME result
                        else if (Char.ord(String.sub(cs, index)) >= 48 andalso Char.ord(String.sub(cs, index)) <= 57) then 
                        
                        aux(cs, result + (Char.ord(String.sub(cs, index)) - 48) * power(10, n), index - 1, n + 1)
                        else NONE
                in
                    aux(cs, 0, String.size(cs) - 1, 0)
                end