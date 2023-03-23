####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
#
# HX-2023-03-14: 20 points
# Please *translate* into Python the posted solution
# on Piazza for word_neighbors (which is writtend in SML)
#
def word_neighbors(word):
    """
    Note that this function should returns a fnlist
    (not a pylist)
    Your implementation should be combinator-based very
    much like the posted solution.
    """
    AB = "abcdefghijklmnopqrstuvwxyz"
    len_word = len(word)
    neighbors =  ["".join([word[j] if j != i else c for j in range(len_word)]) 
            for i in range(len_word) for c in AB if c != word[i]]
 
    return pylist_fnlistize(neighbors)
#
####################################################
