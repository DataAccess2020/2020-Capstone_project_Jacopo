source(here::here("scripts/tweets by the candidates","00_set_up.R"))


# Downloading the 1000 most recent Bernie Sanders's tweets

bernie_tweets <- get_timelines(
  "BernieSanders",
  n = 1000)

# Saving them in the output folder 

save_as_csv(bernie_tweets, file="output/by_bernie.csv", prepend_ids = TRUE, na = "", fileEncoding = "UTF-8")

# Importing the dataset

bernie <- import(here::here("output","by_bernie.csv"))


# Same thing, this time for Elizabeth Warren's tweets

warren_tweets <- get_timelines(
  "ewarren",
  n = 1000)

save_as_csv(warren_tweets, file="output/by_warren.csv", prepend_ids = TRUE, na = "", fileEncoding = "UTF-8")

warren <- import(here::here("output","by_warren.csv"))


# Same thing, this time with Pete Buttigieg's tweets

pete_tweets <- get_timelines(
  "PeteButtigieg",
  n = 1000)

save_as_csv(pete_tweets, file="output/by_pete.csv", prepend_ids = TRUE, na = "", fileEncoding = "UTF-8")

pete <- import(here::here("output","by_pete.csv"))


# Downloading the 100 most recent Joe Biden's tweets

biden_tweets <- get_timelines(
  "JoeBiden",
  n = 1000)

save_as_csv(biden_tweets, file="output/biden.csv", prepend_ids = TRUE, na = "", fileEncoding = "UTF-8")

biden <- import(here::here("output","biden.csv"))


# Same thing, this time for the four candidate at once 

overall_tweets <- get_timelines(c("JoeBiden", "PeteButtigieg", "ewarren", "BernieSanders"), n = 1000)

save_as_csv(overall_tweets, file="output/tweets.csv", prepend_ids = TRUE, na = "", fileEncoding = "UTF-8")

tweets <- import(here::here("output","tweets.csv"))


