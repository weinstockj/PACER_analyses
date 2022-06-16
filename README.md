# PACER analyses

This repo contains a series of analyses that are included in [Clonal hematopoiesis is driven by aberrant activation of TCL1A](https://www.biorxiv.org/content/10.1101/2021.12.10.471810v1). 
For questions, contact [Josh Weinstock](jweinstk@umich.edu). The analyses were
largely performed in [Rmarkdown](https://rmarkdown.rstudio.com/) files. Please see the 
Rmarkdown documentation for executing these files. 

## PACER gene level analyses
Please see [here](counts_by_gene.Rmd) for our analyses on estimating driver gene
fitness estimates. 

## PACER validation in WHI samples
See [here](new_clonal_expansion_estimates_evaluation.Rmd) for our analysis 
of our clonal expansion estimates in WHI carriers with multiple mutational
assessments. 

## PACER-HB
See [here](model_clone_growth.Rmd) for PACER-HB development and analyses. 

## Finemapping the TCL1A locus
See [here](finemapping_tcl1a.Rmd) for our analysis that performs finemapping
of the TCL1A locus using SuSIE. 

## Data availability
Please see the data availability statement in the paper. The data required to 
reproduce these analysis is available through dbGaP. 

## Dependencies
An [renv](https://github.com/rstudio/renv) lock file is provided, which 
states the R version and packages required. 

## Notes on portability
This analysis has only been tested on Ubuntu 18.04.

## License
The appropriate license for this code is currently under consideration. 
