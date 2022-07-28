

def f0():
    try: 
      x = x +1  # warning: x is local 
      print( "Id inside f =",  id(x) )

    except: 
        print( "x ix not defined" )


def f1():
      global x  # warning: it violates functional paradigm
      x = x + 1 
      print( "Id inside f =",  id(x), "x =", x )

      
def f3():
      y = x + 1 
      print( "Id inside f =",  id(x), "y = ", y )


# global keyword destrys the external id 
def f2():
      global x
      x = 1.3 
      y = x + 1 
      print( "Id inside f =",  id(x) )
      

# object 1.3 is used with two labels 
def f4():
      x = 1.3 
      y = x + 1 
      print( "Id inside f =",  id(x) )


# object 1.4 is different to object 1.3 and, consequently, differen id 
def f5():
      x = 1.4 
      y = x + 1 
      print( "Id inside f =",  id(x) )



# object 1.4 is different to object 1.3 and, consequently, differen id 
def f6():
      x = 1.4 
      def g(): 
        nonlocal x 
        y = x + 1 
        return y 

      print( g() )



x = 1



print("\n First x id =", id(x)) 
f0()
print('New x id after global statement =', id(x))

print("Impure functions ")
print("\n First x id =", id(x)) 
f1()
print('New x id after global statement =', id(x))

print("\n First x id =", id(x)) 
f1()
print('New x id after global statement =', id(x))

#exit() 

print("\n First x id =", id(x)) 
f3()
print('New x id after global statement =', id(x))

print("\n First x id =", id(x)) 
f2()
print('New x id after global statement =', id(x))


print("\n First x id =", id(x)) 
f4()
print('New x id after global statement =', id(x))


print("\n First x id =", id(x)) 
f5()
print('New x id after global statement =', id(x))

f6()