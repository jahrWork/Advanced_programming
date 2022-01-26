


#def root(Scheme, w): 

#    #return Scheme( complex(1.,0), 1., 0., lambda u, t: w*u )
#    return Scheme( 1., 1., 0., lambda u, t: w*u )


#def Stability_Region(Scheme, N, x0, xf, y0, yf): 

#    x, y = linspace(x0, xf, N), linspace(y0, yf, N)

#    w = array( [ [ complex( x[i], y[j] ) for j in range(N) ] for i in range(N) ] ) 
      
#    rho = abs( root(Scheme, w) ) 

#    plt.contour( x, y, transpose(rho), linspace(0, 1, 11) )
#    plt.axis('equal')
#    plt.grid()
#    plt.show()



#def test_mapping_RK4(): 

#    N = 100
#    x, y = linspace(-4., 2., N), linspace(-4., 4., N)
#    w = array( [ [ complex( x[i], y[j] ) for j in range(N) ] for i in range(N) ] ) 
      
#    rho = abs( root(RK4, w) ) 

#    plt.contour( x, y, transpose(rho), linspace(0, 1, 11) )
#    plt.axis('equal')
#    plt.grid()
#    plt.show()

