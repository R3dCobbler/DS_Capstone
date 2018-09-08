#   03. prediction.R

source("global.R")

profanity_vector <- VectorSource(readLines("data/profanities.txt"))

#   Read all n-grams using fast fread
unigram <- fread("csv/unigram.csv", header = TRUE, stringsAsFactors = FALSE)
bigram <- fread("csv/bigram.csv", header = TRUE,stringsAsFactors = FALSE)
trigram <- fread("csv/trigram.csv", header = TRUE, stringsAsFactors = FALSE)
quadgram <- fread("csv/quadgram.csv", header = TRUE, stringsAsFactors = FALSE)

result <- head(unigram[order(-freq)], 3)[,list(word, freq)]
result <- data.frame(rep("1-gram", nrow(result)),result$word, result$freq/sum(result$freq)*100)
colnames(result) <- c("Ngram", "word", "prob")

#   Create keys on the data table
setkey(unigram,word)
setkeyv(bigram, c("word1"))
setkeyv(trigram, c("word1", "word2"))
setkeyv(quadgram, c("word1", "word2", "word3"))


