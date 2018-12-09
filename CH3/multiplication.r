#**********************************************************************
#
# Project           : Calling a fortran function which multiplys two matrices 
#                     and check whether the inputs are valid.
#
# Program name      : multiplication.r
#
# Author            : Meysam Esmaeilpour
#
# Date created      : 2018-12-06
#
# Purpose           : Multiply two 3x3 matrices 
#
#**********************************************************************;


#readnumeric function :
#to get user input and check if it is a numeric or not.
#-----------------------------------------------------------------------
readnumeric <- function()
{ 
  n <- readline(prompt=cat("[",i,",",j,"]: "))
  if (grepl("^0[0-9]+$",n)){
    print("INVALID INPUT, PLEASE TRY A NUMBER")
    n <- readnumeric()
  }
  n <- suppressWarnings(as.numeric(n))
  if (is.na(n)){
    print("INVALID INPUT, PLEASE TRY A NUMBER")
    n <- readnumeric()
  }
  return(n)
}
#------------------------------------------------------------------------
#main part of program:

#Defining empty matrices as 3D zero matrix
x = array(0, dim=c(3,3,3))

#filling matrices
for (k in 1:2)  
  {
  repeat{
        cat("Matrix number",k,"\n")
        for(i in 1:3)
        {
          for(j in 1:3)
          {
            x[k,i,j] = readnumeric()
       
          }
        }
  if(all(x[k,,]==0)) print("You entered a ZERO matrix, please try a non-zero: ")
  if(!all(x[k,,]==0)){
      break
    }
  }
}

dyn.load("multiplication.so")
is.loaded("multiplication")
#load multi from fortran
out <- .Fortran("multiplication", as.double(x[1,,]), as.double(x[2,,]),as.double(x[3,,]),as.integer(nrow(x[1,,])), as.integer(ncol(x[1,,])))[[3]]
Z = array(c(out[1:3],out[4:6],out[7:9]),dim=c(3,3))
cat("The Result is:\n")
print(Z)
