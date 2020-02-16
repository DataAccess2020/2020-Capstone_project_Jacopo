# Loading the twitter data

about_bernie <- import("output/q_bernie.Rdata")
about_warren <- import("output/q_warren.Rdata")
about_pete <- import("output/q_buttigieg.Rdata")
about_biden <- import("output/q_biden.Rdata")



# Text pre-processing  -------------------------------------------------------------------------

# Removing http elements 
about_bernie$text <-  gsub("https\\S*", "", about_bernie$text)
about_warren$text <-  gsub("https\\S*", "", about_warren$text)
about_pete$text <-  gsub("https\\S*", "", about_pete$text)
about_biden$text <-  gsub("https\\S*", "", about_biden$text)


# Removing @ mentions 
about_bernie$text <-  gsub("@\\S*", "", about_bernie$text) 
about_warren$text <-  gsub("@\\S*", "", about_warren$text) 
about_pete$text <-  gsub("@\\S*", "", about_pete$text) 
about_biden$text <-  gsub("@\\S*", "", about_biden$text) 


# Removing "amp"
about_bernie$text <-  gsub("amp", "", about_bernie$text) 
about_warren$text <-  gsub("amp", "", about_warren$text) 
about_pete$text <-  gsub("amp", "", about_pete$text) 
about_biden$text <-  gsub("amp", "", about_biden$text) 


# Removing "[\r\n]"
about_bernie$text <-  gsub("[\r\n]", "", about_bernie$text)
about_warren$text <-  gsub("[\r\n]", "", about_warren$text)
about_pete$text <-  gsub("[\r\n]", "", about_pete$text)
about_biden$text <-  gsub("[\r\n]", "", about_biden$text)

# Removing punctuation 
about_bernie$text <-  gsub("[[:punct:]]", "", about_bernie$text)
about_warren$text <-  gsub("[[:punct:]]", "", about_warren$text)
about_pete$text <-  gsub("[[:punct:]]", "", about_pete$text)
about_biden$text <-  gsub("[[:punct:]]", "", about_biden$text)

# Removing digits Due to some weird problem with the Buttigieg dataset
about_pete$text <- gsub("\\d", "", about_pete$text)



# Selecting the English stop words from the stopworldslangs dataset

stop_words_langs <- stopwordslangs %>% 
  filter(lang=="en") %>% 
  select(word)

# Creating a vector containing some additional stop words 

more_stop_words <- c("heres", "ia", "à", "bernies", "bros", "couldnt", "youll", "bernie&#39;'s", "exle", "m4a", "hasnt","dont", "ve", "II", "Il", "ll", "lI", "â","iâ", "weâ", "canâ", "itâ", "caign", "caigns", "hshire", "im", "i'm", "ive", "it's", "chip", "you're", "we're", "fitn", "can't")

# Turning the vector into a tibble 

more_stop_words_df <- tibble(joinColumn = more_stop_words)

# Removing the stopwords from the tweets about Bernie

about_bernie_cleaned <- about_bernie %>%
  select(text) %>%
  unnest_tokens(word, text)

about_bernie_cleaned <- about_bernie_cleaned %>%
  anti_join(stop_words_langs,
            by = "word")

about_bernie_cleaned <- about_bernie_cleaned %>%
  anti_join(more_stop_words_df,
            by = c("word" = "joinColumn"))

# Removing the stopwords from the tweets about Warren

about_warren_cleaned <- about_warren %>%
  select(text) %>%
  unnest_tokens(word, text)

about_warren_cleaned <- about_warren_cleaned %>%
  anti_join(stop_words_langs,
            by = "word")

about_warren_cleaned <- about_warren_cleaned %>%
  anti_join(more_stop_words_df,
            by = c("word" = "joinColumn"))


# Removing the stopwords from the tweets about Buttigieg

about_pete_cleaned <- about_pete %>%
  select(text) %>%
  unnest_tokens(word, text)

about_pete_cleaned <- about_pete_cleaned %>%
  anti_join(stop_words_langs,
            by = "word")

about_pete_cleaned <- about_pete_cleaned %>%
  anti_join(more_stop_words_df,
            by = c("word" = "joinColumn"))



# Removing the stopwords from the tweets about Biden

about_biden_cleaned <- about_biden %>%
  select(text) %>%
  unnest_tokens(word, text)

about_biden_cleaned <- about_biden_cleaned %>%
  anti_join(stop_words_langs,
            by = "word")

about_biden_cleaned <- about_biden_cleaned %>%
  anti_join(custom_df,
            by = c("word" = "joinColumn"))



# Visualization -------------------------------------------------------------------------------------

about_bernie_cleaned %>% 
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
        title = "Top 50 unique word counts found in tweets made about Bernie Sanders")

about_warren_cleaned %>% 
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
        title = "Top 50 unique word counts found in tweets made about Elizabeth Warren")

about_pete_cleaned %>% 
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
        title = "Top 50 unique word counts found in tweets made about Pete Buttigieg")

about_biden_cleaned %>% 
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
        title = "Top 50 unique word counts found in tweets made about Joe Biden")

