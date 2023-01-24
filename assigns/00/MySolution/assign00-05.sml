(*
Assign00-05: 10 points
Please implement a function that returns the reverse of
a given string:
fun stringrev(cs: string): string
*)

fun reverse(s: string, index: int): string = 
    if index = ~1 then
        ""
    else
        str(String.sub(s, index)) ^ reverse(s, index - 1);


fun stringrev(cs: string): string = 
    reverse(cs, String.size(cs) - 1); 


stringrev("hello world");

(*