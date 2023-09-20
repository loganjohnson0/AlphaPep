
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AlphaPep

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of AlphaPep is to visualize proteomic and peptidomic data on a
structural level

## Installation

``` r
# install.packages("devtools")
devtools::install_github("loganjohnson0/AlphaPep")
#> Skipping install of 'AlphaPep' from a github remote, the SHA1 (a9c9aaf2) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(AlphaPep)

AlphaPep::get_alphafold2(uniprot_id = "P02540")
#> No encoding supplied: defaulting to UTF-8.
```

# View Protein

``` r
library(NGLVieweR)
library(tidyverse, quietly = TRUE)
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.2     ✔ readr     2.1.4
#> ✔ forcats   1.0.0     ✔ stringr   1.5.0
#> ✔ ggplot2   3.4.2     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
#> ✔ purrr     1.0.1     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

NGLVieweR::NGLVieweR(data = "AlphaFold_Structure.pdb") %>% 
  NGLVieweR::addRepresentation(type = "cartoon", 
                                     param = list(
                                       name = "cartoon", 
                                       color = "residueindex")) %>%
        NGLVieweR::stageParameters(backgroundColor = "black") %>%
        NGLVieweR::setQuality("high") %>%
        NGLVieweR::setFocus(0) %>%
        NGLVieweR::setSpin(TRUE)
#> Warning in readLines(data): incomplete final line found on
#> 'AlphaFold_Structure.pdb'
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />
