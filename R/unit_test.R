
rm(list=ls())

# dev.off()
bin_file_path     = "Data/Cat_Data.bin";
total_file_length = 1400000;
preview_range     = 1900:2000;
sampling_frequency  = 24000;

# Source all functions in the "R" folder
path <- "~/2018/Spring_2018/Introduction to R/Intro_to_R/Classification_Script/R/";
# path <- "C:Users\John\Documents\2018\Spring_2018\Introduction to R\Intro_to_R\Classification_Script\R"
# path <- "C:\Users\John\Documents\2018\Spring_2018\Introduction to R\Intro_to_R\Classification_Script\R"
for (f in list.files(path,pattern="*.R",full.names = TRUE)) {
  if (f == list.files(path,'unit_test.R',full.names = TRUE))
  {
    x<-1
  }
  else
  {
    source(f)
  }
}


# Import Bin Data
bindata <- import_binary_data_file(bin_file_path,total_file_length)
unit_test_data <- bindata[preview_range];
unit_test_time <- preview_range/sampling_frequency;

# Preview Bin Data
bindata[preview_range]
preview_bin_data(bindata,preview_range)

# Generate Zero Mean Data
zero_mean_bindata <- calculate_zero_mean_bindata(bindata)
bindata <- zero_mean_bindata

# Preview Zero Mean Bin Data
preview_bin_data(zero_mean_bindata,preview_range)

# Generate Range of Standard Deviations
desired_std_range <- -5:5
range_of_std_of_data <- generate_range_of_stds_of_data(bindata,desired_std_range)

# Create Plot Of Standard Deviations with Binary Data Preview
range_of_std_of_data
create_std_plot(preview_range,bindata,desired_std_range,range_of_std_of_data)

# Create Neuron Response Matrix
  #User-Defined Parameters
  extract_trigger <- c(range_of_std_of_data[3],range_of_std_of_data[9])
  x_range <- c(-0.003,0.002);
  index_range <- x_range*sampling_frequency
  
  #Extract Trigger Indices ( Places in the data that go above the STD) 
  trigger_indices <- extract_trigger_indices(unit_test_data,extract_trigger)
  
  #Calculate the range of indices a trigger has to be in for it to be grouped into one response
  trigger_index_range <- calculate_trigger_index_range(x_range,sampling_frequency)
  
  #Extract Initial Triggers
  initial_trigger_indices <- extract_initial_trigger_indices(trigger_index_range,trigger_indices)
    
  #Extract Responses 
  neuron_responses <- extract_responses(unit_test_time,unit_test_data,x_range,initial_trigger_indices )
  plot(neuron_responses)
  # neuron_responses
 
  # Create Neuron Respone Matrix
  m_neuron_responses <- create_neuron_responses_matrix(neuron_responses)
  
  # Append Neuron Respones to Matrix
  m_neuron_responses <- append_neuron_responses_to_matrix(m_neuron_responses,neuron_responses)
  

  
# Create Matrix of 10 Unit Test Responses
  number_of_responses <- 142;
  m_neuron_responses <- create_matrix_of_x_neuron_responses(extract_trigger,bindata,number_of_responses)
  # create_matrix_of_x_neuron_responses <- function(extract_trigger,ydata,number_of_responses)
  
# Extract Noise
  range_initial_trigger_indices <- extract_range_of_initial_trigger_indices(bindata,n=1000,number_of_responses=number_of_responses,trigger_condition = extract_trigger)
  spike_indices <- extract_spike_indices(index_range,range_initial_trigger_indices)
  explorer_bindata <- bindata[1:tail(spike_indices,n=1)]
  noise_data <- explorer_bindata[-spike_indices]
  m_noise_data <- matrix(noise_data,nrow = ncol(m_neuron_responses),ncol = ncol(m_neuron_responses))
 
   
# Feature Engineering
  # Wavelet Transformation
    # Test (Wavelet Transform, Then Plot it)
    test_m_nr <- matrix(m_neuron_responses[2,],nrow=1,byrow=TRUE)
    test_dt <- wavelets::dwt(X = as.numeric(test_m_nr))
    wavelets::plot.dwt(test_dt,levels = 1)
    
    # Test Multiple in one Class
    m_dwt <- create_matrix_of_x_dwt(m_neuron_responses)
    # m_dwt[,4:9] <- m_dwt[,4:9]*100 
    m_noise_dwt <- create_matrix_of_x_dwt(m_noise_data)
    
# Machine Learning
    # Create Test Data Frame of DWT
    # dataset<-data.frame(m_dwt)
    # dataset <-m_dwt
    
    # Create Hype List
      # Create Input for Machine Learning
      ml_input_dataframe <- create_machine_learning_input(m_data = list(m_dwt,m_noise_dwt),m_name = list("Spike","Noise"))
      
    # Partition Data
      # create a list of 80% of the rows in the original dataset we can use for training
      validation_index <- caret::createDataPartition(ml_input_dataframe$Type, p=0.50, list=FALSE)
      # select 20% of the data for validation
      validation <- ml_input_dataframe[-validation_index,]
      # use the remaining 80% of data to training and testing the models
      dataset <- ml_input_dataframe[validation_index,]
      # Display Frequncey 
      percentage <- prop.table(table(dataset$Type)) * 100
      cbind(freq=table(dataset$Type),percentage=percentage)
      
    # 10-fold crossvalidation
      control <- caret::trainControl(method = "cv",number = 10)
      metric <- "Accuracy"
      
    # Build ML Models
      set.seed(7)
      fit.lda <- caret::train(Type~.,data=dataset,method="lda",metric=metric,trControl=control)
      # CART
      set.seed(7)
      fit.cart <- caret::train(Type~.,data=dataset,method="rpart",metric=metric,trControl=control)
      # KNN
      set.seed(7)
      fit.knn <- caret::train(Type~., data=dataset, method="knn", metric=metric, trControl=control)
      # SVM
      set.seed(7)
      fit.svm <- caret::train(Type~., data=dataset, method="svmRadial", metric=metric, trControl=control)
      # Random Forest
      set.seed(7)
      fit.rf <- caret::train(Type~., data=dataset, method="rf", metric=metric, trControl=control)
      
      results <- caret::resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
      summary(results)
      # sum_re <-summary(results)
      # compare accuracy of models
      # caret::dotPlot(results)
      plot(dotplot(results))
      

      predictions <- predict(fit.svm, validation)
      confusionMatrix(predictions, validation$Type)
      # # select 20% of the data for validation
      # eighty_percent<-round(dim(m_neuron_responses)[1]*0.8)
      # validation <- dataset[-seq(1,eighty_percent),]
      # # use the remaining 80% of data to training and testing the models
      # training <- dataset[seq(1,eighty_percent),]
    
    
    
    
  
