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

# Downloading the 100 most recent Elizabeth Warren's tweets

warren <- get_timelines(
  "ewarren",
  n = 100)

# Downloading the 100 most recent Pete Buttigieg's tweets

pete <- get_timelines(
  "PeteButtigieg",
  n = 100)

# Downloading the 100 most recent Joe Biden's tweets

biden <- get_timelines(
  "JoeBiden",
  n = 100)



# Cleaning up the tweets -------------------------------------------------------------------------------------

# Removing retweets
bernie_organic <- bernie[bernie$is_retweet==FALSE, ] 
warren_organic <- warren[warren$is_retweet==FALSE, ] 
pete_organic <- pete[pete$is_retweet==FALSE, ] 
biden_organic <- biden[biden$is_retweet==FALSE, ] 


# Removing replies
bernie_organic <- subset(bernie_organic, is.na(bernie_organic$reply_to_status_id)) 
warren_organic <- subset(warren_organic, is.na(warren_organic$reply_to_status_id)) 
pete_organic <- subset(pete_organic, is.na(pete_organic$reply_to_status_id)) 
biden_organic <- subset(biden_organic, is.na(biden_organic$reply_to_status_id)) 


# Showing the ratio of replies/retweets/organic tweets -----------------------------------------------------------

# Keeping only the retweets
bernie_retweets <- bernie[bernie$is_retweet==TRUE,]
warren_retweets <- warren[warren$is_retweet==TRUE,]
pete_retweets <- pete[pete$is_retweet==TRUE,]
biden_retweets <- biden[biden$is_retweet==TRUE,]


# Keeping only the replies
bernie_replies <- subset(bernie, !is.na(bernie$reply_to_status_id))
warren_replies <- subset(warren, !is.na(warren$reply_to_status_id))
pete_replies <- subset(pete, !is.na(pete$reply_to_status_id))
biden_replies <- subset(biden, !is.na(biden$reply_to_status_id))


# Creating a data frame containing the distribution of organic tweets, retweets, and replies
bernie_data <- data.frame(
  category=c("organic tweets", "retweets", "replies"),
  count=c(84, 16, 0)
)

warren_data <- data.frame(
  category=c("organic tweets", "retweets", "replies"),
  count=c(70, 28, 2)
)

pete_data <- data.frame(
  category=c("organic tweets", "retweets", "replies"),
  count=c(70, 27, 3)
)

biden_data <- data.frame(
  category=c("organic tweets", "retweets", "replies"),
  count=c(95, 5, 0)
)


# Visualising the distribution of organic tweets, retweets, and replies for Bernie Sanders

# Adding columns 
bernie_data$fraction = bernie_data$count / sum(bernie_data$count)
bernie_data$percentage = bernie_data$count / sum(bernie_data$count) * 100
bernie_data$ymax = cumsum(bernie_data$fraction)
bernie_data$ymin = c(0, head(bernie_data$ymax, n=-1))

# Adding a legend
Type_of_Tweet_Bernie <- paste(bernie_data$category, bernie_data$percentage, "%")

# 
ggplot(bernie_data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=Type_of_Tweet_Bernie)) +
  geom_rect() +
  coord_polar(theta="y") + 
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "right")

# Visualising the distribution of organic tweets, retweets, and replies for Elizabeth Warren

# Adding columns 
warren_data$fraction = warren_data$count / sum(warren_data$count)
warren_data$percentage = warren_data$count / sum(warren_data$count) * 100
warren_data$ymax = cumsum(warren_data$fraction)
warren_data$ymin = c(0, head(warren_data$ymax, n=-1))

# Adding a legend
Type_of_Tweet_Warren <- paste(warren_data$category, warren_data$percentage, "%")

# 
ggplot(warren_data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=Type_of_Tweet_Warren)) +
  geom_rect() +
  coord_polar(theta="y") + 
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "right")

# Visualising the distribution of organic tweets, retweets, and replies for Pete Buttigieg

# Adding columns 
pete_data$fraction = pete_data$count / sum(pete_data$count)
pete_data$percentage = pete_data$count / sum(pete_data$count) * 100
pete_data$ymax = cumsum(pete_data$fraction)
pete_data$ymin = c(0, head(pete_data$ymax, n=-1))

# Adding a legend
Type_of_Tweet_Pete <- paste(pete_data$category, pete_data$percentage, "%")

# 
ggplot(pete_data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=Type_of_Tweet_Pete)) +
  geom_rect() +
  coord_polar(theta="y") + 
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "right")

# Visualising the distribution of organic tweets, retweets, and replies for Joe Biden

# Adding columns 
biden_data$fraction = biden_data$count / sum(biden_data$count)
biden_data$percentage = biden_data$count / sum(biden_data$count) * 100
biden_data$ymax = cumsum(biden_data$fraction)
biden_data$ymin = c(0, head(biden_data$ymax, n=-1))

# Adding a legend
Type_of_Tweet_Biden <- paste(biden_data$category, biden_data$percentage, "%")

# 
ggplot(biden_data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=Type_of_Tweet_Biden)) +
  geom_rect() +
  coord_polar(theta="y") + 
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "right")




# Cleaning the text ----------------------------------------------------------------------------------------

# Removing http elements 
bernie_organic$text <-  gsub("https\\S*", "", bernie_organic$text)
warren_organic$text <-  gsub("https\\S*", "", warren_organic$text)
pete_organic$text <-  gsub("https\\S*", "", pete_organic$text)
biden_organic$text <-  gsub("https\\S*", "", biden_organic$text)


# Removing @ mentions 
bernie_organic$text <-  gsub("@\\S*", "", bernie_organic$text) 
warren_organic$text <-  gsub("@\\S*", "", warren_organic$text) 
pete_organic$text <-  gsub("@\\S*", "", pete_organic$text) 
biden_organic$text <-  gsub("@\\S*", "", biden_organic$text) 


# Removing "amp"
bernie_organic$text <-  gsub("amp", "", bernie_organic$text) 
warren_organic$text <-  gsub("amp", "", warren_organic$text) 
pete_organic$text <-  gsub("amp", "", pete_organic$text) 
biden_organic$text <-  gsub("amp", "", biden_organic$text) 


# Removing "[\r\n]"
bernie_organic$text <-  gsub("[\r\n]", "", bernie_organic$text)
warren_organic$text <-  gsub("[\r\n]", "", warren_organic$text)
pete_organic$text <-  gsub("[\r\n]", "", pete_organic$text)
biden_organic$text <-  gsub("[\r\n]", "", biden_organic$text)


# Removing punctuation 
bernie_organic$text <-  gsub("[[:punct:]]", "", bernie_organic$text)
warren_organic$text <-  gsub("[[:punct:]]", "", warren_organic$text)
pete_organic$text <-  gsub("[[:punct:]]", "", pete_organic$text)
biden_organic$text <-  gsub("[[:punct:]]", "", biden_organic$text)


# Removing "caign"
bernie_organic$text <-  gsub("caign", "", bernie_organic$text)
warren_organic$text <-  gsub("caign", "", warren_organic$text)
pete_organic$text <-  gsub("caign", "", pete_organic$text)
biden_organic$text <-  gsub("caign", "", biden_organic$text)

# Removing "im" and "i'm"
warren_organic$text <-  gsub("im", "", warren_organic$text)
warren_organic$text <-  gsub("i'm", "", warren_organic$text)


# I can't manage to remove these two



# Removing "hshire"
bernie_organic$text <-  gsub("hshire", "", bernie_organic$text)

# Somehow, I can't manage to remove these hshire elements


# Removing stop words
bernie_cleaned <- bernie_organic %>%
  select(text) %>%
  unnest_tokens(word, text)

bernie_cleaned <- bernie_cleaned %>%
  anti_join(stop_words)


warren_cleaned <- warren_organic %>%
  select(text) %>%
  unnest_tokens(word, text)

warren_cleaned <- warren_cleaned %>%
  anti_join(stop_words)

pete_cleaned <- pete_organic %>%
  select(text) %>%
  unnest_tokens(word, text)

pete_cleaned <- pete_cleaned %>%
  anti_join(stop_words)

biden_cleaned <- biden_organic %>%
  select(text) %>%
  unnest_tokens(word, text)

biden_cleaned <- biden_cleaned %>%
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


warren_cleaned %>% 
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
        title = "Unique word counts found in tweets made by Elizabeth Warren")




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

