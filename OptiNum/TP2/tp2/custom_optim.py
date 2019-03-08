from scipy.optimize import line_search, minimize
import numpy as np

def Wolfe_line_search(sim,xk,pk):
    
    def f(x):
        f,g = sim(x)
        return f
    
    def myfprime(x):
        f,g = sim(x)
        return g   
    
    res = line_search(f, myfprime, xk, pk, gfk=None, old_fval=None, old_old_fval=None, args=(), c1=0.0001, c2=0.9, amax=50)

    return res[0]