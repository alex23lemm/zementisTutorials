# Import data sets which should be made available globally ---------------------

loan_data_raw <- readRDS("./www/loan_data_raw.rds")
#loan_data_raw <- readRDS("./data_science_intro_tutorial/www/loan_data_raw.rds")

# Create machine learning models for "Modeling Data" section -------------------

# We will use 5 bins for emp_length and 5 bins for int_rate
loan_data <- loan_data_raw %>%
  mutate(
    emp_bin = as.character(cut_number(emp_length, 5)),
    int_bin = as.character(cut_number(int_rate, 5))
  ) %>%
  replace_na(list(emp_bin = "Missing", int_bin = "Missing")) %>%
  mutate(
    emp_bin = as.factor(emp_bin),
    int_bin = as.factor(int_bin),
    loan_status = as.factor(loan_status)
  ) %>%
  select(-emp_length, -int_rate)

set.seed(42)
index <- createDataPartition(loan_data$loan_status, p = 0.7, list = FALSE)
training_set <- loan_data[index, ]
test_set <- loan_data[-index, ]

rpart_mod <- partial(rpart, 
                     # Using priors
                     parms = list(prior = c(0.7, 0.3)),
                     control = rpart.control(cp = 0.001))

# Building forest using downsampling
randomForest_mod <- partial(randomForest, 
                            ## Tell randomForest to sample by strata. Here, 
                            ## that means within each class
                            strata = training_set$loan_status,
                            ## Now specify that the number of samples selected
                            ## within each class should be the same
                            sampsize = rep(sum(training_set$loan_status == 1), 2),
                            mtry = 3)

prune_tree <- function(x) {
  cv_error_min <- which.min(x$cptable[, "xerror"])
  cp_min <- x$cptable[cv_error_min, "CP"]
  prune(x, cp_min)
}

my_tree <- rpart_mod(loan_status ~ ., data = training_set) %>% prune_tree
my_forest <- randomForest_mod(loan_status ~ ., data = training_set)

predict_forest <- predict(my_forest, newdata = test_set)
table_forest <- table("Actual values" = test_set$loan_status, 
                      predictions = predict_forest)

rm(loan_data, index, training_set, test_set, predict_forest, 
   rpart_mod, randomForest_mod, prune_tree)
