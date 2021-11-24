from  numpy import split, concatenate
from numpy.linalg import    norm

def F_Kepler(U, t):

    r, drdt  = split( U, 2) 
    dvdt = -r/norm(r)**3 
    
    return concatenate( [ drdt, dvdt ] ) 

