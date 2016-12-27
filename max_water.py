# -*- coding: utf-8 -*-

import numpy as np
import timeit
from matplotlib import pyplot as plt

def find_max_water(i, a):
    # input checking
    m = np.argmax(a) + 1
    volume_max = 0
    n = i[-1]
    
    for i in np.arange(1, n + 1):
        volume = np.abs(m - i) * a[i - 1]
        
        if(volume > volume_max):
            volume_max = volume
            i_max = i
            
    if(i_max > m):
        index = np.arange(1, m)
    else:
        index = np.arange(m, n + 1)
        
    for j in index:
        volume = np.abs(i_max - j) * np.min((a[i_max - 1], a[j - 1]))
        
        if(volume > volume_max):
            volume_max = volume
            m = j
    return i_max, m, volume_max


if __name__ == "__main__": 
    timeit.timeit("find_max_water(i, a)", "from __main__ import find_max_water, a, i", number = 1000)
    i = np.arange(1, 5)
    a = np.random.choice(10, size = 4)
    find_max_water(i, a)
    plt.plot(i, a, "o")
