---
title: 'remBoot: An R package for Random Encounter Modelling'
tags:
  - Random Encounter Model
  - REM
  - density estimates
  - camera trap
  - ecology
  - bootstrapping
authors:
 - name: Anthony Caravaggi
   orcid: 0000-0002-1763-8970
   affiliation: 1
affiliations:
 - name: School of Biological Sciences, Queen’s University Belfast, Belfast BT9 7BL, UK
   index: 1
date: 10 January 2017
---

__Software Repository:__	https://github.com/arcaravaggi/remBoot

__Software Archive:__	http://dx.doi.org/10.6084/m9.figshare.4536065

##Summary

The Random Encounter Model (REM) allows researchers to calculate population densities from camera trap data for species which do no exhibit individually-identifiable markings (Rowcliffe et al., 2008) such as tapir (_Tapirus terrestris_; Oliveira-Santos et al. 2010), pine marten (_Martes martes_; Manzo et al. 2011), and hares (_Lepus_ sp.; Caravaggi et al. 2016). 

Density (D) is linearly scaled with trapping rate, based on two biological variables and two camera characteristics: _g_ = average animal group size; _y_ = number of detections; _t_ = survey effort (i.e. camera hours); _v_ = average distance travelled by the species in 24 hours; _r_ = radial distance to the animal; and, theta = zone of detection (Fig. 1; Rowcliffe et al., 2008). 

remBoot is the first package to implement REM calculations in R. The package also contains functions which allow the calculation of variance (standard deviation [SD] and/or 95% confidence intervals [CI]; Fig. 2). These calculations are computationally inexpensive and can be applied to datasets of considerable size. Densities and associated variances can be calculated for one or more sites concurrently, streamlining the analytical process.

##References

Caravaggi, A., Zaccaroni, M., Riga, F., Schai-Braun, S.C., Dick, J.T., Montgomery, W.I. and Reid, N. (2016). An invasive-native mammalian species replacement process captured by camera trap survey random encounter models. Rem Sens Ecol Cons. 2, 45-58. [DOI: 10.1002/rse2.11](http://onlinelibrary.wiley.com/doi/10.1002/rse2.11/abstract)

Manzo, E., Bartolommei, P., Rowcliffe, J.M. and Cozzolino, R. (2011). Estimation of population density of European pine marten in central Italy using camera trapping. Acta Theriol. 57, 165 – 172. [DOI: 10.1007/s13364-011-0055-8](http://link.springer.com/article/10.1007/s13364-011-0055-8)

Oliveira-Santos, L.G.R., Zucco, C.A., Antunes, P.C. and Crawshaw, P.G. (2010). Is it possible to individually identify mammals with no natural markings using camera-traps? A controlled case-study with lowland tapirs. Mamm Biol. 75, 375 – 378. [DOI: 10.1016/j.mambio.2009.08.005](10.1016/j.mambio.2009.08.005)

Rowcliffe, J.M., Field, J., Turvey, S.T. and Carbone, C. (2008). Estimating animal density using camera traps without the need for individual recognition. J Appl Ecol. 45, 1228 – 1236. [DOI: 10.1111/j.1365-2664.2008.01473.x] (http://onlinelibrary.wiley.com/doi/10.1111/j.1365-2664.2008.01473.x/abstract)



![REM diagram](REM_diagram.jpg)

__Figure 1.__ Data input (y and t) and parameters (r, theta and v) required for the calculation of population density estimates from camera trap data by the Random Encounter Model (REM). g = average animal group size; y = number of detections; t = survey effort (i.e. camera hours); v = distance travelled in 24 hours; r = radial distance to the target; and, theta = zone of detection.

![Density plot](density_plot.png)

__Figure 2.__ Animal densities (individuals.km2) with associated variances (SD) calculated via Random Encounter Models, using remBoot.
