source("../functions/regression-functions.R")
# multiple regression w/ testing data mtars
reg = lm(mpg ~ disp + hp, data = mtcars)
# summary of 'reg' 
regsum = summary(reg)

context("Test for RSS") 

test_that("residual sum squares", {
  expect_equal(residual_sum_squares(reg), sum(reg$residuals^2))
  expect_length(residual_sum_squares(reg), 1)
  expect_type(residual_sum_squares(reg), 'double')
})

context("Test for TSS") 

test_that("total sum squares of", {
  expect_equal(total_sum_squares(reg), sum((mtcars$mpg - mean(mtcars$mpg))^2))
  expect_length(total_sum_squares(reg), 1)
  expect_type(total_sum_squares(reg), 'double')
})

context("Test for R squared") 

test_that("r squared statistic", {
  expect_equal(r_squared(reg), regsum$r.squared)
  expect_length(r_squared(reg), 1)
  expect_type(r_squared(reg), 'double')
})

context("Test for F-statistic") 

test_that("f-statistic", {
  true_f = regsum$fstatistic[1]
  names(true_f) = NULL
  expect_equal(f_statistic(reg), true_f)
  expect_length(f_statistic(reg), 1)
  expect_type(f_statistic(reg), 'double')
})

context("Test for RSE") 

test_that("residual sum squares of testing data", {
  expect_equal(residual_std_error(reg), regsum$sigma)
  expect_length(residual_std_error(reg), 1)
  expect_type(residual_std_error(reg), 'double')
})