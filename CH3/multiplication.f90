! subroutine of matrix inner product with fortran90
subroutine multiplication(a, b, c, nrow, ncol)
  implicit none
  integer nrow, ncol, i, j
  double precision a(nrow, ncol), b(nrow, ncol), c(nrow, ncol)
  c = matmul(a, b)
end subroutine multiplication
