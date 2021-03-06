% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate_range_of_stds_of_data.R
\name{generate_range_of_stds_of_data}
\alias{generate_range_of_stds_of_data}
\title{Generate Range of Standard Deviations}
\usage{
generate_range_of_stds_of_data(data, desired_range_of_stds)
}
\arguments{
\item{data}{A integer vector of values}

\item{desired_range_of_stds}{An integer vector; Containing the standard deviations that will be calulated}
}
\value{
range_of_stds_of_data A integer vector. The values of the standard deviation.
}
\description{
The +/- n standard deivations of the input data is calculated
}
\examples{
data <- sin(1:10);
desired_range_of_stds <- -1:1;
range_of_stds_of_data <- generate_range_of_stds_of_data(data,desired_range_of_stds)
}
