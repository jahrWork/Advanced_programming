import os


def compile_example():
    
# os.system('f2py -c ./sources/wrappers/fortran_module.f90  --fcompiler=gfortran --compiler=mingw32     -m fortran_module')
 #os.system('f2py -c ./sources/wrappers/fortran_module.f90  --fcompiler=intelvem   -L/"Program Files (x86)"/IntelSWTools/compilers_and_libraries_2020.2.254/windows/compiler/lib/intel64_win    -m fortran_module')

 #os.system('Python "C:/Dropbox/this week/Miguel Rapado/Advanced programming/Python_project/sources/compilers/"setup.py py2exe')
 #os.system('Python ./Python_project/sources/compilers/setup.py py2exe')  
 os.system('pyinstaller -F ./sources/"python to C"/HelloWorld.py')  




if __name__ == '__main__':  
   compile_example()
