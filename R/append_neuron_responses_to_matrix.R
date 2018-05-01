#' @export append_neuron_responses_to_matrix
append_neuron_responses_to_matrix <- function(m_nr,data)
{
  if (is.matrix(data))
  {
    m_nr <- rbind(m_nr,data)
  }
  else
  {
    temp_data <- matrix(data,nrow=1,byrow=TRUE)
    m_nr <- rbind(m_nr,temp_data)
  }
  
  return(m_nr)
}

