## Mathematical Operations
## Basic operations
x <- 2 ^ 3 ## exponential
x
y <- 2 + 3 ## addition
y
z <- 3 - 2 ## subtraction
z
a <- 3 * 2 ## multiplication
a
b <- 3/2 ## division
b

## Other mathematical operations
1:5 + 6:10  #addtion of vectors using :
c(1, 3, 6, 10, 15) + c(0, 1, 3, 6, 10) ## addition of elements of vectors
sum(1:5) ## sum
median(1:5) ## median
c(2, 3, 5, 7, 11, 13) - 2 #subtraction all elements in a vector by a number
-2:2 * -2:2  ## multiplication of vectors
identical(2 ^ 3, 2 ** 3) ## comparing the results of two operations to see if they are equal
1:10/3 ## Dividing a vector by a specific number
1:10 %/% 3 ## integer division
1:10 %% 3 ## remainder devision
cos(c(0, pi / 4, pi / 2, pi)) #pi is a built-in constant
exp(pi * 1i) + 1 #Euler's formula
factorial(7) + factorial(1) - 71 ^ 2 #5041 is a great number 
factorial(5)
choose(5, 0:5)  ## Binomial calculation where choose(n, 0:k)
choose(3,0:3)
choose(7, 0:3)

## Comparing integers using signs like ==, !=, >, <
c(3, 4 - 1, 1 + 1 + 1) == 3     
1:3 != 3:1
exp(1:5) < 100
(1:5) ^ 2 >= 16
all.equal(sqrt(2)^2,2) ## all equal is used in order to prevent rounding error
all.equal(sqrt(2) ^ 2, 3) ## It returns the mean difference if it is not true
isTRUE(all.equal(sqrt(2) ^ 2, 3)) ## isTrue is used to return true or false
## all.equal is a better function to use than ==

## Comparing strings
c("Can", "you", "can", "a", "can", "as",  "a", "canner", "can", "can", "a", "can?" ) == "can" 
c("A", "B", "C", "D") < "C" 
c("a", "b", "c", "d") < "C" #doing the same for lower case letters, your results may vary

## Assigning Variables
x <- 1:5
y <- 6:10
z <- x + 2*y -3
z
assign("my_local_variable", 9 ^ 3 + 10 ^ 3)  ## another way for assigning variables
my_local_variable
z <- rnorm(5); z ## assigning a value and printing it

## Special numbers
c(Inf + 1, Inf - 1, Inf - Inf)  ## special numbers 
x <- c(0, Inf, -Inf, NaN, NA)
is.finite(x) ## checking for a finite numbers
is.infinite(x) ## checking for infinite numbers
is.nan(x) ## checking for non-numbers
is.na(x) ## checking for missing numbers

## Logical Operators
(x <- 1:10 >= 5) 
(y <- 1:10 %% 2 == 0)
x & y
x | y

## Outputs of a truth table
x <- c(TRUE, FALSE, NA)         #the three logical values 
xy <- expand.grid(x = x, y = x) #get all combinations of x and y 
within(                       #make the next assignments within xy  
  xy,  
  {  
    and <- x & y    
    or  <- x | y    
    not.y <- !y    
    not.x <- !x 
    } 
  ) 
## Two other logical operators are any and all

any(c(FALSE,TRUE)) ## used to check if some of the elements are true
all(c(TRUE,TRUE)) ## used to check if all of the elements are true

x <- 5
x == pi
assign("B", 4)
B
?Trig
atan(1/1:1000) ## inverse of arc tangent of numbers from 1 to 1000
x <- 1:1000;x ## inverse of numbers from 1 to 1000
y <- atan(1/x);y ## arc tangent of x
z <- 1/tan(y);z ## inverse of tangent of y

x == z
identical(x,z)
all.equal(x,z,tolerance = 0)

true_and_missing <- c(TRUE,NA,TRUE,NA)
false_and_missing <- c(FALSE,NA,FALSE,NA)
mixed <- c(TRUE,FALSE,NA,TRUE,FALSE,NA)

any(true_and_missing)
all(true_and_missing)
any(false_and_missing)
all(false_and_missing)
any(mixed)
all(mixed)
