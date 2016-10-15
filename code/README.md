# Code

* `eda-script.R` reads in the `Advertising.csv` data set, and computes summary statistics, histograms for all the variables (`TV`, `Radio`, `Newspaper`, and `Sales`), matrix of correlations among all variables, and scatterplot-matrix (pairwise scatterplots). The summary statistics (clearly labeled) and the matrix of correlations, will be saved in a file `eda-output.txt`. The correlation matrix is also saved in binary format `correlation-matrix.RData`. In turn, each exploratory chart is saved in PNG format.

* `regression-script.R` reads in the `Advertising.csv` data set, and computes a `"regression"` object as well as the summary of such regression object. These objects are saved in the file `regression.RData`. This script also produces the three diagnostics plots `residual-plot.png`, `scale-location-plot.png`, and `normal-qq-plot.png`.

* `session-info-script.R` is a script that includes `library()` calls to ALL the packages used for this project, as well as the output of the function `sessionInfo()`. The output is exported to the file `session-info.txt`.
