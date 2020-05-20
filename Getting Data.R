## GETTING DATA

## BUILT-IN DATASETS

data() ## for accessing all the datasets from the loaded packages
data(package = .packages(TRUE)) ## for accessing all the datasets from the installed packages

data("kidney", package = "survival") ## for accessing a particular dataset in a certain package
head(kidney)
 
## READING TEXT FILES

# install.packages('learningr')
library(learningr) 
deer_file <- system.file(  ## used to locate the file inside packages
  "extdata",  
  "RedDeerEndocranialVolume.dlm",  
  package = "learningr" 
)
deer_data <- read.table(deer_file, header = TRUE, fill = TRUE) ## used to obtain the dataset
str(deer_data, vec.len = 1)      #vec.len alters the amount of output 
head(deer_data)

crab_file <- system.file("extdata",  "crabtag.csv",  package = "learningr") 
(crab_id_block <- read.csv(crab_file,  header = FALSE,  skip = 3,  nrow = 2)) ## read.csv for reading csv files, skip used to skip a certain number of rows and nrows to print a certain number of rows
(crab_tag_notebook <- read.csv(crab_file,  header = FALSE,  skip = 8,  nrow = 5))
(crab_lifetime_notebook <- read.csv(crab_file,  header = FALSE,  skip = 15,  nrow = 3 )) 

write.csv(crab_lifetime_notebook,"C:/Users/ganiy/OneDrive/Documents/lately.csv",row.names = FALSE) ## write.csv can be used to write a csv data frame to a file path

## UNSTRUCTURED TEXT FILES

?readLines
text_file <- 'C:/Users/ganiy/OneDrive/Documents/sample.txt'
the_tempest <- readLines('C:/Users/ganiy/OneDrive/Documents/sample.txt') ## used for reading lines of unstructured files
the_tempest[1:4]

writeLines(rev(text_file),     #rev reverses vectors  
           "Shakespeare's The Tempest, backwards.txt" 
) 

## XML and HTML Files

# install.packages('XML')
library(XML) 
xml_file <- system.file("extdata", "options.xml", package = "learningr") 
r_options <- xmlParse(xml_file) ## xmlParse for getting xml data
xmlParse(xml_file, useInternalNodes = FALSE) 
xmlTreeParse(xml_file)      #the same
xpathSApply(r_options, "//variable[contains(@name, 'warn')]") ## used for querying nodes
# install.packages('Runiversal')
library(Runiversal) 
ops <- as.list(options()) 
cat(makexml(ops), file = "options.xml") 

## JSON and YAML files 
#install.packages('RJSONIO')
i# nstall.packages('rjson')
library(RJSONIO) 
library(rjson) 
jamaican_city_file <- "C:/Users/ganiy/OneDrive/Documents/EmployeeData.json"
(jamaican_cities_RJSONIO <- RJSONIO::fromJSON('C:/Users/ganiy/OneDrive/Documents/EmployeeData.json')) ## for reading JSON files
(jamaican_cities_rjson <- rjson::fromJSON(file = jamaican_city_file))
?learningr

special_numbers <- c(NaN, NA, Inf, -Inf) 
RJSONIO::toJSON(special_numbers)

rjson::toJSON(special_numbers)

# install.packages('yaml')
library(yaml) 
yaml.load_file(jamaican_city_file) 

## MICROSOFT EXCEL
##install.packages('readxl')
library(readxl)
bike_file <- "C:/Users/ganiy/OneDrive/Documents/MATH2810.xlsx"
bike_data <- read_excel(bike_file, header = TRUE)
head(bike_data)

## SITE DATA
library(WDI)
wdi_datasets <- WDIsearch() 
head(wdi_datasets)
wdi_trade_in_services <- WDI(indicator = "BG.GSR.NFSV.GD.ZS")
str(wdi_trade_in_services)

library(quantmod) 
options(getSymbols.auto.assign = FALSE) 
microsoft <- getSymbols("MSFT") 
head(microsoft) 

## SCRAPING WEB PAGES
salary_url <- "http://www.justinmrao.com/salary_data.csv" ## getting data from a website
salary_data <- read.csv(salary_url) 
str(salary_data)

salary_url <- "http://www.justinmrao.com/salary_data.csv" ## another approach for getting data from a website
local_copy <- "my local copy.csv"
download.file(salary_url, local_copy) 
salary_data <- read.csv(local_copy) 


library(RCurl) 
time_url <- "http://tycho.usno.navy.mil/cgi-bin/timer.pl" 
time_page <- getURL(time_url) 
cat(time_page) 

library(httr) 
time_page <- GET(time_url) 
time_doc <- content(page, useInternalNodes = TRUE) 


## ACCESSING DATABASES
library(DBI) 
library(RSQLite)

driver <- dbDriver("SQLite") 
db_file <- system.file("extdata",  "crabtag.sqlite",  package = "learningr" ) 
conn <- dbConnect(driver, db_file)

query <- "SELECT * FROM IdBlock" 
(id_block <- dbGetQuery(conn, query))

dbDisconnect(conn)
dbUnloadDriver(driver)

query_crab_tag_db <- function(query) 
{  
  driver <- dbDriver("SQLite")  
  db_file <- system.file("extdata","crabtag.sqlite",package = "learningr")  
  conn <- dbConnect(driver, db_file)  
  on.exit(    
    {      #this code block runs at the end of the function,      
           #even if an error is thrown      
      dbDisconnect(conn)      
      dbUnloadDriver(driver)    
    }  
  )  
  dbGetQuery(conn, query) 
}

query_crab_tag_db("SELECT * FROM IdBlock") 
dbReadTable(conn, "idblock")

## ASSIGNMENT
manga_1 <- system.file("extdata", "hafu.csv", package = 'learningr')
read.csv(manga_1, header = TRUE,fill = TRUE)
