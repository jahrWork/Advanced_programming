from advanced_programming import menu_advanced_programming 
from Foundations import menu_Foundations


def main(): 

   
  while True: 
    
     print( "\n Welcome to Advanced Programming" )
     print( "for Numerical Calculations (Python project)" )
     print( " select an option " )
     print( " 0. exit/quit  " )
     print( " 1. Foundations" )
     print( " 2. Advanced programming techniques " ) 
     option = int (input("\n Select an option = ") )  
     print("\n")

     if option==0:
          break

     elif option==1: 
           menu_Foundations()
          
     elif option == 2: 
           menu_advanced_programming()
  
     else : 
           print( " option not implemented" )



if __name__ == "__main__":

    main()
