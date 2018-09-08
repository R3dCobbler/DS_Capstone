#   01. data_processing.R

#-------------------Load libraries for text analysis---------------------------------

library(quanteda)
library(readtext)
library(stringi)
library(utils)
library(tm)
library(ANLP)
library(RWeka)
library(dplyr)
library(tidyr)
library(ggplot2)


source("global.R")

#--------------------Load data from text files------------------------------------------------

#   Create folder for all the data
if (!file.exists("./data")) {  
    dir.create("data")   
}

#   Download the data
if(!file.exists("Coursera-SwiftKey.zip")){
    download.file("https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip", "Coursera-SwiftKey.zip")
    unzip("Coursera-SwiftKey.zip")
}
filenames <- DirSource("data/final/en_US/")
filenames <- filenames$filelist

#   Read and store file contents 
all_f <- readfiles()

#   Profanity filter reference: https://www.freewebheaders.com/full-list-of-bad-words-banned-by-google/
if (!file.exists("./data/profanities.txt")) {
    download.file("https://www.freewebheaders.com/full-list-of-bad-words-banned-by-google/",
                  destfile = "profanities.txt")
}     
profanity <- readLines("./data/profanities.txt", encoding = "UTF-8")

#   Save single R objects to a file 
if (!file.exists("./data/rds")) {  
    dir.create("data/rds")   
}

saveRDS(all_f, file = "data/rds/all_raw.rds")

#   Read back RDS files
all_f <- readRDS("data/rds/all_raw.rds")


#------------------------Create a sample data set---------------------------------------------

#   This is a very large dataset and needs extreme computing power. 

#   Create sample data set
sample_size <- 0.1    # Use 10% of the total as a sample
sample <- sampleTextData(all_f,sample_size)

#   Save to file
saveRDS(sample, file = "data/rds/all_sample.rds")

#   Read back RDS files
sample <- readRDS("data/rds/all_sample.rds")


#------------------------Create training data set---------------------------------------------

#   Set up the data for training set
trainVal <- 0.7
set.seed(091996)  

#   Split data into training and test sets
all_rows <- length(sample)*trainVal
all_train <- sample[1:all_rows]
all_test <- sample[all_rows + 1:length(sample)]

#   Save training and test sets 
saveRDS(all_train, file = "data/rds/all_train_sample.rds")
saveRDS(all_test, file = "data/rds/all_test_sample.rds")

#   Read back training sets from RDS files
all_train <- readRDS("data/rds/all_train_sample.rds")

#   Rename sets using training data only
f <- all_train

#   Clear the workspace
rm(all_train, all_test, all_rows, all_f, sample)






