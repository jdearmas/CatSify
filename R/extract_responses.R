#' @title Extract Responses
#' @description The neuron responses in the binary data are extracted and recorded
#' @param xdata An integer vector; The time values of the 
#' @param ydata An integer vector; The values of the neuron data
#' @param x_range An integer vector; The range of time from the trigger point that defines the start and end of the response
#' @param  trigger_indices An integer vector; The points in time that the neuron data hits the trigger conditions
#' @return An integer vector; A neuron response
#' @examples
#' bindata <- import_binary_data_file('Data/Cat_Data.bin',total_file_length = 10)
#' time <- time(bindata)
#' x_range <- c(-1,1)
#' trigger_indices <- 5
#' neuron_response <- extract_responses(time,bindata,x_range,trigger_indices)
#' @export extract_responses
extract_responses <- function(xdata,ydata,x_range,trigger_indices)
{
  # Find Index that closest meets the range requested
  x_min_value <- xdata[trigger_indices[1]] + x_range[1];
  x_max_value <- xdata[trigger_indices[1]] + x_range[2];
  x_min_index <- which.min(abs(xdata-x_min_value));
  x_max_index <- which.min(abs(xdata-x_max_value));
  
  # Create Response Snip
  x_min_index
  extract_responses <- ydata[x_min_index:x_max_index]
  # extract_responses <- ydata
  
  # Return Extracted Responses
  return(extract_responses)  
}
