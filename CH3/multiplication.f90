! subroutine of matrix inner product with fortran90
!the function which get two matrices and the number of rows and columns and 
!gives the multiplication matric
subroutine multiplication(a, b, c, nrow, ncol)
  implicit none
  integer nrow, ncol, i, j
  double precision a(nrow, ncol), b(nrow, ncol), c(nrow, ncol)
  !Fortran function of multilication
  c = matmul(a, b)
end subroutine multiplication
