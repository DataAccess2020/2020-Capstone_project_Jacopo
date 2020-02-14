source(here::here("scripts","01_scraping.R"))

# Loading the packages

library(dplyr)



# Computing the average for retweets and favorites for each of the candidate 

descriptive_statistics <- tweets %>% 
  mutate(candidate = ifelse(tweets$user_id == "x216776631", "Bernie Sanders",
                            ifelse(tweets$user_id == "x226222147", "Pete Buttigieg",
                                   ifelse(tweets$user_id == "x357606935", "Elizabeth Warren",
                                          ifelse(tweets$user_id == "x939091", "Joe Biden",
                                                 "None"))))) %>% 
  group_by(candidate) %>% 
  summarize (average_retweet = mean(retweet_count, na.rm = T),
             average_favorite = mean(favorite_count, na.rm = T)) %>% 
  arrange(desc(average_retweet))




