from math import sqrt


    
def u(x): 

    try:  
       return x - 1 

    except: 
       None


def v(x): 

    try: 
       return sqrt(x**2-1)

    except: 
       None 
    else: 
        print(" my_sqrt is ok")

def f(x): 

    try: 
       return   1 / x 

    except: 
       return None  


 
def g(x):  
   
    g = x**2 - 2
   
  
def h(x):  
   
    h = sqrt( x**2 - 1 ) 
       
   

def ge(x):  
   
    try: 
       ge = x**2 - 2

    except: 

        None 
   
  
def he(x):  
   
    try: 
      he = sqrt( x**2 - 1 ) 

    except:

      None 
       
   


#print( " Composition = ", u( f( v(0.1) ) ) ) 

#print(" v(0.1) =", v(0.1) )

print(" he =",  he(0.5)  )
print(" ge =", ge( he(0.5) )  )


print(" h =",  h(0.5)  )
print(" g =", g ( h(0.5) )  )

print("end program")