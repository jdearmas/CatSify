# CatSify
An R package to Classify Feline Neurological Activity Using Machine Learning
<p align="center">
  <img src="https://github.com/jdearmas/CatSify/blob/master/man/figures/readme_title_image2.PNG" width="450" height="350">
  <img src="https://github.com/jdearmas/CatSify/blob/master/man/figures/readme_title_image.PNG" width="450" height="350">
</p>


## Usage
```R
# Import and Preview Binary Cat Brain Data
bindata         <-CatSify::import_binary_data_file("Data/Cat_Data.bin")
preview_range   <-1900:2000
preview_bin_data(bindata,preview_range)

# Generate and Preview Range of Standard Deviations
desired_std_range     <- -5:5
range_of_std_of_data  <- CatSify::generate_range_of_stds_of_data(bindata,desired_std_range)
create_std_plot(preview_range,bindata,desired_std_range,range_of_std_of_data)

```


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
High-Level:
  R (>= 3.4.0)
  RStudio
R Packages:
  caret
  wavelet
  e1071
  randomForest
```

### Installing

A step by step series of examples that tell you have to get a development env running

#### 1. Recommended (RStudio & Git Bash Command-line)

  *Git Bash Command-line*
```
mkdir ~/CatSify
git init
git clone https://github.com/jdearmas/CatSify.git
```
  *RStudio*
```
install.packages("~/CatSify/CatSify_0.1.tar.gz", repos = NULL, type = "source")
```

#### 2. RStudio

```
install.packages("devtools")
library(devtools)
install_github("jdearmas/CatSify")
```

#### 3. Git Bash Command-line

```
mkdir CatSify
git init
git clone https://github.com/jdearmas/CatSify.git
```

#### Demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc
