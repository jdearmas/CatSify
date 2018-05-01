#' @export create_list_of_x_dwt
create_list_of_x_dwt <-function(m_dwt)
{
  r <- nrow(m_dwt)
  c <- ncol(m_dwt)
  
  for (i in 1:r)
  {
    if (i==1)
    {
      l_dwt <- list(m_dwt[i,])	
    }
    else
    {
      l_dwt[[i]] <- as.vector(m_dwt[i,])
    }
    
    
  }
  
  return(l_dwt)
}
