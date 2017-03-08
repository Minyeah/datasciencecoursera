## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix is a function which creates a special "matrix" object that can 
## cache its inverse for the input (which is an invertible square matrix).

##I am not sure what the argument (x=matrix()) does in the function statement.

makeCacheMatrix <- function(x = matrix()) {
  
  cache <- NULL     ##holds the cached value, or takes value NULL if there is no cached value. Initalize as NULL.
  
 initMatrix <- function(newvalue) { #store a matrix
   
   x <<- newvalue  
   
   cache <<- NULL  ##since the matrix is assigned a new value, flush the cache. 
                   ##this will ensure the inverse of the new matrix will be cached.
 } 
  
  getMatrix <- function() { ##returns the stored matrix
    
    x
    
  }
  
  cacheInverse <- function(solve) {
    
    cache <<- solve ##cache the given argument
    
  }
  
  getInverse <- function() {
    
    cache ##retrieve the cahced value
    
  }
  
    ##return the list of functions
  list(initMatrix = initMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)

}


## the following function calculates the inverse of the special matrix created with makeCacheMatrix

cacheSolve <- function(x, ...) {
  
  ##get the cached value
  inverse <- x$getInverse()
  
  ##if a cached value already exists, return it
  if (!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  
  #otherwise, get the matrix, calculate the inverse, and cache the value
  data <- x$getMatrix()
  inverse <- solve(data)
  x$cacheInverse(inverse)
  
  ##return the inverse
  inverse
  
}
