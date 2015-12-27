## I just copied the code from the examples makeVector

## makeCacheMatrix retrieves the cache data and make it into a matrix vector.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(z) {m <<- z}
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)    
}


## The cacheSolve function help to calculate the inverse of cache data.
cacheSolve <- function(x, ...) {
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data,...)
        ## ?solve()  "if missing, b is taken to be an identity matrix
        ## and solve will return the inverse of a
       
        x$setInverse(m)
        m
        ## Return a matrix that is the inverse of 'x'
}
