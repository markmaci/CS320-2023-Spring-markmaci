####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
sys.path.append('/Users/markmaci/Projects/markmaci-CS320-2023-Spring/assigns/06')
from dictwords import *
import queue as queue
sys.path.append('../../../05/MySolution/Python')
from assign05_02 import *
####################################################
"""
HX-2023-03-24: 30 points
Solving the doublet puzzle
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
            return strcon_cons(word1, lambda: bfs_helper(words_queue))
        
    return lambda: bfs_helper(words_queue)

def doublet_stream_from(word):
    words_queue = queue.Queue()
    words_queue.put((word,))
    return bfs(words_queue, word_path_legal)

