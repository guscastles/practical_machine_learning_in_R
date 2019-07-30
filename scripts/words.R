text <- "Dear Jeff,\nCan you send me your address so I can send you the invitation?\nThanks,\nBen"
text_list <- strsplit(text, ' |\n')

df <- as.data.frame(text_list)
words_freq <- count(df)
colnames(words_freq) <- c('Words', 'Frequency')
sorted_freq <- words_freq[order(-words_freq$Frequency), c('Frequency', 'Words')]

freq_you <- sorted_freq[sorted_freq$Words == 'you', 'Frequency']
round(freq_you / sum(sorted_freq$Frequency), 3)