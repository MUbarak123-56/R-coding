## DISTRIBUTION AND MODELLING

## RANDOM NUMBERS

## THE SAMPLE FUNCTION

sample(7) ## returns natural numbers ranging from 1 to n
sample(7,5) ## returns 5 random numbers ranging from 1 to n
sample(7, 10, replace = TRUE) ## sampling with replacements
sample(colors(), 5) #a great way to pick the color scheme for your house 
sample(.leap.seconds, 4) ## another way to use sample
weights <- c(1, 1, 2, 3, 5, 8, 13, 21, 8, 3, 1, 1) 
sample(month.abb, 1, prob = weights) 

## SAMPLING WITH DISTRIBUTIONS

??Distribution
runif(5)         #5 uniform random numbers between 0 and 1 
runif(5, 1,10)   #5 uniform random numbers between 1 and 10 
rnorm(5)         #5 normal random numbers with mean 0 and std dev 1 
rnorm(5, 3, 7)   #5 normal random numbers with mean 3 and std dev 7
RNGkind()

## Using set.seed(n), there will be an "n" number of possibilities
set.seed(1);runif(5) 
set.seed(1);runif(5) 

## DISTRIBUTIONS

data(gonorrhoea, package = "learningr")
model1 <- lm(Rate ~ Year + Age.Group + Ethnicity + Gender, gonorrhoea) ## creating a linear regression model
model1
lapply(Filter(is.factor, gonorrhoea), levels) 
summary(model1)

model2 <- update(model1, ~ . - Year) ## updating a linear regression model
summary(model2)

anova(model1, model2) ## anova is used to compare both models. The model did not improve after the year variable was removed.
 ## Akaike and Bayesian information criteria
AIC(model1, model2) 
BIC(model1, model2)

silly_model <- update(model1, ~ . - Age.Group) 
anova(model1, silly_model) ## removing the age group variable had a serious effect on the strength of the model.

model3 <- update(model2, ~ . - Gender) ## removing the gender variable
summary(model3) 

g2 <- within(  
  gonorrhoea,  
{    
  Age.Group <- relevel(Age.Group, "30 to 34")    
  Ethnicity <- relevel(Ethnicity, "Non-Hispanic Whites")  
} 
)
model4 <- update(model3, data = g2)
summary(model4) 

## PLOTTING AND INSPECTING MODELS
plot_numbers <- 1:6 
layout(matrix(plot_numbers, ncol = 2, byrow = TRUE)) 
plot(model4, plot_numbers)
gonorrhoea[c(40, 41, 160), ] ## These are outliers

str(model4) 
unclass(model4) 

## functions for checking out a model
formula(model4) 
nobs(model4) 
head(residuals(model4)) 
head(fitted(model4)) 
head(coefficients(model4))

head(cooks.distance(model4))
summary(model4)$r.squared 
diagnostics <- data.frame(residuals = residuals(model4),  fitted = fitted(model4)) 
ggplot(diagnostics, aes(fitted, residuals)) +  geom_point() +  geom_smooth(method = "loess")
new_data <- data.frame(Age.Group = "30 to 34",  Ethnicity = "Non-Hispanic Whites")
predict(model4, new_data)
subset(gonorrhoea,  Age.Group == "30 to 34" & Ethnicity == "Non-Hispanic Whites" ) 
