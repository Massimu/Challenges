# Description:

The solution includes two files:  
1-multiplication.f90 : fortran subroutine which multiplys two 3X3 matrices.  
2-multiplication.r   : R file which call fortran function and check the input to provide the result.  
One can see the description of codes in detail within the code lines.
### How it works:

#### Step 1:
provide "so" and "o" file from fortran code to make it callabe in R.  
in terminal go the files path and:  
```
gfortran -c multiplication.f90
```
then:
```
gfortran -shared -o multiplication.so multiplication.o
```
#### Step 2:
Go the files path in terminal:  
```
R
setwd("path of files")
system("ls")
```
here one should have:
```
multiplication.r multiplication.f90 multiplication.so multiplication.o
```
Then to run:
```
source("multiplication.r") 
```
and just enter the inputs to et result.