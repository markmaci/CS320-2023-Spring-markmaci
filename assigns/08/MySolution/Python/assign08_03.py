####################################################
#!/usr/bin/env python3
####################################################

import queue
"""
HX-2023-04-07: 20 points
The following implementation is stream-based:
# def graph_bfs(nxs, fnexts):
#     visited = set()
#     def helper(qnxs):
#         if qnxs.empty():
#             return strcon_nil()
#         else:
#             nx1 = qnxs.get()
#             # print("gtree_bfs: helper: nx1 = ", nx1)
#             for nx2 in fnexts(nx1):
#                 if not nx2 in visited:
#                     qnxs.put(nx2)
#                     visited.add(nx2)
#             return strcon_cons(nx1, lambda: helper(qnxs))
#         # end-of-(if(qnxs.empty())-then-else)
#     qnxs = queue.Queue()
#     for nx0 in nxs:
#         qnxs.put(nx0)
#         visited.add(nx1)
#     return lambda: helper(qnxs)
Please give a generator-based implementation of graph_bfs!!!
"""



def generator_graph_bfs(nxs, fnexts):
    """
    This function does the same as graph_bfs.
    """
    visited = set()
    qnxs = list(nxs)  # Convert nxs to a list for easier handling

    while qnxs:
        nx1 = qnxs.pop(0)  # Pop the first element from qnxs
        yield nx1  # Yield the next node in the BFS traversal
        for nx2 in fnexts(nx1):
            if nx2 not in visited:
                qnxs.append(nx2)  # Append unvisited neighbors to qnxs
                visited.add(nx2)  # Add nx2 to visited set
####################################################
