# Tweets about Bernie Sanders -----------------------------------------------

# Converting tweets to ASCII 
about_bernie_cleaned <- iconv(about_bernie_cleaned, from="UTF-8", to="ASCII", sub="")


about_bernie_sentiment <- get_nrc_sentiment((about_bernie_cleaned))
about_bernie_sentimentscores <- data.frame(colSums(about_bernie_sentiment[,]))

names(about_bernie_sentimentscores) <- "Score"

about_bernie_sentimentscores <- cbind("sentiment"=rownames(about_bernie_sentimentscores),about_bernie_sentimentscores)

rownames(about_bernie_sentimentscores) <- NULL

ggplot(data=about_bernie_sentimentscores,aes(x=sentiment,y=Score))+
  geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("Scores")+
  ggtitle("Total sentiment based on scores (Bernie Sanders)")+
  theme_minimal()

# Tweets about Elizabeth Warren ------------------------------------------------------------

# Converting tweets to ASCII 
about_warren_cleaned <- iconv(about_warren_cleaned, from="UTF-8", to="ASCII", sub="")


about_warren_sentiment <- get_nrc_sentiment((about_warren_cleaned))
about_warren_sentimentscores <- data.frame(colSums(about_warren_sentiment[,]))

names(about_warren_sentimentscores) <- "Score"

about_warren_sentimentscores <- cbind("sentiment"=rownames(about_warren_sentimentscores),about_warren_sentimentscores)

rownames(about_warren_sentimentscores) <- NULL

ggplot(data=about_warren_sentimentscores,aes(x=sentiment,y=Score))+
  geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("Scores")+
  ggtitle("Total sentiment based on scores (Elizabeth Warren)")+
  theme_minimal()

# Tweets about Pete Buttigieg ------------------------------------------------------------

about_pete_cleaned <- iconv(about_pete_cleaned, from="UTF-8", to="ASCII", sub="")

about_pete_sentiment <- get_nrc_sentiment((about_pete_cleaned))
about_pete_sentimentscores <- data.frame(colSums(about_pete_sentiment[,]))

names(about_pete_sentimentscores) <- "Score"

about_pete_sentimentscores <- cbind("sentiment"=rownames(about_pete_sentimentscores),about_pete_sentimentscores)

rownames(about_pete_sentimentscores) <- NULL

ggplot(data=about_pete_sentimentscores,aes(x=sentiment,y=Score))+
  geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("Scores")+
  ggtitle("Total sentiment based on scores (Pete Buttigieg)")+
  theme_minimal()

# Tweets about Joe Biden -----------------------------------------------------------------

about_biden_cleaned <- iconv(about_biden_cleaned, from="UTF-8", to="ASCII", sub="")

about_biden_sentiment <- get_nrc_sentiment((about_biden_cleaned))
about_biden_sentimentscores <- data.frame(colSums(about_biden_sentiment[,]))

names(about_biden_sentimentscores) <- "Score"

about_biden_sentimentscores <- cbind("sentiment"=rownames(about_biden_sentimentscores),about_biden_sentimentscores)

rownames(about_biden_sentimentscores) <- NULL

ggplot(data=about_biden_sentimentscores,aes(x=sentiment,y=Score))+
  geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("Scores")+
  ggtitle("Total sentiment based on scores (Joe Biden)")+
  theme_minimal()




