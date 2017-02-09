# remBoot

remBoot is an implementation of the Random Encounter Model (REM) developed by Rowcliffe _et al._ (2008). The REM is based on brownian motion and allows the estimation of animal densities for a given survey area. The REM is particularly useful in that species do not need to be marked or exhibit individual markings for estimates to be calculated. This package contains a number of functions which allow the user to calculate densities for one or more sites and bootstrap their data to calculate variance.   

# Installation

To install remBoot from the GitHub repo, use the following commands:  

install.packages("githubinstall")  
library(githubinstall)  
githubinstall("remBoot")  


# Example

data(hDat)  
grpDat <- split_dat(hDat)  
tm <- 3600  
v <- 1.4  
rem(dat = grpDat[[1]], tm = 3600, v = 1.4)  
rem(dat = grpDat[[2]], tm = 3360, v = 1.4)  

nboots <- 1000  
remsD <- lapply(grpDat, boot_sd)   
remsSD <- lapply(remsD, sd)  
remsSD  

A detailed example can be found at http://htmlpreview.github.io/?https://github.com/arcaravaggi/remBoot/blob/master/vignettes/remBoot.html  

# Development

## Contributions

Contributors are welcome to fork the package and suggest additions or improvements.  

#### I found a bug

Please report it to the [issue tracker][issues]. Please provide specific details, allowing the error to be reproduced and investigated. Always note the version of R you are using, along with any other relevant software (e.g. RStudio).  

[issues]: https://github.com/arcaravaggi/remBoot/issues


# License

This package is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License, version 3, as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but without any warranty; without even the implied warranty of merchantability or fitness for a particular purpose. See the GNU General Public License for more details.

A copy of the GNU General Public License, version 3, is available at https://www.r-project.org/Licenses/GPL-
