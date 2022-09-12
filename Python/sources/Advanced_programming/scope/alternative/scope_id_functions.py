x = 1

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



#OTHER TESTS
#def f2():
#        global x
#        x = 1.3 
#        y = x + 1 
#        print( "Id inside f =",  id(x) )
