Description of challenge 2:

There are two main file in the package:
1-multiplication.f90 : fortran subroutine which multiplys two 3X3 matrices
2-multiplication.r   : R file which call fortran function and check the input to provide the result

#--------------------------------------------------------------------------------------------------
How it works:

Step 1: provide "so" and "o" file from fortran code to make it callabe in R

in terminal go the files path and:

gfortran -c multiplication.90

then

gfortran -shared -o multiplication.so multiplication.o

Step 2: run the R code in R terminal:

in terminal go the files path and:

-setwd("path of files")
-system("ls")

here we have:
multiplication.r multiplication.f90 multiplication.so multiplication.o

-source("multiplication.r") 

and just enter the inputs to et result.

 
