#' @export create_neuron_activity_dataframe
create_neuron_activity_dataframe <- function(colnames)
{
  neuron_activity <- data.frame(t(numeric(length(colnames))));
  colnames(neuron_activity) <- colnames;
  return(neuron_activity)
}
