(*
Assign00-05: 10 points
Please implement a function that returns the reverse of
a given string:
fun stringrev(cs: string): string
*)

use "./../assign00-lib.sml";

fun reverse(s: string, index: int): string = 
    if index = ~1 then
        ""
    else
        str(strsub(s, index)) ^ reverse(s, index - 1);


fun stringrev(cs: string): string = 
    reverse(cs, strlen(cs) - 1); 


stringrev("hello world");
