# activeDir

`activeDir` is an R package that simplifies managing your working directory while working in RStudio. It allows you to quickly set the working directory to either the folder containing the currently open file or one level above it.

## Features

- **Set Working Directory to Current File**: Easily set the working directory to the folder containing the active file in RStudio.
- **Set Working Directory to Parent Folder**: Quickly set the working directory to the parent folder of the current file's directory.

## Installation

To install the `activeDir` package from GitHub, you'll first need to make sure that you have the `devtools` package installed:

```r
install.packages("devtools")
```
Next, install the activeDir package directly from GitHub:

```r
devtools::install_github("manilpit/activeDir")
```

Usage
Once installed, you can use activeDir to set your working directory easily.

Set Working Directory to Current File's Directory
```r
library(activeDir)

# Set the working directory to the directory of the currently active file in RStudio
set_wd_to_current()
```
This will set the working directory to the folder where the currently open file is located.

Set Working Directory to One Level Above the Current File's Directory
```r
library(activeDir)

# Set the working directory to one level above the directory of the currently active file in RStudio
set_wd_to_above()
```
This is useful when you want to reference files in the parent folder of your script's directory.

Example Workflow
Let's say you have a project with the following structure:

```kotlin
MyProject/
├── analysis/
│   └── script.R
└── data/
    └── dataset.csv
```

If you open script.R in RStudio and run set_wd_to_current(), the working directory will be set to the analysis/ folder.

If you run set_wd_to_above(), the working directory will be set to the MyProject/ folder, allowing you to easily reference files in both the analysis/ and data/ folders.

Contributing
Contributions are welcome! Feel free to submit issues or pull requests if you have suggestions for improvements.

License
This project is licensed under the MIT License - see the LICENSE file for details.

