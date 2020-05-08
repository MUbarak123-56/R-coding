## FILE CONTROL AND LOOPS


## IF STATEMENTS
if(TRUE) message("It was true!") 
if(FALSE) message("It wasn't true!")
if(NA) message("Who knows if it was true?") ## Error: missing value where TRUE/FALSE needed. missing values are not allowed to be passed

if(is.na(NA)) message("The value is missing!") ## A proper way to test for a missing value

if(runif(1) > 0.5) message("This message appears with a 50% chance.")
x <- 3 
if(x > 2) 
{  
  y <- 2 * x  
  z <- 3 * y 
}

## IF-ELSE STATEMENTS

if(FALSE) {message("This won't execute...") } else {message("but this will.") } 
if(FALSE) 
{  
  message("This won't execute...") 
} 
else
{  
  message("and you'll get an error before you reach this.") 
} 


## IF-ELSEIF-ELSE STATEMENT
(r <- round(rnorm(2), 1))
(x <- r[1] / r[2])

if(is.nan(x)) 
{  
  message("x is missing") 
} else if(is.infinite(x)) 
{  
  message("x is infinite") 
} else if(x > 0) 
{  
  message("x is positive") 
} else if(x < 0) 
{  
  message("x is negative") 
} else 
{  
  message("x is zero") 
}

x <- sqrt(-1 + 0i) 
(reality <- if(Re(x) == 0) "real" else "imaginary") 

## VECTORIZED IF

if(c(TRUE, FALSE)) message("two choices") 
ifelse(rbinom(10, 1, 0.5), "Head", "Tail") 

(yn <- rep.int(c(TRUE, FALSE), 6))
ifelse(yn, 1:3, -1:-12) 

yn[c(3, 6, 9, 12)] <- NA
ifelse(yn, 1:3, -1:-12)

## MULTIPLE SELECTION

(greek <- switch(    ## used to make the first argument a string, then look for something that matches
  "gamma",  
  alpha = 1,  
  beta  = sqrt(4),  
  gamma =  {
    a <- sin(pi/3)    
    4 * a ^ 2  
    } 
)) 

(greek <- switch( ## if no names match, switch will return NULL
  "delta",  
  alpha = 1,  
  beta  = sqrt(4),  
  gamma =  {
    a <- sin(pi/3)    
    4 * a ^ 2  
  } 
)) 

(greek <- switch(
  "delta",  
  alpha = 1,  
  beta  = sqrt(4),  
  gamma =  {
    a <- sin(pi/3)    
    4 * a ^ 2  
  },
  4    ## This is used when nothing matches
)) 

switch(3,  "first",  "second",  "third",  "fourth" )
switch(as.character(2147483647),  "2147483647" = "a big number",  "another number" )

## LOOPS

## repeat loop
## repeat {message("Happy Groundhog Day!")} ## runs forever

repeat ## repeat loop with a break function
{  
  message("Happy Groundhog Day!")  
  action <- sample(   
    c(      
      "Learn French",      
      "Make an ice statue",      
      "Rob a bank",      
      "Win heart of Andie McDowell"    
    ),    
    1  
  )  
  if(action == "Rob a bank")  
  {    
    message("Quietly skipping to the next iteration")    
    next  
  } 
  message("action = ", action)  
  if(action == "Win heart of Andie McDowell") break 
}


## WHILE LOOPS

action <- sample(   
  c(      
    "Learn French",      
    "Make an ice statue",      
    "Rob a bank",      
    "Win heart of Andie McDowell"    
  ),
  1
)

while(action != "Win heart of Andie McDowell") 
{  
  message("Happy Groundhog Day!") 
  action <- sample(   
    c(      
      "Learn French",      
      "Make an ice statue",      
      "Rob a bank",      
      "Win heart of Andie McDowell"    
    ),
    1
  )
  message("action = ", action) 
} 

for(i in 1:5) message("i = ", i)
for(i in 1:5) 
{  
  j <- i ^ 2  
  message("j = ", j) 
} 

for(month in month.name) 
{  
  message("The month of ", month) 
} 

for(yn in c(TRUE, FALSE, NA)) 
{  
  message("This statement is ", yn) 
} 

l <- list(  
  pi,  
  LETTERS[1:5],  
  charToRaw("not as complicated as it looks"),  
  list(TRUE) 
) 
for(i in l) 
{  
  print(i) 
} 

## ASSIGNMENT
repeat ## repeat loop with a break function
{  
  message("Begin")  
    
  message("game status = ", game_status) 
  if(game_status == 'WINS') 
  {
    print('TRUE')
  } else if (game_status == 'Scores a 7')
  {    
    print('FALSE')
  } 
  break 
}

game_status <- sample(   
  c(      
    "WINS",      
    "Scores a 7",      
    "NA"      
  ),    
  1  
)
while(game_status != "WINS" | game_status != 'Scores a 7') 
{  
  message("Begin!") 
  game_status <- sample(   
    c(      
      "WINS",      
      "Scores a 7",      
      "NA"      
    ),    
    1  
  )
  message("Game status = ", game_status) 
} 