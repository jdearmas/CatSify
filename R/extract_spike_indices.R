#' @export extract_spike_indices
extract_spike_indices <- function(index_range,range_initial_trigger_indices)
{
  
  for (i in 1:length(range_initial_trigger_indices))
  {
    upper <- range_initial_trigger_indices[i] + index_range[2]
    lower <- range_initial_trigger_indices[i] + index_range[1]
    if (i==1)
    {
      spike_indices <- seq(lower,upper)
    }
    else
    {
      spike_indices <- c(spike_indices,seq(lower,upper))
    }
  }
  
  return(spike_indices)
}
