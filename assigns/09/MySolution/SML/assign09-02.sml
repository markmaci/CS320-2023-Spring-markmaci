(* ****** ****** *)
use "./../../MySolution/SML/generator.sml";
(* ****** ****** *)
use "./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
There is an implementation of infinite generators
in [generator.sml]. Please study the implementation.
How do you use it to give an implementation of generators
that are possibily finite?
*)

(* ****** ****** *)

type 'a fgenerator = 'a option generator

(* ****** ****** *)

(*
//
HX-2023-04-15: 20 points
//
Please implement the following function that converts
a stream into a generator that is possibly finite.
(*
There is not much code to write here; the problem mainly
test your understanding of continuations.
*)
//

//
*)

fun
fgenerator_make_stream2(fxs: 'a stream, ret, cret) = 
    case fxs() of
        strcon_nil =>
            let 
                val () = generator_yield(NONE, ret, cret)
            in
                fgenerator_make_stream2(fxs, ret, cret)
            end
        | strcon_cons(x, xs) =>
            let
                val () = generator_yield(SOME(x), ret, cret)
            in
                fgenerator_make_stream2(xs, ret, cret)
            end
    

fun fgenerator_make_stream(fxs: 'a stream): 'a fgenerator =
    generator_make_fun(fn (ret, cret) => fgenerator_make_stream2(fxs, ret, cret))

(* ****** ****** *)