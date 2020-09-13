## Put comments here that give an overall description of what your
## functions do

## the next function create the cache for a given matrix, defining the functions
#set, get, setinverse, and getinverse, important to specify that here there is nothing solved.

makeCacheMatrix <- function(x = matrix()) {
        i<-NULL#inverse
        
        set<-function(y){
                x<<-y
                i<<- NULL
        }
        
        get <-function() x
        setinverse <- function(solve) i <<-solve
        getinverse <- function() i
        
        list(set = set, get= get,
             setinverse=setinverse, 
             getinverse=getinverse)
}


## In this function we take the cache create in the above function, it begins calling
#the i variable created in the cache if its empty asign to data the value of the matrix
#through the function get, then solve the matirx with the function "solve" and assigns the result
#to the variable i, then send the inverse matrix to the cache using the fucntion setinverse, and finally
#print the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i<-x$getinverse()
        if(!is.null(i)){
                message("getting ceche data")
                return(i)
        }
        data<- x$get()
        i<- solve(data, ...)
        x$setinverse(i)
        i
}


j<-matrix(1:4,2,2)
j
cacheSolve(makeCacheMatrix(j))
