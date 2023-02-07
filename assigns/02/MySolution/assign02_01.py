####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_append (see list_append in assign02.sml)

def mylist_append(l1, l2):
    if l1.get_ctag() == 0:
        return l2
    else:
        return mylist_cons(l1.get_cons1(), mylist_append(l1.get_cons2(), l2))
    
# mylist_rappend (see list_rappend in assign02.sml)

def mylist_rappend(l1, l2):
    if l1.get_ctag() == 0:
        return l2
    else:
        return mylist_rappend(l1.get_cons2(), mylist_cons(l1.get_cons1(), l2))
    
# mylist_reverse (see list_reverse in assign02.sml)

def mylist_reverse(l1):
    if l1.get_ctag() == 0:
        return mylist_nil()
    else: 
        return mylist_rappend(mylist_reverse(l1.get_cons2()), mylist_cons(l1.get_cons1(), mylist_nil()))

#
####################################################
