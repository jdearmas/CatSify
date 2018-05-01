#' @title Generate Range of Standard Deviations
#' @description The +/- n standard deivations of the input data is calculated 
#' @param data A integer vector of values
#' @param desired_range_of_stds An integer vector; Containing the standard deviations that will be calulated
#' @return range_of_stds_of_data A integer vector. The values of the standard deviation.
#' @examples
#' data <- sin(1:10);
#' desired_range_of_stds <- -1:1;
#' range_of_stds_of_data <- generate_range_of_stds_of_data(data,desired_range_of_stds)
#' @export generate_range_of_stds_of_data
generate_range_of_stds_of_data <- function(data,desired_range_of_stds)
{
  #Calculate Standard Deviation of Data
  std_of_data <- sd(data)
  
  # Creating a range of standard deviations
  range_of_stds_of_data <- std_of_data*desired_range_of_stds;
  
  # Return Range of Standard Deviations of the Inputed Data
  return(range_of_stds_of_data)
}
