from hypothesis import given
from hypothesis.strategies import text
from hypothesis.strategies import integers, floats
from hypothesis.extra.numpy import arrays

from hypothesis import settings, Verbosity 
from numpy import float, int8, all, any, nan, inf, sqrt, abs, sign 
from math import  isinf, isnan

#from os_sys.float_info import epsilon



def encode(input_string):

 if not input_string:
     return []

 else:
    count = 1
    prev = ""
    lst = []
    for character in input_string:
        if character != prev:
            if prev:
                entry = (prev, count)
                lst.append(entry)
            count = 1
            prev = character
        else:
            count += 1
    entry = (character, count)
    lst.append(entry)
    return lst


def decode(lst):
    q = ""
    for character, count in lst:
        q += character * count
    return q




@settings(verbosity=Verbosity.verbose)
@given(text())

def test_decode_inverts_encode(s):
    assert decode(encode(s)) == s


def my_sum(a, b): 

      return a + b 



def roots1(a, b, c): 

   
      r1 = ( -b  + sqrt(b**2 -4 * a *c ) )/ (2*a) 
      r2 = ( -b  - sqrt(b**2 -4 * a *c ) )/ (2*a)
   

def roots2(a, b, c): 

    if a==0 : 
        if b == 0: return None, None  
        else: return -c/b, None   

    else: 
      r1 = ( -b  + sqrt(b**2 -4 * a *c ) )/ (2*a) 
      r2 = ( -b  - sqrt(b**2 -4 * a *c ) )/ (2*a)

      return r1, r2 


def roots3(a, b, c): 

    if a==0: 
      if b==0: 
          r1, r2 = None, None 
      else: 
          r1, r2 = -c/b, None 
    else:
      if b==0 and c==0:
         r1, r2 = 0, 0 
      elif b ==0: 

        r1, r2 =  sqrt( -c/a ), -sqrt( -c/a )

      else: 
        r1 = -sign(b) * 2 * c / ( abs(b) + sqrt(b**2 -4 * a *c ) )
        r2 = c / ( a * r1 )   
        #print("roots=", r1, r2)
       

    return r1, r2 

#@settings(verbosity=Verbosity.verbose)
@given(integers(), integers())

def test_sum(a,b):
    assert my_sum(a, b) == a + b 


#@settings(verbosity=Verbosity.verbose)
@given( arrays(int8, 3), arrays(int8, 3) )
def test_sumV(a,b):
    assert all( my_sum(a, b) == (a + b) )



#@settings(verbosity=Verbosity.verbose)
@given( arrays(int8, (3,3) ), arrays(int8, (3,3) ) )
def test_sumM(a,b):
    assert all( my_sum(a, b) == (a + b) )


#@settings(verbosity=Verbosity.verbose)
xmin = -1000
xmax = 1000
coef =  floats(xmin, xmax)

@given( coef, coef, coef )
def test_roots3(a, b, c):

    epsilon = 1e-10
    r1, r2 = roots3(a, b, c) 
   
    print("r1 =", r1)
    print("r2 =", r2)

    if r1 != None and not(isnan(abs(r1))): 
      if r2 != None and not(isnan(abs(r2))):
          
        e1 = epsilon * abs(r1) 
        e2 = epsilon * abs(r2) 
        f1 = abs( a*r1**2 + b*r1 +  c ) 
        f2 = abs( a*r2**2 + b*r2 +  c )
        print("f1 =", f1)
        print("f2 =", f2)

        assert f1 <= e1 and f2 <= e2

      else:
        f1 = abs( a*r1**2 + b*r1 +  c ) 
        assert f1 <= epsilon 

    else : 
      assert True

@given( coef, coef, coef )   
def test_roots2(a, b, c):

    epsilon = 1e-12
    r1, r2 = roots2(a, b, c) 

    if r1 != None and not(isnan(abs(r1))): 

      f1 = abs( a*r1**2 + b*r1 +  c ) 
      #if f1>epsilon: 
      #      print("r1=", r1, "r2=", r2)
      #      print("f1=", f1)
      assert f1 <= epsilon 
   
    else : 
      #print("a=", a, "b=", b, "c =", c)
      #print("r1=", r1, "r2=", r2)
      #print("NaN or isnan")
      assert True
   




if __name__ == "__main__":

    #test_decode_inverts_encode()
   
    #test_sumV()

    #test_sumM()

    #test_sum()  
    # 
    print("Robust Roots protected from round-off")
    test_roots3()
    print("test OK\n")
 

    print("Roots not protected from round-off")
    test_roots2()
    #exit()
 
   #print (" roots", abs(roots(1., 2., 3.)) )

