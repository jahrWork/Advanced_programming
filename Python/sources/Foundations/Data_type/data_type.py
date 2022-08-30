def data_types(): 

  integer = 1 
  real = 1.8 
  complex = 1 + 1j
  bool = True
  string = "data types"


def data_structures():

  sets = "unordered set with distinct elements" 
  S = {"car", 5, 6.7, 1 + 1j} 
  
  # print order is unpredictable 
  print("\n type=", type(S)) 
  for s in S: 
     print(" element =", s)
     

  lists = "ordered set allowing equal elements" 
  S = ["one", 5, 3.5, 5] 
  
  # lists are ordered  
  S[3] = 8
  print("\n type=", type(S))   
  for i in range(len(S)): 
     print(" element =", S[i]) 
   
     
  tuples ="inmutable ordered set" 
  S = ("one", 5, 3.5, 5)  
  
  # tuples are inmutable 
  print("\n type=", type(S))
  for i in range(len(S)): 
     print(" element =", S[i])   
  print("\n")   
  
  dictionaries = "ordered data values in key:value pairs"
  # mutable and do not allow duplicates"
  arrays = {"set":sets, "list":lists, "tuple":tuples, "dictionary":dictionaries} 
  
  for e in arrays:  
     print("{:12} {} {}".format(e, ":", arrays[e]) )
  print("\n")