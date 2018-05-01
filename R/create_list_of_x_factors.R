#' @export create_list_of_x_factors
create_list_of_x_factors <- function(nrows_m_dwt,noise_indices)
{
  l_factors <-replicate(nrows_m_dwt,"Spike")
  l_factors[noise_indices] <- "Noise"
  l_factors <- factor(l_factors)
  return(l_factors)
}
