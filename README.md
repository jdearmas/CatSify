# CatSify
An R package to Classify Feline Neurological Activity Using Machine Learning
<p align="center">
  <img src="https://github.com/jdearmas/CatSify/blob/master/man/figures/readme_title_image2.PNG" width="550" height="450">
  <img src="https://github.com/jdearmas/CatSify/blob/master/man/figures/readme_title_image.PNG" width="550" height="450">
</p>


## Usage
The R Script **unit_test.R** (*'~/CatSify/R/unit_test.R'*) is a script that runs through the entire package's functions. It is an example script. It performs the:
#### Major Goals of the Package
1. Imports Raw Binary Data
2. Pre-processes the Raw Data
3. Creates Features
4. Formats Features to be sent to the caret machine learning package's functions
5. Outputs the Machine Learning Results
#### Snippet of 'unit_test.R'
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
*Soon*


## Built With
* [Vim](https://www.vim.org/) - The text editor used
* [Wisdow](http://www.google.com) - The search engine used
* [Family](https://stackoverflow.com) - The alt-tab winner
* [Dvorak](https://en.wikipedia.org/wiki/Dvorak_Simplified_Keyboard) - Keyboard


## Authors

* **John De Armas** - *Initial work* - [jdearmas](https://github.com/jdearmas)

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](LICENSE) file for details

## Acknowledgements

Dr. Timothy Fawcett for his guidance and support.

Dr. Alon Friedman for creating an environment that allowed me to create this notebook.

Dr. David Rabson and Dr. Kendall F. Morris from the University of South Floria Department of Molecular Pharmacology and Physiology were kind enough to allow the use and publish of their cat neuron data they collected from experimentation.
