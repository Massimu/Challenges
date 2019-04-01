#**********************************************************************
#
# Project           : Calling a fortran function which multiplys two matrices 
#                     and check whether the inputs are valid.
#
# Program name      : multiplication.r
#
# Author            : Meysam Esmaeilpour
#
# Date created      : 2019-04-01
#
# Purpose           : Multiply two 3x3 matrices 
#
#**********************************************************************;
#readnumeric function :
#to get user input and check if it is a numeric or not.
#-----------------------------------------------------------------------
readnumeric <- function()
{ 
  #get a character:
  n <- readline(prompt=cat("[",i,",",j,"]: "))
  #Checj if it is not a special character such as ! @ # $ ^ ?
  if (grepl("^0[0-9]+$",n)){
    print("INVALID INPUT, PLEASE TRY A NUMBER")
    n <- readnumeric()
  }
  #Check if it is not a alphabet
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
  #Testing the zero matrix as input 
  if(all(x[k,,]==0)) print("You entered a ZERO matrix, please try a non-zero: ")
  if(!all(x[k,,]==0)){
      break
    }
  }
}
#Loading the shared file of the function
dyn.load("multiplication.so")
#Loading the function
is.loaded("multiplication")
#Calling the multiplication fucntion from fortran file
out <- .Fortran("multiplication", as.double(x[1,,]), as.double(x[2,,]),as.double(x[3,,]),as.integer(nrow(x[1,,])), as.integer(ncol(x[1,,])))[[3]]
Z = array(c(out[1:3],out[4:6],out[7:9]),dim=c(3,3))
cat("The Result is:\n")
print(Z)
