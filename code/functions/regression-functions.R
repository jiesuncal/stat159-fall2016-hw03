#' @title calculate the residual sum of squares
#' @param a "lm" object
#' @return RSS (numeric)
residual_sum_squares = function(reg) {
  sum(reg$residuals^2)
}

#' @title calculate the total sum of squares
#' @param a "lm" object
#' @return TSS (numeric)
total_sum_squares = function(reg) {
  true_values = reg$residuals + reg$fitted.values
  sum((true_values - mean(true_values))^2)
}

#' @title calculate the R squared statistic
#' @param a "lm" object
#' @return R squared (numeric)
r_squared <- function(reg) {
  1 - residual_sum_squares(reg)/total_sum_squares(reg)
}

#' @title calculate the F-statistic
#' @param a "lm" object
#' @return F-statistic (numeric)
f_statistic <- function(reg) {
  n <- length(reg$fitted.values)
  p <- sum(reg$coefficients != 0) - 1
  ((total_sum_squares(reg)-residual_sum_squares(reg))/p) / (residual_sum_squares(reg) / (n-p-1))
}

#' @title calculate the residual standard error
#' @param a "lm" object
#' @return RSE (numeric)
residual_std_error <- function(reg) {
  n <- length(reg$fitted.values)
  p <- sum(reg$coefficients != 0) - 1
  sqrt(residual_sum_squares(reg) / (n-p-1))
}