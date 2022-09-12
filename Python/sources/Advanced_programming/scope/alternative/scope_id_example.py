from scope_id_functions import *

def scope_id_example():
    # x is imported and is global
    global x
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




#OTHER TESTS
# If we repeat the call to f1 after another call, 
# the id is destroyed once again 
#print("\n First x id =", id(x)) 
#f1()
#print('New x id after global statement =', id(x))

# global keyword does not destroy the external id but reassigning does
#print("\n First x id =", id(x)) 
#f2()
#print('New x id after global statement =', id(x))