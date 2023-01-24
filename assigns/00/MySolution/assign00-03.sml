(*
Assign00-03: 10 points
Please implement a function that converts a given
integer to a string that represents the integer:
fun int2str(i0: int): string
*)

use "./../assign00-lib.sml";

fun int2str (n: int) : string = 
    if n < 10 then str(chr(n + 48))
    else int2str(n div 10) ^ str(chr((n mod 10) + 48));

int2str(1234);  