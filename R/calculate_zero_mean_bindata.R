#' @export calculate_zero_mean_bindata
calculate_zero_mean_bindata <- function(bindata)
{
  mean_bindata <- mean(bindata)
  
  zero_mean_bindata <- bindata - mean_bindata;
}
