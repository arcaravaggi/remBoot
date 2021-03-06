---
title: "remBoot: An R package for Random Encounter Modelling"
author: "Anthony Caravaggi"
output:  
      html_document:  
        keep_md: TRUE 
---


remBoot is an implementation of the Random Encounter Model (REM) developed by Rowcliffe _et al._ (2008). The REM is based on brownian motion and allows the estimation of animal densities for a given survey area. The REM is particularly useful in that species do not need to be marked or exhibit individual markings for estimates to be calculated. This package contains a number of functions which allow the user to calculate densities for one or more sites and bootstrap their data to calculate variance.   

The package was updated on th 9th of April 2019 to generate four measures of variance: standard deviation; standard error; 95% confidence intervals; quantiles.

# Installation


```r
devtools::install_github("arcaravaggi/remBoot")
```

# Example


```r
library(remBoot)

data(hDat)  
grpDat <- split_dat(hDat)  
tm <- 3600  
v <- 1.4  
rem(dat = grpDat[[1]], tm = 3600, v = 1.4)  
```

```
## [1] 2.249995
```

```r
rem(dat = grpDat[[2]], tm = 3360, v = 1.4)  
```

```
## [1] 1.153592
```

```r
nboots <- 1000  
remsD <- lapply(grpDat, boot_sd)   
remsSD <- lapply(remsD, sd)  
remsSD  
```

```
## [[1]]
## [1] 0.1120678
## 
## [[2]]
## [1] 0.2166288
## 
## [[3]]
## [1] 0.2980642
## 
## [[4]]
## [1] 0.1972643
## 
## [[5]]
## [1] 0.1464666
```

A detailed example can be found in the [vignette][vig].

[vig]: http://htmlpreview.github.io/?https://github.com/arcaravaggi/remBoot/blob/master/vignettes/remBoot.html 

# Development

## Contributions

Contributors are welcome to fork the package and suggest additions or improvements.  

#### I found a bug

Please report it to the [issue tracker][issues]. Please provide specific details, allowing the error to be reproduced and investigated. Always note the version of R you are using, along with any other relevant software (e.g. RStudio).  

[issues]: https://github.com/arcaravaggi/remBoot/issues

# References

Rowcliffe, J.M., Field, J., Turvey, S.T. and Carbone, C. (2008). Estimating animal density using camera traps without the need for individual recognition. J Appl Ecol. 45, 1228 – 1236. [DOI: 10.1111/j.1365-2664.2008.01473.x](http://onlinelibrary.wiley.com/doi/10.1111/j.1365-2664.2008.01473.x/abstract)

# License

This package is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License, version 3, as published by the Free Software Foundation. Please consider citing the work for which this was created and/or the package itself:

**Caravaggi A**, Zaccaroni M, Riga F, Schai-Braun SC, Dick JTA, Montgomery WI, Reid N (2016) An invasive-native mammalian species replacement process captured by camera trap survey Random Encounter Models. *Remote Sensing in Ecology and Conservation*. 2: 45-58. doi: [10.1002/rse2.11](http://onlinelibrary.wiley.com/doi/10.1002/rse2.11/abstract)      

**Caravaggi A**.  remBoot: An R package for Random Encounter Modelling. *Journal of Open Source Software*. 2(10). doi: [10.21105/joss.00176](http://joss.theoj.org/papers/10.21105/joss.00176)   

This program is distributed in the hope that it will be useful, but without any warranty; without even the implied warranty of merchantability or fitness for a particular purpose. See the GNU General Public License for more details.

A copy of the GNU General Public License, version 3, is available at https://www.r-project.org/Licenses/GPL-
