class polygon():
     def __init__(self, sides): #constructor
      self.N_sizes = len(sides)
      self.length = sides

     def perimeter(self):
        sides = self.length

        return sum(sides); 

class square(polygon):   #inheritance from polygon
     S = 4
     def __init__(self, L):
      super(polygon,self).__init__()
      self.L = L 
      self.N_sides = 4
      self.length = [ L, L, L, L ]  

     def perimeter(self):    #method overriding 
        return 4*self.L

class circle(polygon):
     def __init__(self, R): #constructor
        self.R = R

     def perimeter(self): 

        PI = 3.1416
        return 2 * PI * self.R 
 
    
def polymorphism_example(): 
    
   P = polygon( [1., 2., 3. ] )   # polygon 
   S = square( 4. )               # square length side = 4 
   C = circle( 10. )              # circle of radius = 10 

    
   Polygons = [ P, S, C, P ]

   L = 0
   for P in Polygons: 
     L = L + P.perimeter() 

   print(" Total perimeter = ", 2 * 6 + 4 * 4 + 2 * 3.1416 * 10     )
   print(" polygons Total perimeter = ", L  ) 
   print(" " )


if __name__ == "__main__": 

    polymorphism_example()

