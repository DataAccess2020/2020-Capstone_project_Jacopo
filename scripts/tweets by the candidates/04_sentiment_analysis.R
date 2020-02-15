source(here::here("scripts/tweets by the candidates","03_text_analysis.R"))

# Sentiment analysis for Bernie Sanders 

# Converting tweets to ASCII 
bernie_cleaned <- iconv(bernie_cleaned, from="UTF-8", to="ASCII", sub="")


bernie_sentiment <- get_nrc_sentiment((bernie_cleaned))
sentimentscores_bernie <- data.frame(colSums(bernie_sentiment[,]))

names(sentimentscores_bernie) <- "Score"

sentimentscores_bernie <- cbind("sentiment"=rownames(sentimentscores_bernie),sentimentscores_bernie)

rownames(sentimentscores_bernie) <- NULL

ggplot(data=sentimentscores_bernie,aes(x=sentiment,y=Score))+
  geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("Scores")+
  ggtitle("Total sentiment based on scores (Bernie Sanders)")+
  theme_minimal()

# Sentiment analysis for Elizabeth Warren

warren_cleaned <- iconv(warren_cleaned, from="UTF-8", to="ASCII", sub="")

warren_sentiment <- get_nrc_sentiment((warren_cleaned))
sentimentscores_warren <- data.frame(colSums(warren_sentiment[,]))

names(sentimentscores_warren) <- "Score"

sentimentscores_warren <- cbind("sentiment"=rownames(sentimentscores_warren),sentimentscores_warren)

rownames(sentimentscores_warren) <- NULL

ggplot(data=sentimentscores_warren,aes(x=sentiment,y=Score))+
  geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("Scores")+
  ggtitle("Total sentiment based on scores (Elizabeth Warren)")+
  theme_minimal()

# Sentiment analysis for Pete Buttigieg

pete_cleaned <- iconv(pete_cleaned, from="UTF-8", to="ASCII", sub="")

pete_sentiment <- get_nrc_sentiment((pete_cleaned))
sentimentscores_pete <- data.frame(colSums(pete_sentiment[,]))

names(sentimentscores_pete) <- "Score"

sentimentscores_pete <- cbind("sentiment"=rownames(sentimentscores_pete),sentimentscores_pete)

rownames(sentimentscores_pete) <- NULL

ggplot(data=sentimentscores_pete,aes(x=sentiment,y=Score))+
  geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("Scores")+
  ggtitle("Total sentiment based on scores (Pete Buttigieg)")+
  theme_minimal()


# Sentiment analysis for Joe Biden

biden_cleaned <- iconv(biden_cleaned, from="UTF-8", to="ASCII", sub="")

biden_sentiment <- get_nrc_sentiment((biden_cleaned))
sentimentscores_biden <- data.frame(colSums(biden_sentiment[,]))

names(sentimentscores_biden) <- "Score"

sentimentscores_biden <- cbind("sentiment"=rownames(sentimentscores_biden),sentimentscores_biden)

rownames(sentimentscores_biden) <- NULL

ggplot(data=sentimentscores_biden,aes(x=sentiment,y=Score))+
  geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("Scores")+
  ggtitle("Total sentiment based on scores (Joe Biden)")+
  theme_minimal()



