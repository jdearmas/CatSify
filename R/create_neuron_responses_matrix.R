#' @export
create_neuron_responses_matrix <- function(neuron_responses)
{
  m_neuron_responses <- matrix(neuron_responses,nrow=1,byrow=TRUE)
  return(m_neuron_responses)
}
