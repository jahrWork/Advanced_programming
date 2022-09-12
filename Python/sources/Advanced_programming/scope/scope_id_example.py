# AS A SCRIPT: same behaviour as w3school
def f3():
    y = x + 1 
    print( "Id inside f3 =",  id(x), "y = ", y )

def f0():
    try:
        x = x + 1  # warning: x is local 
        print( "Id inside f =",  id(x) )

    except: 
        print( "x is not defined" )

def f7():
    x = 2
    x = x + 1  # x is local 
    print( "Id inside f7 =",  id(x) )

def f1():
    global x  # warning: it violates functional paradigm
    print( "Id before reassign, inside f =",  id(x), "x =", x )
    x = 1.3 
    print( "Id after reassign, inside f =",  id(x), "x =", x )
   
# Object 1.3 is used with two labels
def f4():
    x = 1.3 
    print( "Id inside f4 =",  id(x) )

# Object 1.4 is different to object 1.3 and, hence, different id 
def f5():
    x = 1.4 
    print( "Id inside f5 =",  id(x) )

def f6():
    x = 3. # local x

    def g(): 
        nonlocal x # not local, not global
        return x 

    print( "x inside g() is the same than in f6:", g() )



# x is global
x = 1
print("\n First x id =", id(x)) 

# Global x can be used inside nested functions, id remains the same
f3()
print('Same x id after using x in function =', id(x))

# x is local and not defined locally, a warning appears 
print("\n First x id =", id(x))
f0()
print('id after using x in function =', id(x))

# x is local and defined locally
# Different objects -> different ids
print("\n First x id =", id(x))
f7()
print('id after using x in function f7 =', id(x))  

# Global x can be modified if global keyword is used
# Global entity receives a new id, old one is destroyed
print("\n Impure functions ")
print("\n First x id =", id(x)) 
f1()
print('New x id after global statement =', id(x))

# x now has value 1.3
# Same name and same value, it is not global, but uses the same!
print("\n First x id =", id(x)) 
f4()
print('x id after f4 =', id(x))

# Same name abut different value, it is not global and different id
print("\n First x id =", id(x)) 
f5()
print('x id after f5 =', id(x))

# nonlocal is used instead of global when 
# we have functions nested in other functions
f6()
    
