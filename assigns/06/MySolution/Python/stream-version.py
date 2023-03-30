####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
import queue as queue
####################################################
"""
HX-2023-03-24: 20 points
Solving the N-queen puzzle
"""
####################################################

def solve_N_queen_puzzle(N):
    q = queue.LifoQueue()
    q.put((-1) * N)
    return dfs(q, fchildren)

# def gtree_dfs(boards, fchildren):
#     if boards == None:
#         return None
#     else:
#         board1 = boards.cons1
#         boards = boards.cons2
#         return strcon_cons(board1, lambda: gtree_dfs(fchildren(board1) @  boards, fchildren))
    
# def fchildren(board):
#     # given a board of size n, return a stream of all possible child boards
#     # where a child board is a possible board after placing one more queen piece

#     stream_forall

def board_for_each(board, work):
    for i in range(len(board)):
        work(board[i])
    return

def board_get_at(board, i):
    return board[i]

def board_tabulate(N, f):
    return tuple([f(i) for i in range(N)])

def board_set_at(board, i, j):
    board = list(board)
    board[i] = j
    return tuple(board)

def board_safety_one(board, i):
    pi = board_get_at(board, i)
    def helper(j):
        pj = board_get_at(board, j)
        return pi != pj and abs(i-j) != abs(pi-pj)
    
    return int1_forall(i, helper)

def board_safety_all(board):
    return int1_forall(len(board), lambda i: board_safety_one(board, i))

def fchildren(board):
    for s in range(len(board)):
        if board[s] == -1:
            i = s
            break
    pylist_filter_pylist(int1_map_pylist(len(board), lambda j: board_set_at(board, i, j)), lambda board: board_safety_one(board, i))

# def dfs(boards, fchildren):
#     if boards == None:
#         return None
#     else:
#         board1 = boards.cons1
#         boards = boards.cons2
#         return strcon_cons(board1, lambda: dfs(fchildren(board1) @  boards, fchildren))
    

def dfs_stream(boar



 


        
    





    
    


####################################################
