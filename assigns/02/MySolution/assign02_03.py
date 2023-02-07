####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign02.sml)


def mylist_mergesort(l1):
    if l1 == mylist_nil():
        return mylist_nil()
    else:
        xs = l1.get_cons2()
        if xs == mylist_nil():
            return l1.get_cons1()
        else:
            ys, zs = mylist_split(xs)
            return mylist_merge(mylist_mergesort(mylist_cons(l1.get_cons1(), ys)), mylist_mergesort(mylist_cons(xs.get_cons1(), zs)))


def mylist_split(xs):
    mylist_print(xs)
    print('\n')
    if xs.get_ctag() == 0:
        print("xs.get_ctag() == 0")
        return mylist_nil(), mylist_nil()
    else:
        if xs.get_cons2().get_ctag() == 0:
            return mylist_cons(xs.get_cons1(), mylist_nil()), mylist_nil()
        else:
            ys, zs = mylist_split(xs.get_cons2().get_cons2())
            return mylist_cons(xs.get_cons1(), ys), mylist_cons(xs.get_cons2().get_cons1(), zs)


def mylist_merge(ys, zs):
    if ys.get_ctag() == 0:
        return zs
    if zs.get_ctag() == 0:
        return ys
    if ys.get_cons1() <= zs.get_cons1():
        return mylist_cons(ys.get_cons1(), mylist_merge(ys.get_cons2(), zs))
    else:
        return mylist_cons(zs.get_cons1(), mylist_merge(ys, zs.get_cons2()))
            
#
####################################################
