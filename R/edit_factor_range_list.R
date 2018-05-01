#' @export edit_factor_range_list
edit_factor_range_list <- function(l_factor_range,array_of_indices,name)
{
   
  # Range Vectors
  number_of_entries <- length(l_factor_range[[1]]);
  
  # Remove Reduncies
  for (i in array_of_indices)
  {
    for (j in 1:number_of_entries)
    {
      if (any(l_factor_range[[1]][[j]] == i))
      {
        matching_number_index <- which(l_factor_range[[1]][[j]] == i)
        l_factor_range[[1]][[j]] <- l_factor_range[[1]][[j]][-matching_number_index]
      }
    }
  } 
  
  # Append
  l_factor_range[[1]] <- c(list(array_of_indices),l_factor_range[[1]])
                            
  # Factor Name List
  l_factor_range[[2]]$Name <- c(name,l_factor_range[[2]]$Name)
                            

  return(l_factor_range)
}

