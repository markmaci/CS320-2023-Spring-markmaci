####################################################
#!/usr/bin/env python3
####################################################
"""
HX-2023-04-07: 20 points
You are required to implement the following function
generator_merge2 WITHOUT using streams. A solution that
uses streams is disqualified.
"""
def generator_merge2(gen1, gen2, lte3):
    """
    Given two generators gen1 and gen2 and a comparison
    function lte3, the function generator_merge2 returns
    another generator that merges the elements produced by
    gen1 and gen2 according to the order specified by lte3.
    The function generator_merge2 is expected to work correctly
    for both finite and infinite generators.
    """
    val1 = next(gen1)
    val2 = next(gen2)
    while True:
        if lte3(val1, val2):
            yield val1
            try :
                val1 = next(gen1)
            except StopIteration:
                yield val2
                for val2 in gen2:
                    yield val2
                return
        else:
            yield val2
            try:
                val2 = next(gen2)
            except StopIteration:
                yield val1
                for val1 in gen1:
                    yield val1
                return
        

      

####################################################
