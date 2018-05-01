#' @export create_matrix_of_x_dwt
create_matrix_of_x_dwt <- function(m_neuron_responses)
{
  
  
  for (i in 1:nrow(m_neuron_responses))
  {
    test_m_nr <- matrix(m_neuron_responses[i,],nrow=1,byrow=TRUE)
    test_dt <- wavelets::dwt(X = as.numeric(test_m_nr))
    if (i==1)
    {
      m_dwt <- matrix(test_dt@W[['W3']],nrow = 1,byrow = TRUE)
    }
    
    temp_data <- matrix(test_dt@W[['W3']],nrow = 1,byrow = TRUE)
    m_dwt <- rbind(m_dwt,temp_data)
  }
  
  return(m_dwt)
}

