#' @export create_matrix_of_x_neuron_responses
create_matrix_of_x_neuron_responses <- function(extract_trigger,ydata,number_of_responses)
{
  
  
  #User-Defined Parameters
  n <- 1000;
  x_range <- c(-0.003,0.002);
  incrementer <- 2000;
  sampling_frequency = 24000;
  initial_trigger_indices <- 0;
  
   
  # Start of Loop
  while(length(initial_trigger_indices) < number_of_responses)
  {
    n<-n+incrementer
    unit_test_data <- ydata[1:n]
    unit_test_time <- (1:n)/sampling_frequency
    
    #Extract Trigger Indices ( Places in the data that go above the STD) 
    trigger_indices <- extract_trigger_indices(unit_test_data,extract_trigger)
    
    #Extract Initial Triggers
    initial_trigger_indices <- extract_initial_trigger_indices(trigger_index_range,trigger_indices)
  }
  
  #Extract Responses 
  for (i in 1:length(initial_trigger_indices))
  {
    neuron_responses <- extract_responses(unit_test_time,
                                          unit_test_data,
                                          x_range,
                                          initial_trigger_indices[i] )
    
    if (i == 1) 
    {
      # Create Neuron Respone Matrix
      m_neuron_responses <- create_neuron_responses_matrix(neuron_responses)
    }
    
    # Append Neuron Respones to Matrix
    m_neuron_responses <- append_neuron_responses_to_matrix(m_neuron_responses,neuron_responses)
  }
  
  return(m_neuron_responses)
  
}

