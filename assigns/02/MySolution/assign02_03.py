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
            mylist_merge(mylist_mergesort(mylist_cons(l1.get_cons1(), ys)), mylist_mergesort(mylist_cons(xs.get_cons1(), zs)))


def mylist_split(xs):
    ### function to recursively split the list into two halves
    mylist_print(xs)
    print("\n")
    if xs.get_ctag() == 0:
        print('here')
        return mylist_nil(), mylist_nil()
    else:
        if xs.get_cons1() == mylist_nil():
            return xs.get_cons2(), mylist_nil()
        if xs.get_cons2().get_ctag() == 0:
            return xs.get_cons1(), mylist_nil()
        else:
            ys, zs = mylist_split(xs.get_cons2())
            return mylist_cons(xs.get_cons1(), ys), mylist_cons(xs.get_cons2().get_cons1(), zs)

def mylist_merge(l1, l2):
    if l1.get_ctag() == 0:
        return l2
    elif l2.get_ctag() == 0:
        return l1
    else:
        if l1.get_cons1() <= l2.get_cons1():
            return mylist_cons(l1.get_cons1(), mylist_merge(l1.get_cons2(), l2))
        else:
            return mylist_cons(l2.get_cons1(), mylist_merge(l1, l2.get_cons2()))
            
#
####################################################
