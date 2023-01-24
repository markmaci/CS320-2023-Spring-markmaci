(*
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
*)

fun power(x, 0) = 1
| power(x, n) = x * power(x,n-1); 

fun convert (s: string, index: int, len: int) : int =
    if index + 1 = String.size(s) then Char.ord(String.sub(s, index)) - 48
    else (Char.ord(String.sub(s, index)) - 48) * power(10, len) + convert(s, index + 1, len - 1);

fun str2int(cs: string) : int = convert(cs, 0, String.size(cs)-1);





