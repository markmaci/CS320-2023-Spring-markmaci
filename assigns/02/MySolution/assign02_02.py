####################################################
import sys
sys.path.append('..')
from assign02 import *
from assign02_01 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign02.sml) using recursion

def mylist_quicksort(l1):
        return mylist_qsort(l1)

def mylist_qsort(l1):
    if l1.get_ctag() == 0:
        return mylist_nil()
    else:
        ys, zs = mylist_qpart(l1.get_cons2(), l1.get_cons1())
        ys = mylist_qsort(ys)
        zs = mylist_qsort(zs)
        return mylist_append(ys, mylist_cons(l1.get_cons1(), zs))


def mylist_qpart(l1, pivot):
    if l1.get_ctag() == 0:
        return (mylist_nil(), mylist_nil())
    else:
        ys, zs = mylist_qpart(l1.get_cons2(), pivot)
        if l1.get_cons1() <= pivot:
            return (mylist_cons(l1.get_cons1(), ys), zs)
        else:
            return (ys, mylist_cons(l1.get_cons1(), zs))
#
####################################################
