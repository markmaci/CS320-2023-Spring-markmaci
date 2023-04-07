####################################################
#!/usr/bin/env python3
####################################################
import sys
####################################################
sys.path.append('../../../07')
sys.path.append('./../../../../mypylib')
####################################################
from dictwords import *
from mypylib_cls import *
from assign05_02 import *
import queue as Q
####################################################
"""
HX-2023-03-24: 10 points
Solving the doublet puzzle
"""
####################################################
"""
Please revisit assign06_04.py.
######
Given a word w1 and another word w2, w1 and w2 are a
1-step doublet if w1 and w2 differ at exactly one position.
For instance, 'water' and 'later' are a 1-step doublet.
The doublet relation is the reflexive and transitive closure
of the 1-step doublet relation. In other words, w1 and w2 are
a doublet if w1 and w2 are the first and last of a sequence of
words where every two consecutive words form a 1-step doublet.
<Here is a little website where you can use to check if two words
for a doublet or not:
http://ats-lang.github.io/EXAMPLE/BUCS320/Doublets/Doublets.html
######
"""
####################################################

def word_neighbors_legal(word):
    return fnlist_filter_pylist(word_neighbors(word), word_is_legal)
    
def word_path_legal(word_path):
    word1 = word_path[-1]
    words = word_neighbors_legal(word1)
    return [word_path + (word2,) for word2 in words]

def bfs(words_queue, fchildren):
    def bfs_helper(words_queue):
        if words_queue.empty():
            return strcon_nil()
        else:
            word1 = words_queue.get()

            for word2 in fchildren(word1):
                words_queue.put(word2)
            return (word1, lambda: bfs_helper(words_queue))
        
    return lambda: bfs_helper(words_queue)

def doublet_bfs_test(w1, w2):
    words_queue = Q.Queue()
    visited = set()
    visited.add(w1)
    words_queue.put((w1,))
    while not words_queue.empty():
        word_path = words_queue.get()
        if word_path[-1] == w2:
            return word_path
        for neighbor in word_neighbors_legal(word_path[-1]):
            if neighbor not in visited:
                visited.add(neighbor)
                words_queue.put(word_path + (neighbor,))

    return None
                
    


    
    
####################################################
