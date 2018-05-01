#' @export extract_range_of_initial_trigger_indices
extract_range_of_initial_trigger_indices <- function(ydata,n = 1000,number_of_responses,sampling_frequency = 24000,trigger_condition)
{
  incrementer <- 2000
  
  while(length(initial_trigger_indices) < number_of_responses)
  {
    n<-n+incrementer
    unit_test_data <- ydata[1:n]
    unit_test_time <- (1:n)/sampling_frequency
    
    #Extract Trigger Indices ( Places in the data that go above the STD) 
    trigger_indices <- extract_trigger_indices(unit_test_data,trigger_condition)
    
    #Extract Initial Triggers
    initial_trigger_indices <- extract_initial_trigger_indices(trigger_index_range,trigger_indices)
    
  }
  return(initial_trigger_indices)
}
