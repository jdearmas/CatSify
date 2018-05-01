#' @export create_list_of_x_factors_from_ranges
create_list_of_x_factors_from_ranges <- function(l_factor_range)
{
  
  # Find Total Length of New Factor List
  number_of_entries <- length(l_factor_range[[1]])
  last_index <- tail(l_factor_range[[1]][[number_of_entries]], n=1)
  
  l_factors <- replicate(last_index,"Place-holder")
  
  # Extract Data From l_factor_range
  for (i in 1:number_of_entries)
  {
    l_factors[l_factor_range[[1]][[i]]] <- l_factor_range[[2]][[1]][[i]]	
  }
  
  return(l_factors)
}
