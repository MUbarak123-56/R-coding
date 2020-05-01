## VECTORS, MATRICES AND ARRAYS
## Vectors
8.5:4.5                #sequence of numbers from 8.5 down to 4.5 
c(1, 1:3, c(5, 8), 13) #values concatenated into single vector 

## creating vectors based on data types
vector("numeric", 5) ## creating a vector of 5 numeric values
vector("complex", 5) ## creating a vector of 5 compplex values 
vector("logical", 5) ## creating a vector of 5 logical values
vector("character", 5) ## creating a vector of 5 characters
vector("list", 5) 


## an alternative method for creating vectors similar to the ones above
numeric(5)
character(5)
logical(5)
complex(5)

## Creating Sequences
seq.int(3, 12)     #same as 3:12

seq.int(3, 12, 2) ## with an added parameter, you can specify how far apart the values are
seq.int(0.1, 0.01, -0.01)

seq_len(5)  ## used to create a sequence of numbers from 1 up until input number

pp <- c("Peter", "Piper", "picked", "a", "peck", "of", "pickled", "peppers") 
for(i in seq_along(pp)) print(pp[i])  ## seq_along creates a sequence from 1 up to the length of its input


## LENGTHS
length(1:5)
length(c(TRUE,FALSE,NA))
V <- c(3,'a','d', 'e')
length(V)
nchar(V) ## returns the number of characters of each element in the vector

poincare <- c(1, 0, 0, 0, 2, 0, 2, 0)  #See http://oeis.org/A051629 
length(poincare) <- 3 ## assigning a new length to a vector
poincare 

length(poincare) <- 8
poincare ## the new 5 values are NA i.e missing values
## when assigning a new length, if it is smaller, it truncates it. if it is bigger, it creates NA values.


## NAMING ELEMENTS IN A VECTOR
bread <- c(apple = 1, banana = 2, "kiwi fruit" = 3, 4)
bread

x <- 1:4
names(x) <- c("apple", "bananas", "kiwi fruit", "")
x

names(x)
names(poincare) ## returns NULL because none of the elements have a name

## INDEXING VECTORS

x <- (1:5) ^ 2;x
x[c(1,3,5)] ## returns values at those positions
x[c(-2,-4)] ## returns values that are not at those positions
x[4]

x[c(TRUE, FALSE, TRUE, TRUE, TRUE)] ## returns only TRUE values at those positions 

names(x) <- c("one", "four", "nine", "sixteen", "twenty five")
x[c("one", "nine", "twenty five")]

x[c(1, -1)]      #This throws an error because of the mixture of positive and negative indices

## when NA is used as an index it returns NA which is a missing value
x[c(1, NA, 5)]
x[c(TRUE, FALSE, NA, FALSE, TRUE)]

x[c(-2, NA)] ## NA doesn't work for negative notation

x[7] ## when a value is called outside the designated range, it reports an NA value

x[4.5] ## non-integer indexes are rounded down

x[] ## not passing any index returns the whole vector

which(x > 10) ## can be used to return specific elements in a vector based on the passed argument

which.min(x) ## returns the smallest value
which.max(x) ## returns the largest value

## Vector recycling and repetition
1:5 * 10 ## applying an operation to a vector with a single value has an effect on all the elements

1:5 + 1:15 ## When applying an operation on two vectors together, R will recycle elements in the shorter vector to match the longer one. 
## This works if the length longer vector is a multiple of length of the shorter vector

## The rep function is used for creating a vector with repeated fucntions
rep(1:5,3) ## used to repeat the vector n times
rep(1:5, each = 3) ## used to repeat each element of the vector n times before moving on to the next
rep(1:5, times = 1:5) ## used to repeat each element of the vector by its corresponding times value
rep(1:5, length.out = 7) ## used to print out each element repeatedly until the nth value

rep.int(1:5, 3) ## a faster approach to using rep(1:5, n)
rep_len(1:5, 13) ## a faster approach to using rep(1:5, length.out = n)


## MATRICES AND ARRAYS
## Creating a 3d array by passing a dimension arguments and a vector of values with dimension names
three_d_array <- array(1:24,dim = c(4, 3, 2),dimnames = list(c("one", "two", "three", "four"),c("ein", "zwei", "drei"), c("un", "deux"))) 
three_d_array
class(three_d_array)

## Creating a matrix with a vector of 1:12 and nrow, ncol and dimnames as arguments

a_matrix <- matrix(1:12,nrow = 4, ncol = 3, dimnames = list(c("one", "two", "three", "four"),c("ein", "zwei", "drei")) )
a_matrix                       
class(a_matrix)

## Creating a 2d array
two_d_array <- array(1:12,dim = c(4, 3),dimnames = list(c("one", "two", "three", "four"),c("ein", "zwei", "drei"))) 
two_d_array
identical(two_d_array,a_matrix)
class(two_d_array)
## A matrix is a two dimensional array
## Creating a matrix with a vector of 1:12 and nrow,byrow is used instead of ncol and dimnames as arguments
matrix(1:12,nrow = 4,byrow = TRUE,  dimnames = list(c("one", "two", "three", "four"),c("ein", "zwei", "drei")))

## dim can be used to check the dimensions of an array or matrix
dim(three_d_array)
dim(a_matrix)

## nrow and ncol can be used to check the number of rows and columns in a matrix or array
nrow(a_matrix)
ncol(a_matrix)
nrow(three_d_array)
ncol(three_d_array)

## length can also be used to find the length of a matrix or an array
length(a_matrix)
length(three_d_array)

## dim can be used to reshape a matrix
## dim(a_matrix) <- c(6, 2) 
## a_matrix 

identical(nrow(a_matrix), NROW(a_matrix)) 
identical(ncol(a_matrix), NCOL(a_matrix)) 
## Unlike nrow and ncol, NROW and NCOL can be used on vectors by assuming they are single matrices\

## rows, columns and dimensions names can be gotten with the following commands
rownames(a_matrix)
colnames(a_matrix)
dimnames(a_matrix)

rownames(three_d_array)
colnames(three_d_array)
dimnames(three_d_array)

## Indexing Arrays

a_matrix[1, c("zwei", "drei")]
a_matrix[1, ]
a_matrix[1,3]
a_matrix[3,2]
a_matrix[1,1:3]
a_matrix[, c("zwei", "drei")]
a_matrix[,1:3]
a_matrix[c('one'),]

another_matrix <- matrix(seq.int(2, 24, 2),nrow = 4,dimnames = list(c("five", "six", "seven", "eight"),c("vier", "funf", "sechs")))
another_matrix
c(a_matrix,another_matrix)
cbind(a_matrix, another_matrix) ## combining matrices by columns with equal number of rows
rbind(a_matrix, another_matrix) ## combining matrices by rows with equal number of columns

## Array arithmetic -- this works well with matrices of equal rows and columns
a_matrix + another_matrix
a_matrix * another_matrix
a_matrix - another_matrix
a_matrix / another_matrix

## Array transpose
t(a_matrix)
a_matrix %*% t(a_matrix)  #inner multiplication 
1:3 %o% 4:6               #outer multiplication 
outer(1:3, 4:6)           #same

(m <- matrix(c(1, 0, 1, 5, -3, 1, 2, 4, 7), nrow = 3)) 
m^-1
(inverse_of_m <- solve(m)) ## the inverse of a matrix
m %*% inverse_of_m

## ASSIGNMENTS

v <- c(0,0.25,0.5,0.75,1)
names(v) <- c("zero","one","two", "three", "four")
v
v1 <- c("zero" = 0,"one"=1,"two"=2)
v1

## numeric, character, complex and logical
v[1]
v1[c("zero","one")]
v[-2]
v[c(1,3,5)]
v[c(-2,-3)]

mp <- 1:20
mp
for(i in seq_along(mp))
mp[i] <- mp[i]*(mp[i]+1)/2

names(mp) <- letters[1:20]
mp
mp[c('a','e','i','o')]

x1 <- seq.int(10,0,-1)
x2 <- seq.int(1,10,1)
x3 <- diag(c(x1,x2))
x4 <- diag(1,nrow = 20, ncol = 21)
x5 <- rep.int(0,21)
x5
x6 <- rbind(x5,x4)
x6
x7 <- rbind(x4,x5)
x7
x8 <- x6+x7
x8
x9 <- x8 + x3
x9[21,21] <- 11
x9
eigen(x9)
