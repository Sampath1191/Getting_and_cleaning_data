# Getting_and_cleaning_data #
This repository contains my Course project work for Getting and Cleaning data

## Purpose ##
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
1) a tidy data set as described below
2) a link to a Github repository with your script for performing the analysis
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.



## PROJECT ##
* Loads the required datasets from the downloaded folder in your system
* Extract labels from the features dataset which have data related to mean and std
* Extract activity dataset
* Load train and test datasets, selecting columns which have data related to mean and std
* Add the columns that have subjects and activities to the train and test datasets
* Merge the train and test sets
* Melt and dcast the merged dataset to obtain summary statistics
* Tidy dataset is available in tidy_data.txt file
