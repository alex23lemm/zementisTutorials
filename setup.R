# Install packages used in the exercises
install.packages(c("httr", "ggplot2", "purrr", "dplyr", "tidyr", 
                   "randomForest", "rpart", "rpart.plot", "caret", "XML", "pmml",
                   "jsonlite"))

# Install tutor package from GitHub and necessary dependencies
install.packages("devtools")
install.packages(c("backports", "httpuv", "xtable"))
devtools::install_github("rstudio/rtutor")
