# Installing and loading the packages ----------------------------------------------------------------------

install.packages("rtweet")
install.packages("tidyr")
install.packages("tidytext")
install.packages("wordcloud")
install.packages("tm")
install.packages("syuzhet")


library(dplyr)
library(ggplot2)
library(tidyverse)
library(rtweet)
library(tidyr)
library(tidytext)
library(wordcloud)
library(tm)
library(syuzhet)


# Downloading the tweets -----------------------------------------------------------------------------------


# Downloading the 100 most recent Bernie Sanders's tweets

bernie <- get_timelines(
  "BernieSanders",
  n = 100)

# Cleaning up the tweets -------------------------------------------------------------------------------------

# Removing retweets
bernie_organic <- bernie[bernie$is_retweet==FALSE, ] 

# Removing replies
bernie_organic <- subset(bernie_organic, is.na(bernie_organic$reply_to_status_id)) 


# Showing the ratio of replies/retweets/organic tweets -----------------------------------------------------------

# Keeping only the retweets
bernie_retweets <- bernie[bernie$is_retweet==TRUE,]

# Keeping only the replies
bernie_replies <- subset(bernie, !is.na(bernie$reply_to_status_id))


# Creating a data frame containing the distribution of organic tweets, retweets, and replies
bernie_data <- data.frame(
  category=c("organic tweets", "retweets", "replies"),
  count=c(84, 16, 0)
)

# Visualising the distribution of organic tweets, retweets, and replies

# Adding columns 
bernie_data$fraction = bernie_data$count / sum(bernie_data$count)
bernie_data$percentage = bernie_data$count / sum(bernie_data$count) * 100
bernie_data$ymax = cumsum(bernie_data$fraction)
bernie_data$ymin = c(0, head(bernie_data$ymax, n=-1))

# Adding a legend
Type_of_Tweet <- paste(bernie_data$category, bernie_data$percentage, "%")

# 
ggplot(bernie_data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=Type_of_Tweet)) +
  geom_rect() +
  coord_polar(theta="y") + 
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "right")


# Cleaning the text ----------------------------------------------------------------------------------------

# Removing http elements 
bernie_organic$text <-  gsub("https\\S*", "", bernie_organic$text)

# Removing @ mentions 
bernie_organic$text <-  gsub("@\\S*", "", bernie_organic$text) 

# Removing "amp"
bernie_organic$text <-  gsub("amp", "", bernie_organic$text) 

# Removing "[\r\n]"
bernie_organic$text <-  gsub("[\r\n]", "", bernie_organic$text)

# Removing punctuation 
bernie_organic$text <-  gsub("[[:punct:]]", "", bernie_organic$text)

# Removing "caign"
bernie_organic$text <-  gsub("caign", "", bernie_organic$text)

# Removing "hshire"
bernie_organic$text <-  gsub("hshire", "", bernie_organic$text)

# Somehow, I can't manage to remove these hshire elements


# Removing stop words
bernie_cleaned <- bernie_organic %>%
  select(text) %>%
  unnest_tokens(word, text)

bernie_cleaned <- bernie_cleaned %>%
  anti_join(stop_words)


# Showing the most frequent words ---------------------------------------------------------------------


bernie_cleaned %>% 
  count(word, sort = TRUE) %>% 
  top_n(20) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(x = word, y = n)) +
  geom_col () +
  xlab(NULL) +
  coord_flip () + 
  theme_classic() +
  labs (x = "Count",
        y = "Unique words",
        title = "Unique word counts found in tweets made by Bernie Sanders")



# Showing the most frequent hashtags -----------------------------------------------------------------

bernie_organic$hashtags <- as.character(bernie_organic$hashtags)

bernie_organic$hashtags <- gsub("c\\(", "", bernie_organic$hashtags)

wordcloud(bernie_organic$hashtags, min.freq=5, scale=c(3.5, .5), random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

wordcloud(bernie_organic$hashtags, random.order=FALSE,  
          colors=brewer.pal(8, "Dark2"))

# The workcloud is not working properly, I'll fix this later on


# Performing a sentiment analysis of the tweets -------------------------------------------------------

# Converting tweets to ASCII 
bernie_cleaned <- iconv(bernie_cleaned, from="UTF-8", to="ASCII", sub="")


bernie_sentiment <- get_nrc_sentiment((bernie_cleaned))
sentimentscores <- data.frame(colSums(bernie_sentiment[,]))

names(sentimentscores) <- "Score"

sentimentscores <- cbind("sentiment"=rownames(sentimentscores),sentimentscores)

rownames(sentimentscores) <- NULL

ggplot(data=sentimentscores,aes(x=sentiment,y=Score))+
  geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("Scores")+
  ggtitle("Total sentiment based on scores")+
  theme_minimal()

