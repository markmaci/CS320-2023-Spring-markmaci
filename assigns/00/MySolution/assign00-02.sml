(*
Assign00-02: 10 points
Please implement a function that tests whether a
given natural number is a prime:
fun isPrime(n0: int): bool
*)

fun isPrime(n0: int): bool
=
  let
    fun isPrime(n: int, i: int): bool =
      if i = 1 then true
      else if n mod i = 0 then false
      else isPrime(n, i - 1)
  in
    isPrime(n0, n0 - 1)
  end;