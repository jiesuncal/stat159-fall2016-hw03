library(testthat)

# loading the function file
source("functions/regression-functions.R")

# run unit tests in folder 'tests/'
test_dir("tests", reporter = "Summary")