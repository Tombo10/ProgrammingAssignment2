## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

### Matrix inversion is usually a costly computation 
### and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly. 
### The assignment is to write a pair of functions that cache the inverse of a matrix.

### This function creates a special "matrix" object that can cache its inverse.
makeCachematrix= function(x=matrix()){
          i=NULL
### 1. set the value of the matrix
          set= function(y) {
            x<<-y
            i<<-NULL
          }
### 2. get the value of the matrix
          get= function() x
### 3. set the value of the inverse of the matrix
          setinverse= function() i<<- solve(x)
### 4. get the value of the inverse of the matrix          
          getinverse= function() i
### 5. return the list
          list(set=set,
               get= get,
               setinverse=setinverse, 
               getinverse=getinverse)
          }

### This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
### If the inverse has already been calculated (and the matrix has not changed), 
### then the cachesolve should retrieve the inverse from the cache.

cacheSolve= function(x, ...) {
## Return the matrix that is the inverse of the matrix
### 1. get inverse of the matrix
    i_matrix= x$getinverse()
### 2. if inverse of the matrix exists, check if already cached
### if yes, return cached inverse
    if(!is.null(i_matrix)){
    message("getting cached data")
    return(i_matrix)
    }
### 3. if not, get the matrix 
    data= x$get()
### 4. compute inverse of the matrix
    i_matrix=solve(data)
### 5. cache inverse of the matrix
    x$setinverse(i_matrix)
### 6. return inverse of the matrix
    i_matrix}
