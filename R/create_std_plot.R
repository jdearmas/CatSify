#' @title Create Plot of Standard Deviations of Data
#' @description Create a plot with horizontal lines that represent the standard deviations 
#
#' 
#' @param xdata_range An integer vector of the X-axis values 
#' @param ydata An integer vector of the Y-axis values
#' @param desired_std_range An integer vector of the range of standard deviations that wish to be displayed
#' @param range_of_std_of_data An integer vector that contains the values of each standard deviation range    
#' @return A line plot with horizontal standard deviation lines
#' @examples 
#' xdata_range <- 1:100
#' ydata <- sin(xdata_range)
#' desired_std_range <- -1:1
#' range_of_std_of_data <- c(-0.5,0,0.5)
#' create_std_plot(xdata_range,ydata,desired_std_range,range_of_std_of_data)
#' ![](create_std_plot_example.png "Example Plot Title")
#' if{html}{figure{create_std_plot_example.png}{options: width="60%" alt="Figure: workspace_id.png"}}
#' @export create_std_plot
create_std_plot <- function(xdata_range,ydata,desired_std_range,range_of_std_of_data)
{
 
  # Create Plot
  # Color Scheme 
  color_scheme = 1:length(desired_std_range);
  # Create X Data Limits
  #	xdata_range_limits <-range(xdata)
  #	xdata_range <-xdata_range_limits[1]:xdata_range_limits[2]
  preview_bin_data(ydata,xdata_range)
  #	plot(data)
  # Generate X and Y Data that will be added to the plot that
  # represents the standard deviations
  abline(h=range_of_std_of_data,col = color_scheme)
  
  # Create Legend
  # Create Legend Labels
  legend_labels <- paste("STD",desired_std_range);
  # Legend Placement
  legend_placement <- 'topleft';
  # Legend Creation
  legend(legend_placement,legend = legend_labels,col=color_scheme,pch=1)
  
}
