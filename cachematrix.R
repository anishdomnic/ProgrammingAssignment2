## makeCacheMatrix
## function to create a 'special' matrix object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()){
m <- NULL
set <- function(y){
x <<- y
m <<- NULL
}
get <- function() x
setinverse <- function(solve) m <<-solve
getinverse <- function() m

list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## cacheSolve
## function to calculate the inverse of the matrix returned by the previous function 'makeCacheMatrix'

cacheSolve <- function(x,...){
m <- x$getinverse() ## to return the inverse of matrix
if(!is.null(m)){
message("Cached Data")
return(m)
}
data <-x$get()
m <-solve(data,...)
x$setinverse(m)
m
}

