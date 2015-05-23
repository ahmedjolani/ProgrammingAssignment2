## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    # holds the inverse of matrix |x|
    inverse <- NULL
    
    # gets the inverse of matrix |x|
    getInverse <- function() {
        inverse
    }
    # sets the inverse of matrix |x|
    setInverse <- function(m) {
        inverse <<- m
    }
    # gets the original matrix |x|
    getMatrix <- function() {
        x
    }
    # sets a new original matrix |x|
    setMatrix <- function(m) {
        x <<- m
        inverse <<- NULL # reset the inverse
    }
    
    # retrun the special matrix object
    list(getInverse = getInverse, setInverse = setInverse,
         getMatrix = getMatrix, setMatrix = setMatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    # get the previously calculated inverse
    inverse <- x$getInverse()
    # check if the inverse is set/cached
    if (!is.null(inverse)) {
        message("getting cahced inverse of <x>")
        return(inverse)
    }
    
    message("calculating inverse of <x>...")
    # calculate the inverse using solve and set/cache it
    x$setInverse(solve(x$getMatrix(), ...))
    
    # get and return the inverse matrix
    return(x$getInverse())
}
