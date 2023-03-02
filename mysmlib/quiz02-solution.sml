fun
quiz02_01
(word: string) =
fn(c0) =>
string_foldleft
(word, 0, fn(r0, c1) => if c0 <> c1 then r0 else r0+1)

val
quiz02_02 =
fn(xs, ys) =>
list_exists(xs, fn(x) => list_exists(ys, fn(y) => abs(x-y) < 10))