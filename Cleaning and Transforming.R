## CLEANING AND TRANSFORMING

## CLEANING STRINGS
data(english_monarchs, package = "learningr") 
head(english_monarchs)

##install.packages('stringr')
library(stringr) 
multiple_kingdoms <- str_detect(english_monarchs$domain, fixed(",")) ## str_detect is used to detect a string or a portion of a string in column
english_monarchs[multiple_kingdoms, c("name", "domain")] 

multiple_rulers <- str_detect(english_monarchs$name, ",|and") 
english_monarchs$name[multiple_rulers & !is.na(multiple_rulers)]

individual_rulers <- str_split(english_monarchs$name, ", | and ") ## str_split is used to split a column with the aid of a selected string
head(individual_rulers[sapply(individual_rulers, length) > 1])

th <- c("th", "ð", "þ")
sapply(         #can also use laply from plyr  
  th,  
  function(th)  
  {    
    sum(str_count(english_monarchs$name, th)) ## used to count the number of times a string appears
  } 
)  

english_monarchs$new_name <- str_replace_all(english_monarchs$name, "[ðþ]", "th")

gender <- c("MALE", "Male", "male", "M", "FEMALE",  "Female", "female", "f", NA ) 
clean_gender <- str_replace(gender,ignore.case("^m(ale)?$"),  "Male" ) 
(clean_gender <- str_replace(clean_gender,ignore.case("^f(emale)?$"),  "Female" )) 

## MANIPULATING DATA FRAMES

### ADDING OR REPLACING COLUMNS 
english_monarchs$length.of.reign.years <-  english_monarchs$end.of.reign - english_monarchs$start.of.reign
english_monarchs$length.of.reign.years <- with(english_monarchs,end.of.reign - start.of.reign ) ## the with function makes calling datasets easier
english_monarchs <- within(english_monarchs,{length.of.reign.years <- end.of.reign - start.of.reign}) ## the within function works the same way but returns the entire dataset
english_monarchs <- within(
  english_monarchs,  
  {
    length.of.reign.years <- end.of.reign - start.of.reign    
    reign.was.more.than.30.years <- length.of.reign.years > 30  
  }
)

## with is used for manipulating one column and within is used for manipulating multiple columns

library(plyr)
english_monarchs <- mutate(  
  english_monarchs,  
  length.of.reign.years = end.of.reign - start.of.reign,  
  reign.was.more.than.30.years = length.of.reign.years > 30 
) 

## DEALING WITH MISSING VALUES
data("deer_endocranial_volume", package = "learningr") 
has_all_measurements <- complete.cases(deer_endocranial_volume) ## complete.cases tells us which rows are free of missing values
deer_endocranial_volume[has_all_measurements, ]

na.omit(deer_endocranial_volume) ## na.omit is a simpler version 

na.fail(deer_endocranial_volume) ## returns an error if there is a missing value

## CONVERTING BETWEEN WIDE AND LONG FORM

deer_wide <- deer_endocranial_volume[, 1:5]
##install.packages("reshape2")
library(reshape2) 
deer_long <- melt(deer_wide, id.vars = "SkullID") ## converting wide_datset to long_dataset and using id.vars to lock on a specific ID 
head(deer_long)
melt(deer_wide, measure.vars = c("VolCT", "VolBead", "VolLWH", "VolFinarelli")) ## converting wide dataset to long dataset and using measure.vars to select specific columns that will be transformed

deer_wide_again <- dcast(deer_long, SkullID ~ variable) ## dcast is used to convert from long to wide again

## USING SQL
##install.packages("sqldf") 
library(sqldf)
subset(deer_endocranial_volume,  VolCT > 400 | VolCT2 > 400,  c(VolCT, VolCT2) ) 
query <-  "SELECT      VolCT,      VolCT2    FROM      deer_endocranial_volume    WHERE      VolCT > 400 OR      VolCT2 > 400" 
sqldf(query)

## SORTING
x <- c(2, 32, 4, 16, 8) 
sort(x) 
sort(x, decreasing = TRUE)
sort(c("I", "shot", "the", "city", "sheriff"))
?Comparison
order(x) 
x[order(x)] 
identical(sort(x), x[order(x)]) 
year_order <- order(english_monarchs$start.of.reign) 
english_monarchs[year_order, ] 
arrange(english_monarchs, start.of.reign)
(x <- sample(3, 7, replace = TRUE)) 
rank(x)
rank(x, ties.method = "first") 

## FUNCTIONAL PROGRAMMING
ct2 <- deer_endocranial_volume$VolCT2  #for convenience of typing 
isnt.na <- Negate(is.na) 
identical(isnt.na(ct2), !is.na(ct2)) 
Filter(isnt.na, ct2) ## for filtering the rows that do not contain missing values
Position(isnt.na, ct2) ## returns the first index
Find(isnt.na, ct2) ## returns the fist value

get_volume <- function(ct, bead, lwh, finarelli, ct2, bead2, lwh2) 
{  #If there is a second measurement, take the average  
  if(!is.na(ct2))  
  {    
    ct <- (ct + ct2) / 2    
    bead <- (bead + bead2) / 2    
    lwh <- (lwh + lwh2) / 2  
  }  
  #Divide lwh by 4 to bring it in line with other measurements  
  c(ct = ct, bead = bead, lwh.4 = lwh / 4, finarelli = finarelli) 
} 
## map works like mapply. It gets a function and applies it to all the columns
measurements_by_deer <- with(deer_endocranial_volume, Map(get_volume, VolCT, VolBead, VolLWH, VolFinarelli, VolCT2, VolBead2, VolLWH2)) 
head(measurements_by_deer) 

## REDUCE
pmax2 <- function(x, y) ifelse(x >= y, x, y) 
Reduce(pmax2, measurements_by_deer)

## ASSIGNMENT

## 1
data(hafu, package = "learningr")
head(hafu)
hafu$FathersNationalityIsUncertain <- str_detect(hafu$Father, fixed("?"))
hafu$MothersNationalityIsUncertain <- str_detect(hafu$Mother, fixed("?"))
hafu$Father <- str_replace(hafu$Father, fixed("?"), "")
hafu$Mother <- str_replace(hafu$Mother, fixed("?"), "")

## 2
df_hafu <- hafu[,c(3,5,6)]
melt(df_hafu, id.vars = "Character")

## 3
top10 <- function(x)
{
  counts <- table(x, useNA = "always")
  head(sort(counts, decreasing = TRUE), 10)
}
top10(hafu$Mother)
