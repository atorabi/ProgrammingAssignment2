
# makeCacheMatrix is a function that returns a list of functions
# Its purpose is to store a martix and a cached value of the inverse of the 
# matrix. Contains the following functions:

# * setMatrix      set the value of a matrix
# * getMatrix      get the value of a matrix
# * cacheInverse   get the cahced value (inverse of the matrix)
# * getInverse     get the cahced value (inverse of the matrix)

#

# Notes:

# not sure how the "x = numeric()" part works in the argument list of the 
# function, but it seems to be creating a variable "x" that is not reachable 
# from the global environment, but is available in the environment of the 
# makeCacheMatrix function

makeCacheMatrix <- function(x = matrix()) {
 # holds the cached value or NULL if nothing is cached
        # initially nothing is cached so set it to NULL
        cache <- NULL
        # store a matrix
        setMatrix <- function(newValue) {
                x <<- newValue
                # since the matrix is assigned a new value, flush the cache
                cache <<- NULL
        }

        # returns the stored matrix
        getMatrix <- function() {
                x
        }

        # cache the given argument 
        cacheInverse <- function(solve) {
                cache <<- solve
        }



        # get the cached value

        getInverse <- function() {

                cache

        }


        # return a list. Each named element of the list is a function

        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)

}
# The following function calculates the inverse of a "special" matrix created with 
# makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
# get the cached value

        inverse <- y$getInverse()

        # if a cached value exists return it

        if(!is.null(inverse)) {

                message("getting cached data")

                return(inverse)

        }

        # otherwise get the matrix, caclulate the inverse and store it in

        # the cache

        data <- y$getMatrix()

        inverse <- solve(data)

        y$cacheInverse(inverse)
       
        # return the inverse

        inverse

}
#
# Below is the results of code run and check taht it works
#
#> source("cachematrix.R")
#> a <- matrix(c(1,0,5,2,1,6,3,4,0), nrow=3, ncol=3)
#> anotherMatrix <- makeCacheMatrix(a)
#> invMatrix <- cacheSolve(anotherMatrix)
#> cacheSolve(anotherMatrix)
#getting cached data
#     [,1] [,2] [,3]
#[1,]  -24   18    5
#[2,]   20  -15   -4
#[3,]   -5    4    1
#> round(a %*% invMatrix,1)
#     [,1] [,2] [,3]
#[1,]    1    0    0
#[2,]    0    1    0
#[3,]    0    0    1
