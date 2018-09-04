## Capstone Project - Milestone Report

## General steps in this process   
# 1. Summarize the objective,
# 2. Describe the inputs and outputs,
# 3. Generate a list of working assumptions to guide subsequent design decisions,
# 4. Use information from the preceding steps to develop a design, and
# 5. Develop the function prototype, coding the design steps as comments into the function prototype.

# Once you decide how to clean and tokenize the corpus 
# (e.g. do you break it into sentences? how do you handle stop words? etc.), 
# you can proceed directly to build various sizes of n-grams with the tokens_ngrams() function.

# The general process is:

#   Load data from text files
#   Summarise data
#   Create a sample set
#   Generate corpus
#   Clean / transform the corpus
#   Generate n-grams & write to output files
#   Aggregate n-gram files to get frequencies by n-gram
#   Break n-grams into "base" and "prediction"
#   At this point you have the inputs you need for a prediction algorithm.

## Task 0 - Understanding the Problem
# Obtaining the data - Can you download the data and load/manipulate it in R?
# Familiarizing yourself with NLP and text mining 
# Learn about the basics of natural language processing and how it relates to the data science process you have learned in the Data Science Specialization.

# Questions to consider

# What do the data look like?
# Where do the data come from?
# Can you think of any other data sources that might help you in this project?
# What are the common steps in natural language processing?
# What are some common issues in the analysis of text data?
# What is the relationship between NLP and the concepts you have learned in the Specialization?

## Task 1 - Getting and cleaning the data

# Tokenization - identifying appropriate tokens such as words, punctuation, and numbers. Writing a function that takes a file as input and returns a tokenized version of it.
# Profanity filtering - removing profanity and other words you do not want to predict.
# Take the file and return a tokenized version of it.


## Task 2 - Exploratory Data Analysis

# Exploratory analysis - perform a thorough exploratory analysis of the data, understanding the distribution of words and relationship between the words in the corpora.
# Understand frequencies of words and word pairs - build figures and tables to understand variation in the frequencies of words and word pairs in the data.

# Questions to consider

# Some words are more frequent than others - what are the distributions of word frequencies?
# What are the frequencies of 2-grams and 3-grams in the dataset?
# How many unique words do you need in a frequency sorted dictionary to cover 50% of all word instances in the language? 90%?
# How do you evaluate how many of the words come from foreign languages?
# Can you think of a way to increase the coverage -- identifying words that may not be in the corpora or using a smaller number of words in the dictionary to cover the same number of phrases?


## Task 3 - Modeling (not needed for the Milestone Report, but will be necessary for the final project submission)

# Build basic n-gram model - using the exploratory analysis you performed, build a basic n-gram model for predicting the next word based on the previous 1, 2, or 3 words.
# Build a model to handle unseen n-grams - in some cases people will want to type a combination of words that does not appear in the corpora. Build a model to handle cases where a particular n-gram isn't observed.

# Questions to consider

# How can you efficiently store an n-gram model (think Markov Chains)?
# How can you use the knowledge about word frequencies to make your model smaller and more efficient?
# How many parameters do you need (i.e. how big is n in your n-gram model)?
# Can you think of simple ways to "smooth" the probabilities (think about giving all n-grams a non-zero probability even if they aren't observed in the data) ?
# How do you evaluate whether your model is any good?
# How can you use backoff models to estimate the probability of unobserved n-grams?

## Task 4 - Prediction Model

# Build a predictive model based on the previous data modeling steps - you may combine the models in any way you think is appropriate.
# Evaluate the model for efficiency and accuracy - use timing software to evaluate the computational complexity of your model. 
# Evaluate the model accuracy using different metrics like perplexity, accuracy at the first word, second word, and third word.

# Questions to consider

# How does the model perform for different choices of the parameters and size of the model?
# How much does the model slow down for the performance you gain?
# Does perplexity correlate with the other measures of accuracy?
# Can you reduce the size of the model (number of parameters) without reducing performance?

## Task 5 - Creative Exploration

# Explore new models and data to improve your predictive model.
# Evaluate your new predictions on both accuracy and efficiency.

# Questions to consider

# What are some alternative data sets you could consider using?
# What are ways in which the n-gram model may be inefficient?
# What are the most commonly missed n-grams? Can you think of a reason why they would be missed and fix that?
# What are some other things that other people have tried to improve their model?
# Can you estimate how uncertain you are about the words you are predicting?

## Task 6 - Data Product

# Create a data product to show off your prediction algorithm 
# You should create a Shiny app that accepts an n-gram and predicts the next word.

# Questions to consider

# What are the most interesting ways you could show off your algorithm?
# Are there any data visualizations you think might be helpful (look at the Swiftkey data dashboard if you have it loaded on your phone)?
# How should you document the use of your data product (separately from how you created it) so that others can rapidly deploy your algorithm?

# Tips, tricks, and hints

# Consider the size of the predictive model you have developed. 
# You may have to sacrifice some accuracy to have a fast enough/small enough model to load into Shiny.
