#' @title Extract Initial Trigger Indices
#' @description The trigger indices obtained by \strong{extract_trigger_indices} 
#' contains every value on the spike that met or surpassed the trigger condition.
#' Only the first trigger index of each response matters.
#' 
#' @param trigger_index_range A integer vector; Represents the range of trigger indices 
#' from the first that will be grouped into one response
#' @param trigger_indices An integer vector; All the indices of the neuron data that met or surpassed the trigger condition.
#' @return An integer vector; An array of the indices of first value of each response
#' @examples
#' trigger_index_range <- c(-2,2)
#' trigger_indices <- c(10,11,13,14,16)
#' initial_trigger_indices  <- extract_initial_trigger_indices(trigger_index_range,trigger_indices)
#' @export extract_initial_trigger_indices
extract_initial_trigger_indices <- function(trigger_index_range,trigger_indices)
{
  initial_trigger_indices <- vector();
  
  initial_trigger_indices <-trigger_indices[1];
  
  total_index <- 1;
 
  size_of_trigger_indices <- length(trigger_indices)
   
  RHSL = trigger_index_range[2]; 
  
  while(TRUE)
  {
    
    trigger_index_limit = trigger_indices[total_index] + RHSL;
    
    end_index <- (RHSL*2)+total_index;
    
    logical_size <- end_index > total_index
    
    if (is.na(logical_size) == FALSE)
    {
      if (logical_size)
      {
      end_index <- length(trigger_indices)
      }
      if (end_index == total_index)
      {
        return(initial_trigger_indices)
      }
    }
    
    if (is.na(total_index))
    {
      return(initial_trigger_indices)
      total_index <-1
    }
    
    if (is.na(end_index))
    {
      return(initial_trigger_indices)
      end_index <-total_index
    }
    
    truncated_trigger_indices <- trigger_indices[total_index:end_index]
    
    diff_trigger_indices <- truncated_trigger_indices - trigger_index_limit
    
    logical_cutting_index_array <- diff_trigger_indices >= 0
    
    if (((any(logical_cutting_index_array) != TRUE) | is.na(any(logical_cutting_index_array))) & (total_index != 1))
    {
      # initial_trigger_indices <- c(initial_trigger_indices,trigger_indices[total_index])
      return(initial_trigger_indices)
    }
    
    index_of_next_spike <- which(logical_cutting_index_array)
    
    total_index <- total_index + index_of_next_spike[1] -1;
    
    initial_trigger_indices <- c(initial_trigger_indices,trigger_indices[total_index])
    
  }
}
trigger_index_range <- c(-2,2)
trigger_indices <- c(10,11,13,14,16)
initial_trigger_indices  <- extract_initial_trigger_indices(trigger_index_range,trigger_indices)
