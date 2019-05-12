from contextlib import contextmanager
from timeit import default_timer

@contextmanager
def Time():
    """
    Measures and yields elapsed time
    """
    start = default_timer()
    elapsed = lambda: default_timer() - start
    yield lambda: elapsed()
    end = default_timer()
    elapsed = lambda: end-start
    
# ----------------------------------------------------------------
    
from matplotlib import pyplot as plt
import seaborn as sns

def plot_iterations(f_tab):
    """
    Plots the values of f_tab along the iterations
    """
    plt.figure(figsize=(20, 5))
    sns.set_style("darkgrid")
    sns.set(font_scale=1.4)
    plt.plot(range(len(f_tab)), f_tab, 'dodgerblue')
    plt.xlabel('Iteration k')
    plt.ylabel('Minimum of th found so far')
    plt.title('th(lam_k) along the iterations')
    plt.show()

# ----------------------------------------------------------------

import numpy as np
from matplotlib import pyplot as plt
from matplotlib import colors
from matplotlib.gridspec import GridSpec
import seaborn as sns

def plot_results(theta_tab, A, U, cost, runtime):
    """
    Plots the values of theta_tab along the iterations
    And the choice of affectation corresponding to the last lambda
    """
    
    print('Total computation time : {0:0.3f}s'.format(runtime))
    
    gs  = GridSpec(1,3)
    fig = plt.figure(figsize=(20, 5))
    
    # min(theta_tab) along the iterations
    sns.set_style("darkgrid")
    sns.set(font_scale=1.4)
    ax1 = fig.add_subplot(gs[0,:2])
    ax1.plot(range(len(theta_tab)), theta_tab, 'dodgerblue')
    ax1.set_xlabel('Iteration k')
    ax1.set_ylabel('Minimum of th found so far')
    ax1.set_title('th(lam_k) along the iterations')
    
    # choice of affectation
    ax2 = fig.add_subplot(gs[0,2])
    cmap = colors.ListedColormap(['white', 'cyan'])
    ax2.imshow(U-0.5, interpolation ='none', aspect = 'auto', cmap=cmap)
    ax2.set_title('Choice of affectation (total cost = {})'.format(cost))
    ax2.grid(False)
    ax2.axis('off')
    
    for (j,i), label in np.ndenumerate(A):
        ax2.text(i,j, label,ha='center',va='center', color='k')
        
    plt.show()
    
# ----------------------------------------------------------------

BOLD = '\033[1m'
END = '\033[0m'
