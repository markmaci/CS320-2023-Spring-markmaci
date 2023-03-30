####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('/Users/markmaci/Projects/markmaci-CS320-2023-Spring/mypylib')
from mypylib_cls import *
import queue as queue
####################################################
"""
HX-2023-03-24: 20 points
Solving the N-queen puzzle
"""
####################################################

def nqueen(bd):
    res = 0
    for j0 in bd:
        if j0 <= 0:
            break
        else:
            res = res + 1
    return res

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

def board_safety_one(bd, i0):
    def helper(j0):
        pi = bd[i0]
        pj = bd[j0]
        return pi != pj and abs(i0-j0) != abs(pi-pj)
    return int1_forall(i0, helper)

def board_safety_all(bd):
    return \
        int1_forall\
        (nqueen(bd), \
         lambda i0: board_safety_one(bd, i0))

def fchildren(board):
    i = -1
    for s in range(len(board)):
        if board[s] == -1:
            i = s
            break
    return pylist_filter_pylist(int1_map_pylist(len(board), lambda j: board_set_at(board, i, j+1)), lambda board: board_safety_one(board, i))

def board_is_full(board):
    return int1_forall(len(board), lambda i: board[i] != -1)


def dfs(boards_queue, fchildren):
    visited = set()
    def dfs_helper(boards_queue):
        if boards_queue.empty():
            return strcon_nil()
        else:
            board1 = boards_queue.get()
            for child in fchildren(board1):
                if child not in visited:
                    visited.add(child)
                    boards_queue.put(child)
        return strcon_cons(board1, lambda: dfs_helper(boards_queue))    
    return lambda: dfs_helper(boards_queue)

def solve_N_queen_puzzle(N):
    q = queue.LifoQueue()
    empty_board = tuple([-1 for i in range(N)])
    q.put(empty_board)
    valid_boards = dfs(q, fchildren)
    filtered = stream_make_filter(valid_boards, lambda bd: board_is_full(bd))
    final = stream_make_filter(filtered, lambda bd: board_safety_all(bd))

    return final





    





# print(test_dfs.cons2)
    


# solve_N_queen_puzzle(7)



 


        
    





    
    


####################################################
