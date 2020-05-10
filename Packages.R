## PACKAGES

## LOADING PACKAGES

library(lattice) ## Loading a package
dotplot(
  variety ~ yield | site,  
  data   = barley,  
  groups = year 
)
pkgs <- c("lattice", "utils", "rpart") 
for(pkg in pkgs) {library(pkg, character.only = TRUE)} ## Loading a lot of package

if(!require(apackagethatmightnotbeinstalled)) 
{ 
  warning("The package 'apackagethatmightnotbeinstalled' is not available.")  
  #perhaps try to download it  #... 
}

## THE SEARCH PATH

search() ## used for searching the loaded packages

## LIBRARIES AND INSTALLED PACKAGES

View(installed.packages()) ## Used for viewing all the installed packages on R for this device
R.home("library")   # Used to retrieve location of the library where all the packages are stored
.Library
path.expand("~")    # used to find out the location of R
Sys.getenv("HOME")
.libPaths() ## used 
## INSTALLING PACKAGES

View(available.packages()) ## used for viewing all the available packages on R 

install.packages(  ## used to install packages from repos
  c("xts", "zoo"),   
  repos = "http://www.stats.bris.ac.uk/R/" 
) 

install.packages(  
  c("xts", "zoo"),  
  lib   = "some/other/folder/to/install/to", ## to install them into a different location
  repos = "http://www.stats.bris.ac.uk/R/" 
)

setInternet2()

install.packages(  
  "path/to/downloaded/file/xts_0.8-8.tar.gz",  
  repos = NULL,       #NULL repo means "package already downloaded"  
  type = "source"     #this means "build the package now" 
)

install.packages(  
  "path/to/downloaded/file/xts_0.8-8.zip",  
  repos = NULL,       #still need this
  type = "win.binary" #Windows only! 
) 

install.packages("devtools") ## for installing packages directly from Github                   
library(devtools) 
install_github("knitr", "yihui") 

update.packages(ask = FALSE) ## used for updating packages
remove.packages('zoo') ## used for removing packages


## ASSIGNMENTS
install.packages('lubridate')
install.packages(  ## used to install packages from repos
  c("Hmisc"),   
  repos = "http://www.stats.bris.ac.uk/R/" 
) 
nrow(installed.packages()) ## used for counting the number of packages in the libraries
