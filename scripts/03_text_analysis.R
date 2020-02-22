source(here::here("scripts","02_descriptive_statistics.R"))


# Removing retweets
bernie_organic <- bernie[bernie$is_retweet==FALSE, ] 
warren_organic <- warren[warren$is_retweet==FALSE, ] 
pete_organic <- pete[pete$is_retweet==FALSE, ] 
biden_organic <- biden[biden$is_retweet==FALSE, ] 
tweets_organic <- tweets[tweets$is_retweet==FALSE, ] 

# Text pre-processing  

# Removing http elements 
bernie_organic$text <-  gsub("https\\S*", "", bernie_organic$text)
warren_organic$text <-  gsub("https\\S*", "", warren_organic$text)
pete_organic$text <-  gsub("https\\S*", "", pete_organic$text)
biden_organic$text <-  gsub("https\\S*", "", biden_organic$text)
tweets_organic$text <-  gsub("https\\S*", "", tweets_organic$text)

# Removing @ mentions 
bernie_organic$text <-  gsub("@\\S*", "", bernie_organic$text) 
warren_organic$text <-  gsub("@\\S*", "", warren_organic$text) 
pete_organic$text <-  gsub("@\\S*", "", pete_organic$text) 
biden_organic$text <-  gsub("@\\S*", "", biden_organic$text) 
tweets_organic$text <-  gsub("@\\S*", "", tweets_organic$text) 


# Removing "amp"
bernie_organic$text <-  gsub("amp", "", bernie_organic$text) 
warren_organic$text <-  gsub("amp", "", warren_organic$text) 
pete_organic$text <-  gsub("amp", "", pete_organic$text) 
biden_organic$text <-  gsub("amp", "", biden_organic$text) 
tweets_organic$text <-  gsub("amp", "", tweets_organic$text) 


# Removing "[\r\n]"
bernie_organic$text <-  gsub("[\r\n]", "", bernie_organic$text)
warren_organic$text <-  gsub("[\r\n]", "", warren_organic$text)
pete_organic$text <-  gsub("[\r\n]", "", pete_organic$text)
biden_organic$text <-  gsub("[\r\n]", "", biden_organic$text)
tweets_organic$text <-  gsub("[\r\n]", "", tweets_organic$text)


# Removing punctuation 
bernie_organic$text <-  gsub("[[:punct:]]", "", bernie_organic$text)
warren_organic$text <-  gsub("[[:punct:]]", "", warren_organic$text)
pete_organic$text <-  gsub("[[:punct:]]", "", pete_organic$text)
biden_organic$text <-  gsub("[[:punct:]]", "", biden_organic$text)
tweets_organic$text <-  gsub("[[:punct:]]", "", tweets_organic$text)

# Words I'm adding as stop words 

custom_list <- c("youâ", "ve", "II", "Il", "ll", "lI", "â","iâ", "weâ", "canâ", "itâ", "caign", "hshire", "im", "i'm", "ive", "it's", "chip", "you're", "we're", "fitn", "can't")
custom_df <- tibble(joinColumn = custom_list)

# Removing stop words

bernie_cleaned <- bernie_organic %>%
  select(text) %>%
  unnest_tokens(word, text)

bernie_cleaned <- bernie_cleaned %>%
  anti_join(stop_words)

bernie_cleaned <- bernie_cleaned %>%
  anti_join(custom_df,
            by = c("word" = "joinColumn"))

warren_cleaned <- warren_organic %>%
  select(text) %>%
  unnest_tokens(word, text)

warren_cleaned <- warren_cleaned %>%
  anti_join(stop_words)

warren_cleaned <- warren_cleaned %>%
  anti_join(custom_df,
            by = c("word" = "joinColumn"))

pete_cleaned <- pete_organic %>%
  select(text) %>%
  unnest_tokens(word, text)

pete_cleaned <- pete_cleaned %>%
  anti_join(stop_words)

pete_cleaned <- pete_cleaned %>%
  anti_join(custom_df,
            by = c("word" = "joinColumn"))

biden_cleaned <- biden_organic %>%
  select(text) %>%
  unnest_tokens(word, text)

biden_cleaned <- biden_cleaned %>%
  anti_join(stop_words)

biden_cleaned <- biden_cleaned %>%
  anti_join(custom_df,
            by = c("word" = "joinColumn"))


tweets_cleaned <- tweets_organic %>%
  select(text) %>%
  unnest_tokens(word, text)

tweets_cleaned <- tweets_cleaned %>%
  anti_join(stop_words)

tweets_cleaned <- tweets_cleaned %>%
  anti_join(custom_df,
            by = c("word" = "joinColumn"))


# Visualization -------------------------------------------------------------------------------------

# Top 20 most frequent words in tweets by all four candidates combined

tweets_cleaned %>% 
  count(word, sort = TRUE) %>% 
  top_n(50) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(x = word, y = n)) +
  geom_col () +
  xlab(NULL) +
  coord_flip () + 
  theme_classic() +
  labs (x = "Count",
        y = "Unique words",
        title = "Unique word counts found in tweets made by the four candidates")

# Top 30 most frequent words in Bernie Sanders's tweets

bernie_cleaned %>% 
  count(word, sort = TRUE) %>% 
  top_n(30) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(x = word, y = n)) +
  geom_col () +
  xlab(NULL) +
  coord_flip () + 
  theme_classic() +
  labs (x = "Count",
        y = "Unique words",
        title = "Unique word counts found in tweets made by Bernie Sanders")

# Top 30 most frequent words in Elizabeth Warren's tweets 

warren_cleaned %>% 
  count(word, sort = TRUE) %>% 
  top_n(30) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(x = word, y = n)) +
  geom_col () +
  xlab(NULL) +
  coord_flip () + 
  theme_classic() +
  labs (x = "Count",
        y = "Unique words",
        title = "Unique word counts found in tweets made by Elizabeth Warren")

# Top 30 most frequent words in Pete Buttigieg's tweets

pete_cleaned %>% 
  count(word, sort = TRUE) %>% 
  top_n(30) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(x = word, y = n)) +
  geom_col () +
  xlab(NULL) +
  coord_flip () + 
  theme_classic() +
  labs (x = "Count",
        y = "Unique words",
        title = "Unique word counts found in tweets made by Pete Buttigieg")

# Top 30 most frequent words in Joe Biden's tweets

biden_cleaned %>% 
  count(word, sort = TRUE) %>% 
  top_n(30) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(x = word, y = n)) +
  geom_col () +
  xlab(NULL) +
  coord_flip () + 
  theme_classic() +
  labs (x = "Count",
        y = "Unique words",
        title = "Unique word counts found in tweets made by Joe Biden")

