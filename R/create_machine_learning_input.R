#' @export create_machine_learning_input
create_machine_learning_input <- function(m_data,m_name)
{
  l_dwt <- create_list_of_x_dwt(m_data[[1]])
  l_dwt <- append_list_of_x_dwt(l_dwt,m_data[[2]])
  # Range of Factors List of DWTs
  l_factor_range <- create_factor_range_list(nrow_of_data = nrow(m_data[[1]]),name = m_name[[1]])
  l_factor_range <- append_factor_range_list(l_factor_range,nrow(m_data[[2]]),name=m_name[[2]])
  
  # Hard Coded Values For Testing
  array_of_index_of_other <- c(8,9,10,14,19,20)
  l_factor_range <- edit_factor_range_list(l_factor_range,array_of_index_of_other,name = "Other")
  
  
  # Create Factor List of Categories of Activity
  l_factors <- create_list_of_x_factors_from_ranges(l_factor_range)
  
  ml_input_dataframe <- data.frame("Wavelet" = rbind(m_data[[1]],m_data[[2]]),"Type" = l_factors)
  
  return(ml_input_dataframe)
}
