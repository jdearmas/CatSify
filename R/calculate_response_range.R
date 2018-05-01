#' @export calculate_response_range
calculate_response_range <- function(xdata,x_range,trigger_indices)
{
  # Find Index that closest meets the range requested
  x_min_value <- xdata[trigger_indices[1]] + x_range[1];
  x_max_value <- xdata[trigger_indices[1]] + x_range[2];
  x_min_index <- which.min(abs(xdata-x_min_value));
  x_max_index <- which.min(abs(xdata-x_max_value));
  
  response_range <- seq(x_min_index,x_max_index)
  
  return(response_range)
  
}
