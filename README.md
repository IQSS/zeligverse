
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![zelig-logo](man/figures/zelig.png)](http://zeligproject.org)

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/zeligverse)](https://cran.r-project.org/package=zeligverse) [![Travis-CI Build Status](https://travis-ci.org/IQSS/zeligverse.svg?branch=master)](https://travis-ci.org/IQSS/zeligverse) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/IQSS/zeligverse?branch=master&svg=true)](https://ci.appveyor.com/project/IQSS/zeligverse)

About
=====

This package makes it convenient to install and load all of the stable Zelig packages. This includes:

-   [Zelig](https://github.com/IQSS/Zelig)

-   [ZeligChoice](https://github.com/IQSS/ZeligChoice)

-   [ZeligEI](https://github.com/IQSS/ZeligEI)

-   [Amelia](https://gking.harvard.edu/amelia)

-   [MatchIt](https://gking.harvard.edu/matchit)

-   [WhatIf](https://gking.harvard.edu/whatif)

Use
===

To use **zeligverse**, simply load the package:

``` r
library(zeligverse)
```

    ## + Zelig       5.1.1.90000        Date: 2017-05-17
    ## + ZeligChoice 0.9.5.90000           R: 3.4.0
    ## + ZeligEI     0.1.1                OS: macOS Sierra 10.12.5
    ## + Amelia      1.7.4               GUI: unknown
    ## + MatchIt     3.0.1            Locale: en_US.UTF-8
    ## + WhatIf      1.5.8                TZ: America/New_York

As you can see, all of the stable Zelig packages are loaded.

Installing **zeligverse** will install these packages.

Adding packages \[for developers\]
==================================

**zeligverse** developers can add packages to **zeligverse** by:

-   adding the package name to the *DESCRIPTION* `Imports`

-   adding the package name to the `core` object in *attach.R*

Inspiration
===========

The inspiration (and much of the underlying code) for **zeligverse** comes from the [tidyverse](http://tidyverse.org/) package.
