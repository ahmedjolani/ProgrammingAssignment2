## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    getInverse <- function() {
        inverse
    }
    setInverse <- function(m) {
        inverse <<- m
    }
    getMatrix <- function() {
        x
    }
    setMatrix <- function(m) {
        x <<- m
        inverse <<- NULL
    }
    
    list(getInverse = getInverse, setInverse = setInverse,
         getMatrix = getMatrix, setMatrix = setMatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverse <- x$getInverse()
    if (!is.null(inverse)) {
        message("getting cahced inverse of <x>")
        return(inverse)
    }
    
    message("calculating inverse of <x>...")
    x$setInverse(solve(x$getMatrix(), ...))
    
    return(x$getInverse())
}
