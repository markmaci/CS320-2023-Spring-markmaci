(* ****** ****** *)
(*
HX-2023-01-22:
Library functions
for BUCASCS320-2023-Spring
This is an individual library, which
is not shared by the class.
//
Please build it up for your OWN use.
//
*)
(* ****** ****** *)

(* end of [BUCASCS320-2023-Spring-mysmlib-ind.sml] *)

(* raises an exception for lists of unequal length *)
fun zip (xs : 'a list, ys : 'b list) : ('a * 'b) list =
    case (xs, ys)
     of ([], []) => []
      | (x :: xs, y :: ys) => (x, y) :: zip (xs, ys)
      | _ => raise ConsMatch320

(* returns NONE for lists of unequal length *)
fun zip_opt (xs : 'a list, ys : 'b list) : ('a * 'b) list option =
    case (xs, ys)
     of ([], []) => SOME []
      | (x :: xs, y :: ys) => 
        let val opt = zip_opt (xs, ys)
        in
            case opt
              of NONE => NONE
               | SOME zs => SOME ((x, y) :: zs)
        end
      | _ => NONE

(* raises an exception for list of unequal length *)
fun map2 (xs : 'a list, ys : 'b list, fopr : ('a * 'b) -> 'c) : 'c list =
    list_map (zip (xs, ys), fopr)

fun map2_opt (xs : 'a list, ys : 'b list, fopr : ('a * 'b) -> 'c) : 'c list option =
    case zip_opt (xs, ys)
      of NONE => NONE
       | SOME zs => SOME (list_map (zs, fopr))

(* example: dot product
   dot_product ([1, 2, 3, 4], [5, 6, 7, 8])
   = (1 * 5) + (2 * 6) + (3 * 7) + (4 * 8) *)
fun dot_product (xs : int list, ys : int list) : int =
    list_foldleft (map2 (xs, ys, fn (x, y) => x * y), 0,
                   fn (z, acc) => acc + z)

fun dot_product_opt (xs : int list, ys : int list) : int option =
    case map2_opt (xs, ys, op*)
      of NONE => NONE
       | SOME zs => SOME (list_foldleft (zs, 0, op+))

(* list_foldlefti is a variant of list_foldleft that takes into
   account the position of the element

   interestingly list_foldlefti can actually be implemented in
   terms of the normal list_foldleft by using a tuple as the
   accumulator *)
fun list_foldlefti (xs : 'a list, r0 : 'b, fopr : (int * 'b * 'a -> 'b)) : 'b =
    #2 (list_foldleft (xs, (0, r0),
                       fn ((i, acc), x) => (i + 1, fopr (i, acc, x))))

(* repeat_string takes a list of strings and returns a string
   consisting of strings in the list repeated a number of times
   according to its position in the list *)
fun repeat_string (xs : string list) : string =
    list_foldlefti (xs, "", fn (i, acc, x) =>
    int1_foldleft (i + 1, acc, fn (acc, _) => acc ^ x))
