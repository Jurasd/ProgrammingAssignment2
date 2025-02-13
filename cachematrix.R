## makeCacheMatrix consists of set,get, setinv and getinv
##library MAss is used to calculate inverse for non squared as well as squared matrices
library(MASS)
makeCacheMatrix <- function(x = matrix()) {
  inv<-NULL             #initializing inverse as NULL
  set<-function(y){
      x<<-y
      inv<<-NULL
  }
  get<-function()x           #function to get matrix x
  setinv<-function(inverse)inv<<-inverse
  getinv<-function(){
      inver<-ginv(x)
      inver%*%x              #function to obtain inverse of the matrix
  }
  list(set = set, get = get,
        setinv = setinv,
        getinv = getinv)
}

## This is used to get cache data

cacheSolve <- function(x, ...) { ##gets cache data
  inv<-x$getinv()
  if(!is.null(inv)){               #check whether inverse is NULL
      message("getting cashed data!")
      return(inv)                  #return inverse value
  }
  data<-x$get()
  inv<-solve(data,...)             #calculate inverse value
  x$setinv(inv)
  inv
        ## Return a matrix that is the inverse of 'x'
}
