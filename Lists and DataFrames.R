## LISTS AND DATAFRAMES

(a_list <- list(c(1, 1, 2, 5, 14, 42), month.abb, matrix(c(3, -8, 1, -3), nrow = 2),  asin )) ## lists can contain matrices, vectors, functions and regular elements
names(a_list) <- c("catalan", "months", "involutary", "arcsin"); a_list ## lists can also be given names

(the_same_list <- list(catalan = c(1, 1, 2, 5, 14, 42), months = month.abb,involutary = matrix(c(3, -8, 1, -3), nrow = 2),  arcsin = asin )) ## another method for naming lists

(main_list <- list(middle_list = list(element_in_middle_list = diag(3), inner_list = list(element_in_inner_list = pi ^ 1:4, another_element_in_inner_list = "a")), element_in_main_list = log10(1:10) )) 
## inner lists can also be created within lists called nested lists

## ATOMIC AND RECURSIVE VARIABLES

## variables that can have variables within them are called recursive like lists having lists within them
is.atomic(list())  
is.recursive(list())  
is.atomic(numeric())
is.recursive(numeric()) 


## LIST DIMENSIONS AND ARITHMETIC

length(a_list)
length(main_list)

dim(a_list) ## lists do not have dimensions

nrow(a_list) ## doesn't work
ncol(a_list) ## doesn't work
NROW(a_list) ## works because a list can be considered a vector
NCOL(a_list) ## works because a list can be considered a vector

## INDEXING LISTS
l <- list(first = 1,second = 2,third  =list(alpha = 3.1,beta  = 3.2))
l[1:2]
l[-3]
l[c("first", "second")] 
l[c(TRUE, TRUE, FALSE)] 
l[[1]] ## how to call an element in a list
l[['first']] ## how to call an element in a list
l['first']
is.list(l[1]) ## returns TRUE because the input is a list 
is.list(l[[1]]) ## returns FALSE becaus the input is not a list

l$first ## calling elements of lists
l$f

l[["third"]]["beta"] 
l[["third"]][["beta"]]
l[[c("third", "beta")]]

## ACCESSING A NON-EXISTENT ELEMENT
l[c(4, 2, 5)] 
l[c("fourth", "second", "fifth")]
l[["fourth"]]
l$fourth

l[[4]] #this throws an error 

## CONVERTING BETWEEN VECTORS AND LISTS
busy_beaver <- c(1, 6, 21, 107)  #See http://oeis.org/A060843 
as.list(busy_beaver) 
as.numeric(list(1,6,21,107))

## It doesn't work with nonscalar elements
(prime_factors <- list(two = 2,three = 3,four = c(2, 2),five  = 5,six = c(2, 3),seven = 7,eight = c(2, 2, 2),nine = c(3, 3),ten = c(2, 5) ))

unlist(prime_factors) ## Unlisting a list


## COMBINING LISTS
c(list(a = 1, b = 2), list(3))
(matrix_list_hybrid <- cbind(list(a = 1, b = 2),list(c = 3, list(d = 4)))) ## cbind and rbind can be used for combining lists as well
str(matrix_list_hybrid) 

## DEALING WITH NULL VALUES
## Creating a list with NULL values
(uk_bank_holidays_2013 <- list(Jan = "New Year's Day",Feb = NULL,Mar = "Good Friday",Apr = "Easter Monday",May = c("Early May Bank Holiday", "Spring Bank Holiday"),Jun = NULL,Jul = NULL,Aug = "Summer Bank Holiday",Sep = NULL,Oct = NULL,Nov = NULL,Dec = c("Christmas Day", "Boxing Day") )) 

length(NULL)
length(NA) ## NA is a scalar value while NULL is a missing value
is.null(NULL)
is.null(NA)

## Setting elements to NULL is used to remove elements from a list
uk_bank_holidays_2013$Jan <- NULL 
uk_bank_holidays_2013$Feb <- NULL
uk_bank_holidays_2013

## Assigning certain elements to NULL values
uk_bank_holidays_2013["Aug"] <- list(NULL) 
uk_bank_holidays_2013

## DATAFRAMES
(a_data_frame <- data.frame(x = letters[1:5],y = rnorm(5),z = runif(5) > 0.5 )) 
LETTERS[1:4]
class(a_data_frame)
y <- rnorm(5)
names(y) <- month.name[1:5] ## creating names for y
data.frame(x = letters[1:5],y = y,z = runif(5) > 0.5) ## names for y are used as row names
data.frame(x = letters[1:5],y = y,z = runif(5) > 0.5, row.names = c("Jackie", "Tito", "Jermaine", "Marlon", "Michael")) ## manually inputing row names

## CERTAIN FUNCTIONS CAN BE PASSED TO KNOW THE CHARACTERISTICS OF A DATA FRAME
rownames(a_data_frame) 
colnames(a_data_frame)
dimnames(a_data_frame)
nrow(a_data_frame) 
ncol(a_data_frame)
dim(a_data_frame)
length(a_data_frame) 
names(a_data_frame) 

## When a data frame of different vector lengths are passed, the shorter ones are recycled as long as the longest vectorlength
## is the multiple of the shorter vector length
data.frame(x = 1,y = 2:3,z = 4:7) 

## check.names is used to prevent the verification of valid names
data.frame("A column"   = letters[1:5],"!@#$%^&*()" = rnorm(5),"..." = runif(5) > 0.5,check.names  = FALSE ) 

## Indexing data frames
a_data_frame[2:3, -3]
a_data_frame[c(FALSE, TRUE, TRUE, FALSE, FALSE), c("x", "y")]
class(a_data_frame[2:3, -3])
class(a_data_frame[2:3, 1])
a_data_frame$x[2:3] 
a_data_frame[[1]][2:3]
a_data_frame[["x"]][2:3] 

a_data_frame[a_data_frame$y > 0 | a_data_frame$z, "x"] 
subset(a_data_frame, y > 0 | z, x)

## BASIC DATA FRAME MANIPULATION
t(a_data_frame)

another_data_frame <- data.frame(z = rlnorm(5),y = sample(5),x = letters[3:7] )
rbind(a_data_frame, another_data_frame)
cbind(a_data_frame, another_data_frame) 

## Merge function can be used to merge two data frames
merge(a_data_frame, another_data_frame, by = "x") ## this merges only similar rows
merge(a_data_frame, another_data_frame, by = "x", all = TRUE) ## this merges all rows which leads to NA values

## mathematical calculations of data frames
colSums(a_data_frame[, 2:3])
colMeans(a_data_frame[, 2:3]) 

## ASSIGNMENTS
length(list(alpha = 1, list(beta = 2, gamma = 3, delta = 4), eta = NULL))

square_list <- list(c(1,4,9),c(16),c(25),c(36),c(49),c(64),c(81));square_list

iris
df_iris <- iris[,1:4]
df_iris
colMeans(df_iris)
beaver1
beaver1['id'] <- 1
beaver1
beaver2['id'] <- 2
beaver2
y <- rbind(beaver1, beaver2)
y
subset(y, activ > 0)
