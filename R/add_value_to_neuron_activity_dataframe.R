#'@export add_value_to_neuron_activity_dataframe
add_value_to_neuron_activity_dataframe  <- function(nad,col_name,data)
{
  n_rows_nad <- dim(nad);
  nad[n_rows_nad[1],col_name] <- data;
  return(nad)
}
