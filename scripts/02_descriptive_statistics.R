source(here::here("scripts","01_scraping.R"))


# Computing the average for retweets and favorites for each of the candidate 

descriptive_statistics <- tweets %>% 
  group_by(screen_name) %>% 
  summarize (average_retweet = mean(retweet_count, na.rm = T),
             average_favorite = mean(favorite_count, na.rm = T)) %>% 
  arrange(desc(average_retweet))





