#' @title Extract Trigger Indices
#' @description The data is reviewed and if it activites the trigger condition, the index of the data that caused the trigger is recorded.
#' @param data A integer vector of data values
#' @param trigger_condition An integer vector that represent the condition that must be meet in order for the trigger indices to be recorded.
#' @return trigger_indices An integer vector of indices of the \strong{data} that met or surpassed the \strong{trigger condition}
#' @examples
#' data <- sin(seq(1,pi,100));
#' trigger_condition <- c(1,3);
#' trigger_indices <- trigger_condition_indices(data,trigger_condition) 
#' @export extract_trigger_indices
extract_trigger_indices <- function(data,trigger_condition)
{
  # Generate Vector of Indices That Point To Places in data that
  # triggered the trigger_condition
  trigger_indices <- which(data >= trigger_condition[2] | data <= trigger_condition[1])
  
  # Output
  return(trigger_indices)
}
