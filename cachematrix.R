## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## The inverse matrix is cached in m
## This function creates a new, separate environment
makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function
## This function returns the inverse of the matrix - m
cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting inversed m")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
