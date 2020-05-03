## ENVIRONMENTS AND FUNCTIONS

an_environment <- new.env() ## from creating new environments

## multiple ways for assigning variables via environments
an_environment[["pythag"]] <- c(12, 15, 20, 21) #See http://oeis.org/A156683 
an_environment$root <- polyroot(c(6, -5, 1))
assign("moonday",weekdays(as.Date("1969/07/20")),an_environment ) 

## retrievable variables
an_environment[['pythag']]
an_environment$root
get("moonday", an_environment)

## ls and ls.str are used to list contents of an environment
ls(envir = an_environment)
ls.str(envir = an_environment)

## exists is used to check for the existence of an environment
exists("pythag", an_environment)

## Converting environments to lists
a_list <- as.list(an_environment); a_list

as.environment(a_list)
list2env(a_list)

nested_environment <- new.env(parent = an_environment) 
exists("pythag", nested_environment) 
exists("pythag", nested_environment, inherits = FALSE) 

non_stormers <<- c(3, 7, 8, 13, 17, 18, 21) #See http://oeis.org/A002312 
get("non_stormers", envir = globalenv()) 
head(ls(envir = baseenv()), 20) 

## FUNCTIONS
rt

## Creating a function
hypotenuse <- function(x, y) {  sqrt(x ^ 2 + y ^ 2) }
hypotenuse(3,4)
hypotenuse(y=5,x=12)

## Another way of creating a function with predisposed parameters
hypotenuse <- function(x = 5, y = 12) {  sqrt(x ^ 2 + y ^ 2) } 
hypotenuse() 

## Methods for retrieving arguments of a hypotenuse
formals(hypotenuse) 
args(hypotenuse)
formalArgs(hypotenuse)

(body_of_hypotenuse <- body(hypotenuse)) ## { ##     sqrt(x^2 + y^2) ## } assigning the body of a function
deparse(body_of_hypotenuse) ## used to retrieve the body of a function

normalize <- function(x, m = mean(x), s = sd(x)) {  (x - m) / s } 
normalized <- normalize(c(1, 3, 6, 10, 15)) 
mean(normalized)        
sd(normalized)

normalize(c(1, 3, 6, 10, NA))

normalize <- function(x, m = mean(x, na.rm = na.rm),  s = sd(x, na.rm = na.rm), na.rm = FALSE) {  (x - m) / s } 
normalize(c(1, 3, 6, 10, NA)) 
normalize(c(1, 3, 6, 10, NA), na.rm = TRUE) 

normalize <- function(x, m = mean(x, ...), s = sd(x, ...), ...) {  (x - m) / s }
normalize(c(1, 3, 6, 10, NA)) 
normalize(c(1, 3, 6, 10, NA), na.rm = TRUE)


## Passing functions to and from other functions. An example is do.call
do.call(hypotenuse, list(x = 3, y = 4))

dfr1 <- data.frame(x = 1:5, y = rt(5, 1)) 
dfr2 <- data.frame(x = 6:10, y = rf(5, 1, 1)) 
dfr3 <- data.frame(x = 11:15, y = rbeta(5, 1, 1)) 
do.call(rbind, list(dfr1, dfr2, dfr3)) #same as rbind(dfr1, dfr2, dfr3) 

## Pre-disposed functions
menage <- c(1, 0, 0, 1, 2, 13, 80) #See http://oeis.org/A000179 
mean(menage) 
mean(c(1, 0, 0, 1, 2, 13, 80))

x_plus_y <- function(x, y) x + y 
do.call(x_plus_y, list(1:5, 5:1))
do.call(function(x, y) x + y, list(1:5, 5:1))
(emp_cum_dist_fn <- ecdf(rnorm(50))) 
is.function(emp_cum_dist_fn) 
plot(emp_cum_dist_fn)

f <- function(x) 
{ 
    y <- 1  
    g <- function(x)  
    {   
      (x + y) / 2
    }
    g(x)  
}  
f(sqrt(5))  

h <- function(x) {  x * y }
y <- 16
h(9)

h2 <- function(x) 
{
  if(runif(1) > 0.5) y <- 12  
  x * y
} 
replicate(10, h2(9)) 

## ASSIGNMENTS

multiples_of_pt <-new.env()
multiples_of_pt[['two_pt']] <- "2*n"
multiples_of_pt$three_pt <- "3*n"
assign("four_pt", "4*n", multiples_of_pt)

ls(multiples_of_pt)
ls.str(multiples_of_pt)


veck <- function(x) 
{
  y <- x%%2
  print(y)
  if (as.integer(y) == 0) print(TRUE)
  if (as.integer(y) != 0) print(FALSE)
  if (x == Inf) print(NA)
}
veck(10)

right <- function(stuff) 
{
  print(formalArgs(stuff))
  print(body(stuff))
}
right(hypotenuse)
