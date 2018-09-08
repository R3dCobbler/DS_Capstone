#   02. modelling.R

source("global.R")

#------------------------Fix memory------------------------------------------------------------

# Increase memory as Building model with large dataset required high memory
# Default memory is 512 MB so upgrading it io 2GB
options( java.parameters = "-Xmx5g" )

#------------------------Cleaning the data and create Ngrams-----------------------------------

#   Create new folder
if (!file.exists("./csv")) {  
    dir.create("csv")   
}

f <- cleanTextData(f) # this process takes quite a long time

#   Unigram
unigram <- createNgram(1, f)
unigram <- unigram[order(unigram$word),]
write.csv(unigram, "csv/unigram.csv", row.names = FALSE)

#   Bigram
bigram <- createNgram(2, f)
bigram <- bigram[order(bigram$word),]
bigram <- splitwords(bigram)
bigram <- data.frame(word1 = bigram$word$X1, word2 = bigram$word$X2, freq = bigram$freq, stringsAsFactors = FALSE)
write.csv(bigram, "csv/bigram.csv", row.names = FALSE)

#   Trigram
trigram <- createNgram(3, f)
trigram <- trigram[order(trigram$word),]
trigram <- splitwords(trigram)
trigram <- data.frame(word1 = trigram$word$X1, word2 = trigram$word$X2, word3 = trigram$word$X3, freq = trigram$freq, stringsAsFactors = FALSE)
write.csv(trigram, "csv/trigram.csv", row.names = FALSE)

#   Quadgram
quadgram <- createNgram(4, f)
quadgram <- quadgram[order(quadgram$word),]
quadgram <- splitwords(quadgram)
quadgram <- data.frame(word1 = quadgram$word$X1, word2 = quadgram$word$X2, word3 = quadgram$word$X3, word4 = quadgram$word$X4, freq = quadgram$freq, stringsAsFactors = FALSE)
write.csv(quadgram, "csv/quadgram.csv", row.names = FALSE)












