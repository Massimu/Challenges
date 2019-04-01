! subroutine of matrix inner product with fortran90
!Arguments are matrices, row, and column 
subroutine multiplication(a, b, c, nrow, ncol)
  implicit none
  integer nrow, ncol, i, j
  double precision a(nrow, ncol), b(nrow, ncol), c(nrow, ncol)
  !Fortran function for multiplying two matrices
  c = matmul(a, b)
end subroutine multiplication
