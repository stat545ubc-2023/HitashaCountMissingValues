
<!-- README.md is generated from README.Rmd. Please edit that file -->

## README Document for Assignment B2

<!-- badges: start -->
<!-- badges: end -->

The package created for this assignment provides a function called
`count_all_missing_by_group()`. This allows you to count missing values
for all columns by group. It creates a new data frame with one row per
level of group. The first column of the output data frame contains the
levels of group while the rest of the columns contain the number of
missing values for all columns in the data except those in group.

## Installation

The `HitashaCountMissingValues` package requires the `devtools` package
be installed, as well as any dependencies the package may have. You can
do so by using install.packages(“devtools”).

You can install `HitashaCountMissingValues` from github by running the
following code:

``` r
devtools::install_github("stat545ubc-2023/HitashaCountMissingValues", ref= "0.1.0")
```

## Usage

This example computes the number of missing values in the `airquality`
dataset grouped by the `month` column.

``` r
library(HitashaCountMissingValues)
count_all_missing_by_group(airquality, Month)
#> # A tibble: 5 × 6
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```

This example has the same output as the last example, but shows off an
alternative way of invoking the `count_all_missing_by_group()`: piping
the dataset into the function.

``` r
airquality |> count_all_missing_by_group(Month) 
#> # A tibble: 5 × 6
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```

The optional `.groups` argument allows us to keep the output grouped by
the grouping column. See example below; notice how the output is a
grouped tibble, rather than the ungrouped tibble output of the earlier
examples.

``` r
count_all_missing_by_group(airquality, Month, .groups = "keep")
#> # A tibble: 5 × 6
#> # Groups:   Month [5]
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```
