import os
from numpy import array 

def f2py_example():
    
 os.system('f2py -c ./sources/Fortran_to_Python/fortran.f90  --fcompiler=gfortran --compiler=mingw32     -m fortran')
  #os.system('f2py -c ./sources/"Fortran to Python"/fortran_module.f90  --fcompiler=gfortran --compiler=mingw32     -m ./sources/"Fortran to Python"/fortran_module ')
#os.system('f2py -c ./sources/wrappers/fortran_module.f90  --fcompiler=intelvem   -L/"Program Files (x86)"/IntelSWTools/compilers_and_libraries_2020.2.254/windows/compiler/lib/intel64_win    -m fortran_module')

 #os.system('f2py -c ./sources/"Fortran to Python"/fortran_module.f90  --fcompiler=ifort   -L/"Program Files (x86)"/Intel/OneAPI/compiler/2021.1.1/windows/compiler/lib/intel64_win    -m fortran_module')


if __name__ == '__main__':  
     f2py_example()

