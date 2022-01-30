from advanced_programming_techniques import menu_advanced_programming_techniques 
from Foundations import menu_Foundations


def main(): 

  option = 1     
  while option>0:  
    
     print( "\n") 
     print( "Welcome to Advanced Programming" )
     print( "for Numerical Calculations" )
     print( " select an option " )
     print( " 0. exit/quit  " )
     print( " 1. Foundations" )
     print( " 2. Advanced programming techniques " ) 
     option = int (input("\n Select an option = ") )  
     print("\n")
     
     if option==1: 
           menu_Foundations()
          
     elif option == 2: 
           menu_advanced_programming_techniques()
  
     elif option> 0: 
           print( " option not implemented" )



if __name__ == "__main__":

    main()
