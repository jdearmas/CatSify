#' @title Preview Binary Data
#' @description This function outputs a plot of the binary data 
#' @param bindata An integer vector of the neuron data
#' @param preview_range An integer vector that represents the x-axis
#' @return A plot of the inputed data over the preview range
#' @examples
#' bindata <- import_binary_data_file('Data/Cat_Data.bin',10)
#' preview_range <- 1:10
#' preview_bin_data(bindata,preview_range)
#' @export preview_bin_data
preview_bin_data <- function(bindata,preview_range)
{
  prv <- preview_range;
  bindata
  time_value <- time(bindata[prv])
  plot(time_value,bindata[prv],"l",xlab = "time, units unknown",
       ylab = "time deriv. of potential, units unknown")
  
}

