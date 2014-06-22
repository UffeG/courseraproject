---
title: "README"
output: html_document
---

# Coursera - Course Project Getting and Cleaning Data

## Source Data
Source data for this project can be found at, 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## Assumptions
* R-script assumes that the files are unzipped directly to ./Data/
* Only measurements on the mean and standard deviation for each measure are of interest. These have been identified by variable name having ..mean() or ..std() in its name.
* Measures for meanFreq have been excluded.

## Additional R packages
R-script utilizes reshape2

## Process
1. Load data from files for features and activity labels
2. Load test data from files
3. Load training data from files
4. Concatenate rows (with data) from Training and Test files into a single data set
5. Add columns names for the measures
6. Extract required columns (mean and std cols) from data set
7. Add columns for subject id and activity id
8. Merge to get descriptive Activity labels
9. Perform the summarization of the new data set by creating a wide data set

## Final Data Set
The final data set is a tidy data set by being compliant with priciples outlined in the paper of Hadley Wickham, http://vita.had.co.nz/papers/tidy-data.pdf
* Each variable you measure should be in one column
* Each different observation of that variable should be in a different row
* There should be one table for each "kind" of variable
* If you have multiple tables, they should include a column in the table that allows them to be linked

I have chosen a Wide format for the Data Set.

## Importing data set
Data Set can be imported with read.csv with no additional parameters.

