# SamsungData
Repo for the Getting and Cleaning Data Course Project

# Files
-CodeBook.md - the codebook for the output data and the tidied raw data.
-README.md - this file - an overview of the repository contents.
-run_analysis.R - an R source file that contains methods for tidying the input accelerometer data and creating the output data set for the project.


# Quick Start
To create the output data set, run the following in R:
```
    source("run_analysis.R")
    tidyData <- getTidyData()
    outputDataSet <- createOutputDataSet(tidyData)
```

# Data License
Use of the underlying dataset in publications must be acknowledged by referencing the following publication [1]


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
