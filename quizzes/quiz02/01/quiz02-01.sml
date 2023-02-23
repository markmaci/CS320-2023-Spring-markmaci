
use "./../../../mysmlib/mysmlib-cls.sml";

val strlen = foreach_to_length(string_foreach)

val strsub = foreach_to_get_at(string_foreach)

(*
given a word word of type string, return a functioon of the type
char -> int, this function returns
the number of times this char appears in the word
*)

fun quiz02_01(word: string): char -> int =
    let
        val wordlen = strlen(word)
        fun count(c: char): int =
        let
            fun count_aux(i: int, acc: int): int =
            if i = wordlen then acc
            else if c = strsub(word, i) then count_aux(i+1, acc+1)
            else count_aux(i+1, acc)
        in
            count_aux(0, 0)
        end
    in
        count
    end
    
(*testing*)

val count = quiz02_01("abracadabra")



