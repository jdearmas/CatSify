#' Import a binary data file 
#' 
#' More Details
#' @param bin_file_path A character value that contains the full path to the binary data file one wishes to import
#' @param total_file_lenght A double that represents the number of values you from the binray data file you wish to import
#' 
#' @examples 
#' bin_file_path <- "C:/Users/John/Data.bin"
#' total_file_length <- 10
#' bindata <- import_binary_data_file(bin_file_path,total_file_length) 
#' @export import_binary_data_file
import_binary_data_file <- function(bin_file_path,total_file_length)
  {
  # total_file_length = tfl
  # tfl = 1400000;
  
  # Create Connection Object
  read.filename <- file(bin_file_path, "rb")
  
  # Print Snippet of Binary Data
  bindata <- readBin(read.filename, integer(),  n = total_file_length, size = 2)
  
  # Return Bin Data Value 
  return(bindata)
}

