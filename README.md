
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Customer-segmentation

<!-- badges: start -->
<!-- badges: end -->

The goal of Customer-segmentation is to …

------------------------------------------------------------------------

## Importation and exploration of data

Let’s look at the dataset to see if it has been loaded correctly and to
see the name and type of the variables.

    #>   CustomerID Gender Age Annual.Income..k.. Spending.Score..1.100.
    #> 1          1   Male  19                 15                     39
    #> 2          2   Male  21                 15                     81
    #> 3          3 Female  20                 16                      6
    #> 4          4 Female  23                 16                     77
    #> 5          5 Female  31                 17                     40
    #> 6          6 Female  22                 17                     76

We look at the summary of the data and the standard deviation of numeric
variables.

    #>    CustomerID        Gender               Age        Annual.Income..k..
    #>  Min.   :  1.00   Length:200         Min.   :18.00   Min.   : 15.00    
    #>  1st Qu.: 50.75   Class :character   1st Qu.:28.75   1st Qu.: 41.50    
    #>  Median :100.50   Mode  :character   Median :36.00   Median : 61.50    
    #>  Mean   :100.50                      Mean   :38.85   Mean   : 60.56    
    #>  3rd Qu.:150.25                      3rd Qu.:49.00   3rd Qu.: 78.00    
    #>  Max.   :200.00                      Max.   :70.00   Max.   :137.00    
    #>  Spending.Score..1.100.
    #>  Min.   : 1.00         
    #>  1st Qu.:34.75         
    #>  Median :50.00         
    #>  Mean   :50.20         
    #>  3rd Qu.:73.00         
    #>  Max.   :99.00

    #> [1] "The standar deviation or the volatility of Age is:  13.9690073315589"
    #> [1] "The standar deviation or the volatility of Annual Income is:  26.2647211652712"
    #> [1] "The standar deviation or the volatility of Spending Score is: 25.8235216683702"
