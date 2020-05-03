## INSPECTING VARIABLES AND WORKPLACE

## Classes

class(c(TRUE,FALSE))   ## logical class

## Different types of numbers
class(sqrt(1:10))      ## numeric class
class(3 + 1i)          ## complex number
class(1L)              ## integer
class(1:5)             ## integer

## OTHER CLASSES
class(c("she", "sells", "seashells", "on", "the", "sea", "shore"))  ## character 

## Factor
gender <- factor(c("male", "female", "female", "male", "female"));gender ## factor is used to categorize a vector with categorical elements
nlevels(gender) ## returns the number of types of genders
levels(gender) ## returns the two types of genders
as.integer(gender) ## returns the genders' values as numbers

gender_char <- sample(c("female", "male"), 10000, replace = TRUE) ## randomly created vector of 1000 elements
gender_fac <- as.factor(gender_char) ## as.factor can be used to convert a vector to a factor
object.size(gender_char) ## returns the object size of the vector
object.size(gender_fac) ## returns the object size of the factor
## factorization takes up less space compared to vectorization

as.character(gender)

## Raw class which is for storing vectors of "raw" bytes
as.raw(1:17) 
as.raw(c(pi, 1 + 1i, -1, 256))
(sushi <- charToRaw("Fish!"))
class(sushi)


## checking classes with is.*
is.character("red lorry, yellow lorry")
is.logical(FALSE)
is.list(list(a = 1, b = 2))
ls(pattern = "^is", baseenv()) ## a complete list of the is.* functions
is.numeric(1L)
is.integer(1)
is.integer(1L)
is.double(42.069)

## converting to other classes with as.*
x <- '123.456'
as(x, 'numeric') ## one type
as.numeric(x) ## another type
y <- c(2, 12, 343, 34997) 
as.data.frame(y) ## converting a vector to a data frame
x <- 22
as.character(x)

ulams_spiral <- c(1, 8, 23, 46, 77)  #See http://oeis.org/A033951 
for(i in ulams_spiral) i             #uh-oh, the values aren't printed 
for(i in ulams_spiral) print(i)      ## converting a horizontal vector to a vertical vector

num <- runif(30)  
summary(num) ## to summarize a the properties of a vector, factor or a dataset

letters ## used for lowercase letters
LETTERS ## USED FOR UPPERCASE LETTERS
fac <- factor(sample(letters[1:5], 30, replace = TRUE)) 
summary(fac) 

bool <- sample(c(TRUE, FALSE, NA), 30, replace = TRUE) 
summary(bool)

dfr <- data.frame(num, fac, bool) ## creating a dataframe with three columns
head(dfr) 
summary(dfr)

str(num) ## str is used to describe the structure of the variable
str(dfr)

unclass(fac) ## unclassing  a factor
attributes(fac)
## View is used to view the dataframe, edit is used to store changes in a new variable
## fix(dfr) used to make changes in dataframes
View(dfr)               #no changes allowed 
new_dfr <- edit(dfr)    #changes stored in new_dfr 
fix(dfr)                #changes stored in dfr

View(head(dfr, 10)) ## another way to use view

ls() ## this is used to list all the variable that have been created
ls(pattern = "en") ## looking for specific variables

rm(x, y) ## used to remove certain variables
## rm(list = ls()) removes all  the varibales
ls()
ls.str() ## lists the structures of all variables

as.character(4.588)

## Inf, NA, NaN, 
class(Inf)
t <- c(Inf,NA, NaN, '')
class(t)
class('Na')
c('dog', 'cat', 'donkey','goldfish')
animals <- sample(LETTERS[1:9], 1000, replace = TRUE)
str(animals)
View(head(animals, 10))
summary(animals)

vegetables <- "book"
vegetables_r <- "pot"
ls(, pattern = "a")

animal <- sample(c("dog", "cat", "donkey","goldfish"), 200, replace = TRUE)
animal_fac <- as.factor(animal)
summary(animal_fac)
