#' @title Calculate Trigger Index Range 
#' @description A single spike will have mulitple triggers. Only a trigger point in needed. The other triggers within a certain range of the initial trigger can be 
#' discarded. This function calculates the range in which triggers will be discarded
#
#' @param x_range A integer vector that contains the upper and lower x-axis data limits that will c 
#' @param sampling_frequency A double that represents the frequency the neuron data was sampled at.
#'
#' @return A integer vector that contains the trigger index ranges 
#' @examples
#' x_range <-c(-3,2)
#' sampling_frequency <- 10
#' trigger_index_range <- calculate_trigger_index_range(x_range,sampling_frequency)
#'
#' @export calculate_trigger_index_range
calculate_trigger_index_range <- function(x_range,sampling_frequency)
{
  calculate_trigger_index_range <- abs(x_range)*sampling_frequency;
  
  return(calculate_trigger_index_range)
}
