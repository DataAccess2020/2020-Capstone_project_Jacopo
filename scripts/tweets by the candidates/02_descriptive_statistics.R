source(here::here("scripts/tweets by the candidates","01_scraping.R"))


# Computing the average for retweets and favorites for each of the candidate 

descriptive_statistics <- tweets %>% 
  group_by(screen_name) %>% 
  summarize (average_retweet = mean(retweet_count, na.rm = T),
             average_favorite = mean(favorite_count, na.rm = T)) %>% 
  arrange(desc(average_retweet))


# Plotting the frequency

tweets %>%
  filter(created_at > "2020-01-01") %>%
  group_by(screen_name) %>%
  ts_plot("days") +
  geom_point() +
  theme_minimal() +
  theme(
    legend.title = element_blank(),
    legend.position = "bottom",
    plot.title = element_text(face = "bold")) +
  labs(
    x = NULL, y = NULL,
    title = "Frequency of Twitter statuses posted by news organization",
    subtitle = "Twitter status (tweet) counts aggregated by day from October/November 2017",
    caption = "\nSource: Data collected from Twitter's REST API via rtweet"
  )






