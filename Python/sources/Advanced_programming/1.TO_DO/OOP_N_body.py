from numpy import array, empty, vectorize, split, zeros, append  


class body: 
    def __init__(self, r, v, m): 
        self.r = r
        self.v = v 
        self.m = m 

class galaxy: 
     def __init__(self, N): 
        self.planets = empty( (N), dtype=body)

     def forces(self): 

        a =  zeros(3)

        for i in self.planets: 
            a[:] = 0 
            for j in self.planets: 
                
                if i==j: 
                    a = a + i.r - j.r 
            i.dvdt = a 
            i.drdt = i.v 

def Euler(U, t, dt, F): 

    return U + dt* F(U,t)

#def F_N_body(U, t): 

#    g = galaxy(10) 
#    g.forces()
#    for i in g.planets: 
#        F = append( F, [i.drdy, i.dvdt] ) 
  


def EulerG( g, dt ): 

    g.forces()
    for i in g.planets:
       i.r = i.r + dt * i.drdt
       i.v = i.v + dt * i.dvdt
    return g 

    


r1 = array( [1, 0, 0]) 
v1 = array( [1, 1, 1]) 
m1 = 10

g = galaxy(10)
g.planets[:] = body( r1,v1, m1 )

g = EulerG(g, 0.1) 


print( " galaxy =", g.planets[3].r )


#g.b[0] = b1


#print( " position b1=", g.b[0].r)

#print( " position N_bodies=", N_bodies[2].r)