#' @export append_list_of_x_dwt
append_list_of_x_dwt <- function(l_dwt,m_data)
{
  r <- nrow(m_data)
  c <- ncol(m_data)
  n <- length(l_dwt)
  r <- r+n
  
  for (i in n:r)
  {
    l_dwt[[i]] <- as.vector(m_data[i-n,])
  }
  
  
  
  return(l_dwt)
}
