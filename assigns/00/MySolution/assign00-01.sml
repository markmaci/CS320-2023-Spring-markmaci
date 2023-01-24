(*
Assign00-01: 10 points
Please find the first integer N such that the
evaluation of fact(N) in SML/NJ yields an Overflow
exception.
*)

fun fact (n) = 
    if n = 0 then 1
    else fact (n - 1) * n;


fun findOverflow(x: int): int = fact(x) handle overflow => 0;

fun findN(n: int): int = if findOverflow(n) = 0 then n else findN(n+1);

val N = findN(0);
