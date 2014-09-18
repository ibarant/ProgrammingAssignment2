## I just modified the original code by changing the called function

## makeCacheMatrix inverses a given matrix and saves in cache memory

## makeCacheMatrix function does the following:
    ## sets the values of the matrix
    ## gets the values of the matrix
    ## sets the values of the inversed matrix
    ## gets the values of the inversed matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
    x <<- y
    m <<- NULL
    }
  get <- function() x
  
  setsolve <- function(solve) m <<- solve(x)
  getsolve <- function() m
    
    list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## cacheSolve invertses matrix created with makeCacheMatrix function and 
## It firstly checks to see if the inversing has already been done. 
## If so, it gets the result from the cache and skips the computation. 
## Otherwise, it inverses a given matrix and sets the values of the matrix in the cache via the setsolve function.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
          m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached inversed matrix")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
