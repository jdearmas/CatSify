#' @export create_factor_range_list
create_factor_range_list <- function(nrow_of_data,name)
{
  
  l_factor_range <- list(list(1:nrow_of_data),list("Name" = name))
  return(l_factor_range)
}

