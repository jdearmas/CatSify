#' @export append_factor_range_list
append_factor_range_list <- function(l_factor_range,nrow_of_data,name)
{
  
  # Range Vectors
  number_of_entries <- length(l_factor_range[[1]]);
  
  last_index <- tail(l_factor_range[[1]][[number_of_entries]],n=1)
  
  new_last_index <- last_index + nrow_of_data
  
  l_factor_range[[1]] <- c(l_factor_range[[1]], list(seq(last_index,new_last_index)))
  
  # Factor Name List
  l_factor_range[[2]]$Name <- c(l_factor_range[[2]]$Name,name)
         
         
  return(l_factor_range)
}

