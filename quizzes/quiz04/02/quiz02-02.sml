use "./../../../mysmlib/mysmlib-cls.sml";

(* given a stream fxs, stream_dupfind(fxs) returns another stream that enumerates every
element in fxs that is following by a duplicate of itself.  *)

fun stream_is_empty(stream: 'a stream): bool = 
    if stream_length(stream) = 0 then true
    else false

fun stream_dupfind(fxs: int stream) = 
    let fun dupfind(fxs: int stream, prev: int): int stream = 
        if stream_is_empty(fxs) then strcon_nil
        else let val x = stream_head(fxs)
                 val xs = stream_tail(fxs)
             in if x = prev then stream_make_map(x, fn x => x, dupfind(xs, x))
                else dupfind(xs, x)
             end
    in dupfind(fxs, 0)
    end
    
