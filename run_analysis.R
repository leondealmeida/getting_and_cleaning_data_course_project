library(data.table)
library(dplyr)

# Returns the file names for the dataset based on choice
# of either train or test, as the folders are named
get_file_names <- function(type) {
    file_templates <- c('subject_', 'y_', 'X_')
    paths <- file.path(type, file_templates)
    suffix <- paste(type, '.txt', sep='')

    paste(paths, suffix, sep='')
}

# Returns a single data.table built from the data available
# on each of the source data files, with
#    variable 1: subject_xxxxx.txt (participant ids)
#    variable 2: y_xxxxx.txt (activity labels)
#    variables 3-563: X_xxxxx.txt (measurements)
# where xxxxx is either 'train' or 'test'
build_dataset_from_files <- function(file_paths) {
    data <- lapply(file_paths, fread, sep=' ')
    do.call(cbind, data)
}

# Extracts the feature labels from the features.txt
# provided with the dataset, and adds the first
# and second column labels as will be added once the train
# and test datasets are merged
get_feature_labels <- function() {
    data <- fread('features.txt', sep=' ')
    c('SubjectId', 'ActivityId', data[[2]])
}

# Keeps variables that have the 'std()' or 'mean()' strings
# on their names (along with the subject id and activity id)
keep_std_and_mean <- function(data) {
    labels <- names(data)
    condition <- (
        grepl('SubjectId', labels) |
        grepl('ActivityId', labels) |
        grepl('std\\(\\)', labels) |
        grepl('mean\\(\\)', labels)
    )
    data[ , condition, with=FALSE]
}

# Extracts the feature labels from the activity_labels.txt
# file and names its variables for easier joining
get_activity_labels <- function() {
    activity_labels <- fread('activity_labels.txt', sep=' ')
    names(activity_labels) <- c('ActivityId', 'ActivityType')
    activity_labels
}

# Transforms the abbreviated form of each measurement into a
# more verbose format
make_descriptive_variable_names <- function(variable_names) {
    chainable_gsub <- function(x, pattern, replacement) {
        gsub(pattern, replacement, x)
    }
    variable_names %>%
        chainable_gsub('^t', 'Time') %>%
        chainable_gsub('^f', 'Frequency') %>%
        chainable_gsub('Acc', 'Accelerometer') %>%
        chainable_gsub('Gyro', 'Gyroscope') %>%
        chainable_gsub('Mag', 'Magnitude') %>%
        chainable_gsub('std', 'StandardDeviation') %>%
        chainable_gsub('mean', 'Mean') %>%
        chainable_gsub('BodyBody', 'Body') %>%
        chainable_gsub('-', '') %>%
        chainable_gsub('\\(\\)', '')
}

# Performs the analysis of the UCI HAR Dataset and returns a tidy
# dataset of averages for measurements on the mean and standard
# deviation for each measurement, aggregated over each subject
# and activity type.
#
# The function call expects the dataset files to be available on
# the R session's working directory.
run_analysis <- function() {
    # Load train dataset
    train_files <- get_file_names('train')
    train <- build_dataset_from_files(train_files)

    # Load test dataset
    test_files <- get_file_names('test')
    test <- build_dataset_from_files(test_files)

    # Merge train and test datasets; apply feature labels
    dataset <- rbind(train, test)
    names(dataset) <- get_feature_labels()

    # Keep only std and mean on measurements
    dataset <- keep_std_and_mean(dataset)

    # Apply human-readable activity labels
    activity_labels <- get_activity_labels()
    dataset <- dataset[activity_labels, on='ActivityId']

    # ActivityType can be transformed into a factor and
    # ActivityId is no longer necessary
    dataset$ActivityType <- as.factor(dataset$ActivityType)
    dataset$ActivityId <- NULL

    # Make variable names descriptive
    names(dataset) <- make_descriptive_variable_names(
        names(dataset))

    # Aggregate by subject id and activity, applying mean to each
    # other variable in the process
    tidy_dataset <- dataset %>%
        group_by(SubjectId, ActivityType) %>%
        summarize_each(funs(mean(.)))

    # Rename variables to make it clear all of the measurements
    # are averaged
    names(tidy_dataset)[-c(1,2)] <- paste(
        'Mean', names(tidy_dataset)[-c(1,2)], sep='')

    # Return the final dataset
    tidy_dataset
}
