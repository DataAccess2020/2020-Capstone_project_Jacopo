source(here::here("scripts","00_set_up.R"))


# Downloading the 100 most recent Bernie Sanders's tweets

bernie_tweets <- get_timelines(
  "BernieSanders",
  n = 100)

# Saving them in the output folder 

save(bernie_tweets,file="output/bernie.Rdata")

# Importing the dataset

bernie <- import(here::here("output","bernie.Rdata"))


# Same thing, this time for Elizabeth Warren's tweets

warren_tweets <- get_timelines(
  "ewarren",
  n = 100)

save_as_csv(warren_tweets, file="output/warren.csv", prepend_ids = TRUE, na = "", fileEncoding = "UTF-8")

warren <- import(here::here("output","warren.csv"))


# Same thing, this time with Pete Buttigieg's tweets

pete_tweets <- get_timelines(
  "PeteButtigieg",
  n = 100)

save_as_csv(pete_tweets, file="output/pete.csv", prepend_ids = TRUE, na = "", fileEncoding = "UTF-8")

pete <- import(here::here("output","pete.csv"))


# Downloading the 100 most recent Joe Biden's tweets

biden_tweets <- get_timelines(
  "JoeBiden",
  n = 100)

save_as_csv(biden_tweets, file="output/biden.csv", prepend_ids = TRUE, na = "", fileEncoding = "UTF-8")

biden <- import(here::here("output","biden.csv"))


# Same thing, this time for the four candidate at once 

overall_tweets <- get_timelines(c("JoeBiden", "PeteButtigieg", "ewarren", "BernieSanders"), n = 100)

save_as_csv(overall_tweets, file="output/tweets.csv", prepend_ids = TRUE, na = "", fileEncoding = "UTF-8")

tweets <- import(here::here("output","tweets.csv"))


tweets %>%
  dplyr::filter(created_at > "2020-02-02") %>%
  dplyr::group_by(screen_name) %>%
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
