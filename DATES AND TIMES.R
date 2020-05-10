## DATE AND TIME CLASSES

## There are three date and time classes that come with R: POSIXct, POSIXlt, and Date. 

## POSIX Dates and Times
(now_ct <- Sys.time()) ## used for returning the current date and time
class(now_ct)
unclass(now_ct)
(now_lt <- as.POSIXlt(now_ct)) ## used for returning the current date and time using POSIXlt which stores dates as lists
class(now_lt) ## returns a different value from Sys.time()
unclass(now_lt) ## returns a lists of values associated with date

now_lt$sec

## THE DATE CLASS
(now_date <- as.Date(now_ct)) ## for storing as date
class(now_date)
unclass(now_date)

## CONVERSION TO AND FROM STRINGS

## PARSING DATES
?strptime
moon_landings_str <- c(  
  "20:17:40 20/07/1969",  
  "06:54:35 19/11/1969",  
  "09:18:11 05/02/1971",  
  "22:16:29 30/07/1971",  
  "02:23:35 21/04/1972",  
  "19:54:57 11/12/1972" 
) 

(moon_landings_lt <- strptime(moon_landings_str,  "%H:%M:%S %d/%m/%Y",  tz = "UTC")) 

strptime(moon_landings_str,  "%H:%M:%S %d-%m-%Y",  tz = "UTC" ) ## if the format doesn't match it prints out NA

## FORMATTING DATES

strftime(now_ct, "It's %I:%M%p on %A %d %B, %Y.") 

## TIME ZONES

strftime(now_ct, tz = "America/Los_Angeles")
strftime(now_ct, tz = "Africa/Brazzaville")
strftime(now_ct, tz = "Asia/Kolkata") 
strftime(now_ct, tz = "Australia/Adelaide")

file.path(R.home("share"), "zoneinfo", "zone.tab")
## UTC + n is passed as an argument for tz. Negative time zone is used for eastern time and positive time zone for western time

strftime(now_ct, tz = "EST")       #Canadian Eastern Standard Time, tz = "EST" for eastern time zone
strftime(now_ct, tz = "PST8PDT")   #Pacific Standard Time w/ daylight savings
strftime(now_ct, tz = "Asia/Tokyo") 
strftime(now_lt, tz = "Asia/Tokyo")             #no zone change for POSIXlt
strftime(as.POSIXct(now_lt), tz = "Asia/Tokyo") ## convert to ct first 

## Arithmetic with Dates and Times

now_ct + 86400  #Tomorrow.  I wonder what the world will be like! 
now_lt + 86400 #Same behavior for POSIXlt 
now_date + 1   #Date arithmetic is in days 

the_start_of_time <-    #according to POSIX  
  as.Date("1970-01-01") 
the_end_of_time <-      #according to Mayan conspiracy theorists  
 as.Date("2012-12-21")
(all_time <- the_end_of_time - the_start_of_time) 
class(all_time) 
unclass(all_time)
difftime(the_end_of_time, the_start_of_time, units = "secs") 
difftime(the_end_of_time, the_start_of_time, units = "weeks")
seq(the_start_of_time, the_end_of_time, by = "1 year") 
seq(the_start_of_time, the_end_of_time, by = "500 days") 

library(lubridate) 
john_harrison_birth_date <- c( #He invented the marine chronometer  
  "1693-03 24",  
  "1693/03\\24",  
  "Tuesday+1693.03*24"
) 
ymd(john_harrison_birth_date)  #All the same 
date_format_function <-  stamp("A moon landing occurred on Monday 01 January 1900 at 18:00:00.")
date_format_function(moon_landings_lt) 
(duration_one_to_ten_years <- dyears(1:10)) 
today() + duration_one_to_ten_years 

(period_one_to_ten_years <- years(1:10))
today() + period_one_to_ten_years
a_year <- dyears(1)    #exactly 60*60*24*365 seconds 
as.period(a_year)      #only an estimate 

start_date <- ymd("2016-02-28") 
(interval_over_leap_year <- new_interval(  
  start_date,  
  start_date + a_year 
))
as.period(interval_over_leap_year) 

ymd("2016-02-28") %--% ymd("2016-03-01") #another way to specify interval
ymd("2016-02-29") %within% interval_over_leap_year 
with_tz(now_lt, tz = "America/Los_Angeles") 
with_tz(now_lt, tz = "Africa/Brazzaville") 
force_tz(now_lt, tz = "Asia/Kolkata") 
force_tz(now_lt, tz = "Australia/Adelaide") 

floor_date(today(), "year") 
ceiling_date(today(), "year") 
