# Code Book

This Code Book contains all the steps and definitions necessary to perform the cleaning and structuring of data of the study called "Human Activity Recognition Using Smartphones", to approve the degree of "Getting and Cleaning Data Course"

## Data Set Definition

The description of the activities carried out in this study are detailed in the document `activity_labels.txt`.

The identification of the subjects with whom the study was conducted are detailed in `subject_test.txt`.


## Activities evaluated

*1.- `WALKING`
* 2.- `WALKING_UPSTAIRS`
* 3.- `WALKING_DOWNSTAIRS`
* 4.- `SITTING`
* 5.- `STANDING`
* 6.- `LAYING`

## Variables

###  Data from the downloaded files

* `dat_xtest`: Contains recorded features train data 
* `dat_xtrain`: Contains train data of activities’code labels
* `dat_ytest`: Contains recorded features test data
* `dat_ytrain`: Contains test data of activities code labels
* `dat_subtrain`: Contains train data of 24/30 volunteer subjects being observed
* `dat_subtest`: Contains test data of 9/30 volunteer test subjects being observed

## Merge Data


* `X_Data`: Is created by merging dat_xtrain and dat_xtest
* `Y_Data`: Is created by merging dat_ytrain and dat_ytest


## Cleaning Data

* Activity codes were replaced with the correct names and more proper names were assigned to the columns to make them more descriptive.
* Only the "Mean" and "Standard Deviation" metrics were used.
* The average of these two metrics was obtained for each series of observations.

## Generated Final Data

* As a final step, the `AnalizeData.txt` file containing the structured and clean data was generated to be used.