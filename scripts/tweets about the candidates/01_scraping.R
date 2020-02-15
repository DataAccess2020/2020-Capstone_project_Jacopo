source(here::here("scripts/tweets by the candidates","00_set_up.R"))

q_bernie <- search_tweets(
  "bernie",
  include_rts = FALSE,
  lang = "en",
  since="2020-01-01", until="2020-02-14",
  n = 100000,
  retryonratelimit = TRUE 
)

save(q_bernie, file="output/q_bernie.rdata")

# ----------------------------------------------------------------------------------------------

about_bernie %>% 
  geom_line(aes(group = 1)) +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold")) 

ggplot(about_bernie, aes(group = 1)) +
         geom_line() 

q_bernie %>% 
  ts_plot("3 hours") + 
  theme_minimal() +
  theme(plot.title = ggplot2::element_text(face = "bold")) +
  labs(
    x = NULL, y = NULL,  
    title = "Frequency of #rstats Twitter statuses from past 9 days",
    subtitle = "Twitter status (tweet) counts aggregated using three-hour intervals",
    caption = "\nSource: Data collected from Twitter's REST API via rtweet"
  )


q_bernie %>% 
  ts_plot("days") + 
  theme_minimal() +
  theme(plot.title = element_text(face = "bold")) +
  labs(
    x = NULL, y = NULL
  )

ts_plot(data, by = "days", trim = 0L, tz = "UTC", ...)

# ----------------------------------------------------------------------------------------------

q_warren <- search_tweets(
  "warren",
  include_rts = FALSE,
  lang = "en",
  since="2020-01-01", until="2020-02-14",
  n = 100000,
  retryonratelimit = TRUE 
)

save(q_warren, file="output/q_warren.rdata")


q_buttigieg <- search_tweets(
  "buttigieg",
  include_rts = FALSE,
  since="2020-01-01", until="2020-02-14",
  n = 100000,
  retryonratelimit = TRUE 
)

save(q_buttigieg, file="output/q_buttigieg.rdata")


q_biden <- search_tweets(
  "biden",
  include_rts = FALSE,
  since="2020-01-01", until="2020-02-14",
  n = 100000,
  retryonratelimit = TRUE 
)

save(q_biden, file="output/q_biden.rdata")



