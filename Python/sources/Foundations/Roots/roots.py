from cmath import sqrt #complex math library 

def Roots_2th(): 

   print("Roots of a x**2 + b* x + c = 0 ")

  #a, b, c = input(" Enter a, b, c").split()
   a = 1; b = 1; c = 1

   x1 = ( - b + sqrt( b**2 - 4* a*c ) )/(2*a)
   x2 = ( - b - sqrt( b**2 - 4* a*c ) )/(2*a)

   print( " x1=", x1, "x2 =", x2) # output


