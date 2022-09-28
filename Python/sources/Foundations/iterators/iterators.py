from numpy import array, zeros, nditer 


# python lists 
V =  [ 1, 2, 3 ]
W =  [ 4, 5, 6 ]

for v in V: 
    print("v=", v)

for v, w in zip(V, W): 
    print("v=", v, "w=", w)

# numpy arrays  
N = 10 
V = zeros(N+1) 
W = zeros(N+1) 

V[:] = 2. 
W[:] = 4. 

for i in range(len(V)): 
    print("i=", i, " v[i] =",V[i] )

for v in nditer(V): 
    print("v=", v)


for v, w in zip( nditer(V), nditer(W) ): 
    print("NP v=", v, "w=", w)