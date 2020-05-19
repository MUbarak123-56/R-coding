## ADVANCED LOOPING

### REPLICATE

rep(runif(1), 5) 
replicate(5, runif(1)) ## replicate is used to create a random set of values

time_for_commute <- function() 
{ 
  #Choose a mode of transport for the day  
  mode_of_transport <- sample(    
    c("car", "bus", "train", "bike"),    
    size = 1,    
    prob = c(0.1, 0.2, 0.3, 0.4)  
  ) 
  time <- switch(    
    mode_of_transport,    
    car   = rlnorm(1, log(30), 0.5),    
    bus   = rlnorm(1, log(40), 0.5),    
    train = rnorm(1, 30, 10),    
    bike  = rnorm(1, 60, 5)  
    )  
names(time) <- mode_of_transport  
time 
}
replicate(5, time_for_commute())

## LOOPING OVER LISTS

prime_factors <- list(two   = 2,  three = 3,  four  = c(2, 2),  five  = 5,  six   = c(2, 3),  seven = 7,  eight = c(2, 2, 2),  nine  = c(3, 3),  ten   = c(2, 5)) 
head(prime_factors) 

unique_primes <- vector("list", length(prime_factors)) 
for(i in seq_along(prime_factors)) 
{  
  unique_primes[[i]] <- unique(prime_factors[[i]]) 
} 
names(unique_primes) <- names(prime_factors) 
unique_primes 

lapply(prime_factors,unique) ## lapply used for lists
vapply(prime_factors, length, numeric(1)) ## vapply used for vectors
## sapply used for lists,vectors and arrays
sapply(prime_factors, unique)  #returns a list 
sapply(prime_factors, length)  #returns a vector
sapply(prime_factors, summary) #returns an array

sapply(list(), length) 
vapply(list(), length, numeric(1)) 

complemented <- c(2, 3, 6, 18)        #See http://oeis.org/A000614 
lapply(complemented, rep.int, times = 4)

rep4x <- function(x) rep.int(4, times = x) 
lapply(complemented, rep4x) 
lapply(complemented, function(x) rep.int(4, times = x))

env <- new.env() 
env$molien <- c(1, 0, 1, 0, 1, 1, 2, 1, 3) #See http://oeis.org/A008584 
env$larry <- c("Really", "leery", "rarely", "Larry")
eapply(env, length) 
lapply(env, length) ## same

library(matlab)
(magic4 <- magic(4))
rowSums(magic4) 
## The dimension number is 1 for “apply the function across each row,” or 2 for “apply the function down each column” 
apply(magic4, 1, sum) 
apply(magic4, 1, toString) 
apply(magic4, 2, toString) 
(baldwins <- data.frame(  
  name = c("Alec", "Daniel", "Billy", "Stephen"),  
  date_of_birth = c(    "1958-Apr-03", "1960-Oct-05", "1963-Feb-21", "1966-May-12"  ), 
  n_spouses = c(2, 3, 1, 1),  
  n_children = c(1, 5, 3, 2),  
  stringsAsFactors = FALSE 
)) 
apply(baldwins, 1, toString)
apply(baldwins, 2, toString) 
sapply(baldwins, toString) 
sapply(baldwins, range)

## MULTIPLE INPUT APPLY
msg <- function(name, factors) 
{  
  ifelse(    
    length(factors) == 1,    
    paste(name, "is prime"),    
    paste(name, "has factors", toString(factors))  
    ) 
} 
mapply(msg, names(prime_factors), prime_factors)

## INSTANT VECTORIZATION
baby_gender_report <- function(gender) 
{  
  switch(    
    gender,    
    male   = "It's a boy!",    
    female = "It's a girl!",    
    "Um..."  
  ) 
}
genders <- c("male", "female", "other") 
baby_gender_report(genders) 
vectorized_baby_gender_report <- Vectorize(baby_gender_report)
vectorized_baby_gender_report(genders)

## SPLIT-APPLY-COMBINE
(frogger_scores <- data.frame(  
  player = rep(c("Tom", "Dick", "Harry"), times = c(2, 5, 3)),  
  score  = round(rlnorm(10, 8), -1)
))

(scores_by_player <- with(  
  frogger_scores,  
  split(score, player) 
))

(list_of_means_by_player <- lapply(scores_by_player, mean)) 

(mean_by_player <- unlist(list_of_means_by_player))

with(frogger_scores, tapply(score, player, mean)) ## tapply is a very great way to use split-combine-apply

library(plyr) 
llply(prime_factors, unique) ## returns a list
laply(prime_factors, length) ## returns an array
laply(list(), length) 
raply(5, runif(1))  #array output raply represents replicate
rlply(5, runif(1))  #list output 
rdply(5, runif(1))  #data frame output
r_ply(5, runif(1))  #discarded output 


frogger_scores$level <- floor(log(frogger_scores$score)) 
ddply(  
  frogger_scores,  
  .(player),  
  colwise(mean) #call mean on every column except player 
) 

frogger_scores$level <- floor(log(frogger_scores$score)) 
ddply(  
  frogger_scores,  
  .(player),  
  summarize,  
  mean_score = mean(score), #call mean on score  
  max_level  = max(level)   #... and max on level 
) 


## ASSIGNMENTS
## 1
wayans <- list (  
  "Dwayne Kim" = list(),  
  "Keenen Ivory" = list("Jolie Ivory Imani","Nala","Keenen Ivory Jr", "Bella","Daphne Ivory"), 
  Damon = list("Damon Jr","Michael","Cara Mia","Kyla"),
  Kim = list(),  
  Shawn = list("Laila","Illia","Marlon"),  
  Marlon = list("Shawn Howell","Arnai Zachary"),  
  Nadia = list(),  
  Elvira = list("Damien","Chaunté"),  
  Diedre = list("Craig","Gregg","Summer", "Justin","Jamel"),  
  Vonnie = list() 
)
vapply(wayans,length, numeric(1))

## 2
state.x77
head(state.x77)
str(state.x77)
summary(state.x77)
apply(state.x77,2,mean)
apply(state.x77,2,sd)

## 3
commute_times <- replicate(1000, time_for_commute()) 
commute_data <- data.frame(  
  time = commute_times,  
  mode = names(commute_times) 
)
ddply(  
  commute_data,  
  .(mode),  
  summarize,  
  Q3 = quantile(time,0.75)
) 
