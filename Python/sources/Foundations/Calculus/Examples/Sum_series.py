
    
from Series import Sigma
from math import pi, factorial, exp
import sys 

# Python always works in double precision 
epsilon = sys.float_info.epsilon 

 
    
#*****************************************************************************
#* Summation of 1/n**2
#*****************************************************************************
def Summation_n2_examples(): 
   
   
   S, Ne = Summation_n2()
   E =  pi**2/6 - S
   print( "Summation 1/n**2 " )
   print( " S = ", S,  " N =", Ne, "Error = ", E)
   
   N = 200000000
   S = SummationN_n2( N ) 
   E = pi**2/6 - S
   print( " S = ", S,  " N =", N, "Error = ", E)
   print( "\n")
   print( "Truncation error S = ", 1./Ne)
   print( "Round--off error   = ", E - 1./Ne)
   
     
#*****************************************************************************
#* Summation of three numerical series
#*****************************************************************************
def Summation_examples():

   S2, N2 = Summation_2n()
   S3, N3 = Summation_factorialn()
   
   E2 =  1/3. - S2
   E3 =  ( exp(1.) - 1 ) - S3  
   
   print("\n") 
   print( "S2 =", S2, " N=", N2, " Err=", E2) 
   print( "S3 =", S3, " N=", N3, " Err=", E3)  
   print("\n") 
  
    
   

#*****************************************************************************
#* Summation of three numerical series
#*****************************************************************************
def Summation_functional_examples():  

 
   eps = epsilon 

   S1 = Sigma(a1, 1, eps)
   S2 = Sigma(a2, 1, eps)
   S3 = Sigma(a3, 1, eps)
   
   E1 = S1 - pi**2/6 
   E2 = S2 - 1/3.
   E3 = S3 - ( exp(1.) - 1 )   
   
   print( "Functional programming" ) 
   print( "Summation from n=1 to n= infinity ")
   print( "an= 1/n**2,               Sn= ", S1)
   print( "an= (-1.)**(n+1) / 2**n,  Sn= ", S2)
   print( "an= 1/factorial(n),       Sn= ", S3)
   print( "\n")
   print( "Total error of S1    = ", E1)
   print( "Total error of S2    = ", E2)
   print( "Total error of S3    = ", E3)  
 

#*****************************************************
#* Sn = sum from {n=1} to N 1/ n**2 
#*****************************************************
def SummationN_n2( N ):
    
  S = 0
  for i in range(1, N+1):  # from i=1 to i=N
      S  = S +  1. / float(i)**2
   
  return S 

#*****************************************************
#* Sn = sum from {n=1} to {infinity} 1/ n**2 
#*****************************************************
def Summation_n2(): # functions don’t modify arguments
                    # use return 

  n = 0 
  Sn = 1 
  S = 0 
  
  while  S != Sn : 
     
      n = n + 1 
      an =  1. / float(n)**2 
      Sn = S 
      S = S + an 

  n = n - 1
  return S, n  

#************************************************************
#* Sn = sum from {n=1} to {infinity} (-1.)**(n+1) / 2**n  
#************************************************************
def Summation_2n():
   
  n = 0 
  Sn = 1 
  S = 0 
  while S != Sn  : 
      
      n = n + 1
      an =  (-1.)**(n+1) / 2.**n 
      Sn = S 
      S = S + an 

  n = n - 1 

  return S, n  
 
#********************************************************
#* Sn = sum from {n=1} to {infinity} 1/ factorial(n) 
#*********************************************************
def Summation_factorialn():

  n = 0 
  Sn = 1 
  S = 0 
  an = 1 
  while S != Sn :
      
      n = n + 1 
      an =  an / n 
      Sn = S 
      S = S + an 
      
  n = n - 1 

  return S, n  


def a1(n):  
     return  1 / float(n)**2

def a2(n):  
     return  (-1)**(n+1) / 2.**n 

def a3(n):  
     return  1 / factorial( n ) 
    



