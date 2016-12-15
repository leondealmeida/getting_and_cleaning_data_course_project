# Getting and Cleaning Data Course Project


## Abstract

The run_analysis.R script provides a function _run_analisys_ that performs the analysis of the UCI HAR Dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. It performs the analysis of the UCI HAR Dataset and returns a tidy
dataset of averages for measurements on the mean and standard
deviation for each measurement, aggregated over each subject
and activity type.


## System and run-time requirements

The function call expects the dataset files to be available on
the R session's working directory, with both name and directory structures unaltered.

The script expects libraries `data.table` and `dplyr` to be installed. It was developed using version 0.5.0 of `dplyr` and 1.9.8 of `data.table`.

It has been tested on OSX 10.11.6, using RStudio 1.0.44.


## Summary: script processing

1. Loads _train_ dataset
2. Loads _test_ dataset
3. Merges _train_ and _test_ datasets; applies feature labels
4. Keeps only standard deviation and means on measurements
5. Applies human-readable activity labels
6. Makes variable names descriptive
7. Aggregates by subject id and activity, applying mean to each other variable in the process
8. Renames variables to make it clear all of the measurements are averaged
9. Returns the final dataset


## Functions defined/used in the script

In the order they are defined:

```
# Returns the file names for the dataset based on choice
# of either train or test, as the folders are named
get_file_names <- function(type)
```

```
# Returns a single data.table built from the data available
# on each of the source data files, with
#    variable 1: subject_xxxxx.txt (participant ids)
#    variable 2: y_xxxxx.txt (activity labels)
#    variables 3-563: X_xxxxx.txt (measurements)
# where xxxxx is either 'train' or 'test'
build_dataset_from_files <- function(file_paths)
```

```
# Extracts the feature labels from the features.txt
# provided with the dataset, and adds the first
# and second column labels as will be added once the train
# and test datasets are merged
get_feature_labels <- function()
```

```
# Keeps variables that have the 'std()' or 'mean()' strings
# on their names (along with the subject id and activity id)
keep_std_and_mean <- function(data)
```

```
# Extracts the feature labels from the activity_labels.txt
# file and names its variables for easier joining
get_activity_labels <- function()
```

```
# Transforms the abbreviated form of each measurement into a
# more verbose format
make_descriptive_variable_names <- function(variable_names)
```

```
# Performs the analysis of the UCI HAR Dataset and returns a tidy
# dataset of averages for measurements on the mean and standard
# deviation for each measurement, aggregated over each subject
# and activity type.
#
# The function call expects the dataset files to be available on
# the R session's working directory.
run_analysis <- function()
```