## EXPLORING AND VISUALIZING

## SUMMARY STATISTICS

data(obama_vs_mccain, package = "learningr") 
obama <- obama_vs_mccain$Obama 
mean(obama) ## calculating the mean 
median(obama) ## calculating the median
table(cut(obama, seq.int(0, 100, 10))) ## used to infer the mode
var(obama) ## variance
sd(obama) ## standard deviation
mad(obama) ## mean absolute deviation

min(obama) 
with(obama_vs_mccain, pmin(Obama, McCain)) ## returns the minimum value for each data point
with(obama_vs_mccain, pmax(obama, McCain)) ## returns the maximum value for each data point
range(obama) ## returns the maximum and minimum values of the range of the dataset

cummin(obama) ## cummin provides the minimum value so far in a vector
cummax(obama) ## cummax provides the maximum value so far in a vector
cumsum(obama) ## cumsum cummulatively adds up all the values
cumprod(obama) ## cumprod cummulatively multiplies all the values

quantile(obama) ## quantile provides the values at the median, lower and upper quartiles
quantile(obama, type = 5)    #to reproduce SAS results 
quantile(obama, c(0.9, 0.95, 0.99)) ## to provide quantiles at certain percentiles
quantile(obama, 0.75)
quantile(obama, c(0.6,0.8))
IQR(obama) ## used to calculate the interquartile range
fivenum(obama) ## provides Q1,Q2,Q3 and the lowest and higest values
summary(obama_vs_mccain)

with(obama_vs_mccain, cor(Obama, McCain)) ## correlation coefficient between obama and mccain
with(obama_vs_mccain, cancor(Obama, McCain)) ## cancor provides extra details
with(obama_vs_mccain, cov(Obama, McCain)) ## covariance

## THE THREE PLOTTING SYSTEMS

## SCATTER PLOTS

## TAKE 1: BASE GRAPHICS
obama_vs_mccain <- obama_vs_mccain[!is.na(obama_vs_mccain$Turnout), ] 
with(obama_vs_mccain, plot(Income, Turnout,col = "violet", pch = 20))
with(obama_vs_mccain, plot(Income, Turnout, log = "y")) ## This sets the y-xis to be expressed as a logarithmic y scale
with(obama_vs_mccain, plot(Income, Turnout, log = "xy")) ## This sets both the x and y-xis to be expressed as a logarithmic scales

## PLOTTING BY REGIONS
par(mar = c(3, 3, 0.5, 0.5), oma = rep.int(0, 4), mgp = c(2, 1, 0)) 
regions <- levels(obama_vs_mccain$Region) 
plot_numbers <- seq_along(regions) 
layout(matrix(plot_numbers, ncol = 5, byrow = TRUE)) 
for(region in regions) 
{  
  regional_data <- subset(obama_vs_mccain, Region == region)  
  with(regional_data,  plot(Income, Turnout)) 
}
plot_numbers <- 1 
layout(matrix(plot_numbers, ncol =1, byrow = TRUE)) 
## TAKE 2: LATTICE GRAPHICS
##install.packages('lattice')
library(lattice)
xyplot(Turnout ~ Income, obama_vs_mccain) ## This is lattice equivalent of plot
xyplot(Turnout ~ Income, obama_vs_mccain, col = "violet", pch = 20)
xyplot(Turnout ~ Income,  obama_vs_mccain,  scales = list(log = TRUE))            #both axes log scaled (Fig. 14-8) 
xyplot(Turnout ~ Income,  obama_vs_mccain,  scales = list(y = list(log = TRUE)))  #y-axis log scaled (Fig. 14-9) 
xyplot(Turnout ~ Income | Region,obama_vs_mccain,  scales = list(log = TRUE, relation = "same",alternating = FALSE),layout = c(5, 2))
## Lattice graphs can be updated
(lat1 <- xyplot(  Turnout ~ Income | Region,  obama_vs_mccain )) #Fig. 14-11 
(lat2 <- update(lat1, col = "violet", pch = 20)) 

## TAKE 3: GGPLOT 2 GRAPHICS
##install.packages('ggplot2')
library(ggplot2) 
ggplot(obama_vs_mccain, aes(Income, Turnout)) +  geom_point() ## ggplot2 version of plot
ggplot(obama_vs_mccain, aes(Income, Turnout)) +  geom_point(color = "violet", shape = 20)
ggplot(obama_vs_mccain, aes(Income, Turnout)) +  geom_point() +  scale_x_log10(breaks = seq(2e4, 4e4, 1e4)) +  scale_y_log10(breaks = seq(50, 75, 5))
ggplot(obama_vs_mccain, aes(Income, Turnout)) +  geom_point() +  scale_x_log10(breaks = seq(2e4, 4e4, 1e4)) +  scale_y_log10(breaks = seq(50, 75, 5)) +  facet_wrap(~ Region, ncol = 4) ## used to print out multiple graphs
## ggplot2 like lattice can be stored as variables and updated
(gg1 <- ggplot(obama_vs_mccain, aes(Income, Turnout)) +  geom_point())
(gg2 <- gg1 +  facet_wrap(~ Region, ncol = 5) +  theme(axis.text.x = element_text(angle = 30, hjust = 1)))

## LINE PLOTS
data(crab_tag, package = "learningr") 
with(crab_tag$daylog,plot(Date, -Max.Depth, type = "l", ylim = c(-max(Max.Depth), 0)))
with(crab_tag$daylog,  lines(Date, -Min.Depth, col = "blue")) ## lines was used to add an extra line plot
xyplot(-Min.Depth + -Max.Depth ~ Date, crab_tag$daylog, type = "l") ## Lattice format
ggplot(crab_tag$daylog, aes(Date, -Min.Depth)) +  geom_line() ## a ggplot2 approach
ggplot(crab_tag$daylog, aes(Date)) +  geom_line(aes(y = -Max.Depth)) +  geom_line(aes(y = -Min.Depth))

## Another ggplot2 approach
library(reshape2) 
crab_long <- melt(crab_tag$daylog,id.vars = "Date",  measure.vars = c("Min.Depth", "Max.Depth") ) 
ggplot(crab_long, aes(Date, -value, group = variable)) +  geom_line()
## A better approach
ggplot(crab_tag$daylog, aes(Date, ymin = -Min.Depth, ymax = -Max.Depth)) +  geom_ribbon(color = "black", fill = "white")

## HISTOGRAMS

## A BASE APPROACH
with(obama_vs_mccain, hist(Obama)) 
with(obama_vs_mccain,  hist(Obama, 4, main = "An exact number of bins")) ## the number signifies the number of bins
with(obama_vs_mccain,  hist(Obama, seq.int(0, 100, 5), main = "A vector of bin edges")) ## seq.int is used to group the bins into widths of 5
with(obama_vs_mccain,  hist(Obama, "FD", main = "The name of a method")) ## FD signifies a method
with(obama_vs_mccain,  hist(Obama, nclass.scott, main = "A function for the number of bins")) 

binner <- function(x) 
{  
  seq(min(x, na.rm = TRUE), max(x, na.rm = TRUE), length.out = 50) 
} 
with(obama_vs_mccain,  hist(Obama, binner, main = "A function for the bin edges")) 
with(obama_vs_mccain, hist(Obama, freq = FALSE)) ## setting frequency to FALSE only displays frequency densities

## A LATTICE APPROACH
histogram(~ Obama, obama_vs_mccain) 
histogram(~ Obama, obama_vs_mccain, breaks = 10) 
histogram(~ Obama, obama_vs_mccain, type = "percent") ## This plots frequency densities on the left

## A GGPLOT2 APPROACH
ggplot(obama_vs_mccain, aes(Obama)) +  geom_histogram(binwidth = 5)
ggplot(obama_vs_mccain, aes(Obama, ..density..)) +  geom_histogram(binwidth = 5)

## BOX PLOTS

boxplot(Obama ~ Region, data = obama_vs_mccain) ## BASE APPROACH
ovm <- within(obama_vs_mccain, Region <- reorder(Region, Obama, median)) 
boxplot(Obama ~ Region, data = ovm)

bwplot(Obama ~ Region, data = ovm) ## LATTICE APPROACH

ggplot(ovm, aes(Region, Obama)) +  geom_boxplot() ## GGPLOT2 APPROACH

## BAR CHARTS

ovm <- ovm[!(ovm$State %in% c("Alaska", "Hawaii")), ]
par(las = 1, mar = c(3, 9, 1, 1)) 
## BASE APPROACH

with(ovm, barplot(Catholic, names.arg = State, horiz = TRUE)) 
religions <- with(ovm, rbind(Catholic, Protestant, Non.religious, Other)) 
colnames(religions) <- ovm$State 
par(las = 1, mar = c(3, 9, 1, 1))
barplot(religions, horiz = TRUE, beside = FALSE)

## LATTICE APPROACH
barchart(State ~ Catholic, ovm)
barchart(State ~ Catholic + Protestant + Non.religious + Other,  ovm,  stack = TRUE)

## GGPLOT2 APPROACH
religions_long <- melt(ovm,  id.vars = "State",  measure.vars = c("Catholic", "Protestant", "Non.religious", "Other"))
ggplot(religions_long, aes(State, value, fill = variable)) +  geom_bar(stat = "identity") +  coord_flip()
ggplot(religions_long, aes(State, value, fill = variable)) +  geom_bar(stat = "identity", position = "dodge") +  coord_flip()

install.packages('usethis')
library(usethis)
library(devtools) 
## install_github("rCharts", "ramnathv") 

## ASSIGNMENT

## 1
with(obama_vs_mccain, cor(Unemployment, Obama))
library(ggplot2)
ggplot(obama_vs_mccain, aes(Unemployment,Obama)) + geom_point()

## 2
data(alpe_d_huez2, package = "learningr")
head(alpe_d_huez2)
ggplot(alpe_d_huez2, aes(NumericTime)) + geom_histogram() + facet_wrap(~ DrugUse)
ggplot(alpe_d_huez2, aes(NumericTime)) + geom_boxplot() + facet_wrap(~ DrugUse)

## 2
data(gonorrhoea, package = "learningr")
head(gonorrhoea)
ggplot(gonorrhoea, aes(Age.Group, Rate)) + geom_line() 
ggplot(gonorrhoea, aes(Ethnicity)) + geom_line(aes(y = Rate)) 
ggplot(gonorrhoea, aes(Gender)) + geom_line(aes(y = Rate))
