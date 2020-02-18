source(here::here("scripts/tweets by the candidates","00_set_up.R"))

# Scraping tweets about Bernie Sanders ---------------------------------------------------

# Scraping tweets from February the 10th, saving them into an Rdata file and importing it

q_bernie_day_1 <- search_tweets(
  "bernie",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-10", until="2020-02-11",
  n = 10000
)

save(q_bernie_day_1, file="output/q_bernie_day_1.Rdata")

about_bernie_day_1 <- import("output/q_bernie_day_1.Rdata")


# Scraping tweets from February the 11th, saving them into an Rdata file and importing it

q_bernie_day_2 <- search_tweets(
  "bernie",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-11", until="2020-02-12",
  n = 10000
)

save(q_bernie_day_2, file="output/q_bernie_day_2.Rdata")

about_bernie_day_2 <- import("output/q_bernie_day_2.Rdata")


# Scraping tweets from February the 12th, saving them into an Rdata file and importing it

q_bernie_day_3 <- search_tweets(
  "bernie",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-12", until="2020-02-13",
  n = 10000
)

save(q_bernie_day_3, file="output/q_bernie_day_3.Rdata")

about_bernie_day_3 <- import("output/q_bernie_day_3.Rdata")


# Scraping tweets from February the 13th, saving them into an Rdata file and importing it

q_bernie_day_4 <- search_tweets(
  "bernie",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-13", until="2020-02-14",
  n = 10000
)

save(q_bernie_day_4, file="output/q_bernie_day_4.Rdata")

about_bernie_day_4 <- import("output/q_bernie_day_4.Rdata")


# Scraping tweets from February the 14th, saving them into an Rdata file and importing it

q_bernie_day_5 <- search_tweets(
  "bernie",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-14", until="2020-02-15",
  n = 10000
)

save(q_bernie_day_5, file="output/q_bernie_day_5.Rdata")

about_bernie_day_5 <- import("output/q_bernie_day_5.Rdata")


# Scraping tweets from February the 15th, saving them into an Rdata file and importing it

q_bernie_day_6 <- search_tweets(
  "bernie",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-15", until="2020-02-16",
  n = 10000
)

save(q_bernie_day_6, file="output/q_bernie_day_6.Rdata")

about_bernie_day_6 <- import("output/q_bernie_day_6.Rdata")

# Scraping tweets from February the 16th, saving them into an Rdata file and importing it

q_bernie_day_7 <- search_tweets(
  "bernie",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-16", until="2020-02-17",
  n = 10000
)

save(q_bernie_day_7, file="output/q_bernie_day_7.Rdata")

about_bernie_day_7 <- import("output/q_bernie_day_7.Rdata")

# Combining the seven dataset and then saving it

about_bernie <- rbind(about_bernie_day_1, about_bernie_day_2, about_bernie_day_3, about_bernie_day_4, about_bernie_day_5, about_bernie_day_6, about_bernie_day_7)

save(about_bernie, file = "output/about_bernie.Rdata")

# Scraping tweets about Elizabeth Warren ---------------------------------------------------

# Scraping tweets from February the 10th, saving them into an Rdata file and importing it

q_warren_day_1 <- search_tweets(
  "warren",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-10", until="2020-02-11",
  n = 10000
)

save(q_warren_day_1, file="output/q_warren_day_1.Rdata")

about_warren_day_1 <- import("output/q_warren_day_1.Rdata")


# Scraping tweets from February the 11th, saving them into an Rdata file and importing it

q_warren_day_2 <- search_tweets(
  "warren",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-11", until="2020-02-12",
  n = 10000
)

save(q_warren_day_2, file="output/q_warren_day_2.Rdata")

about_warren_day_2 <- import("output/q_warren_day_2.Rdata")


# Scraping tweets from February the 12th, saving them into an Rdata file and importing it

q_warren_day_3 <- search_tweets(
  "warren",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-12", until="2020-02-13",
  n = 10000
)

save(q_warren_day_3, file="output/q_warren_day_3.Rdata")

about_warren_day_3 <- import("output/q_warren_day_3.Rdata")


# Scraping tweets from February the 13th, saving them into an Rdata file and importing it

q_warren_day_4 <- search_tweets(
  "warren",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-13", until="2020-02-14",
  n = 10000
)

save(q_warren_day_4, file="output/q_warren_day_4.Rdata")

about_warren_day_4 <- import("output/q_warren_day_4.Rdata")


# Scraping tweets from February the 14th, saving them into an Rdata file and importing it

q_warren_day_5 <- search_tweets(
  "warren",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-14", until="2020-02-15",
  n = 10000
)

save(q_warren_day_5, file="output/q_warren_day_5.Rdata")

about_warren_day_5 <- import("output/q_warren_day_5.Rdata")


# Scraping tweets from February the 15th, saving them into an Rdata file and importing it

q_warren_day_6 <- search_tweets(
  "warren",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-15", until="2020-02-16",
  n = 10000
)

save(q_warren_day_6, file="output/q_warren_day_6.Rdata")

about_warren_day_6 <- import("output/q_warren_day_6.Rdata")



# Scraping tweets from February the 16th, saving them into an Rdata file and importing it

q_warren_day_7 <- search_tweets(
  "warren",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-16", until="2020-02-17",
  n = 10000
)

save(q_warren_day_7, file="output/q_warren_day_7.Rdata")

about_warren_day_7 <- import("output/q_warren_day_7.Rdata")

# Combining the seven dataset

about_warren <- rbind(about_warren_day_1, about_warren_day_2, about_warren_day_3, about_warren_day_4, about_warren_day_5, about_warren_day_6, about_warren_day_7)

save(about_warren, file = "output/about_warren.Rdata")


# Scraping tweets about Pete Buttigieg ---------------------------------------------------

# Scraping tweets from February the 10th, saving them into an Rdata file and importing it

q_buttigieg_day_1 <- search_tweets(
  "buttigieg",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-10", until="2020-02-11",
  n = 10000
)

save(q_buttigieg_day_1, file="output/q_buttigieg_day_1.Rdata")

about_buttigieg_day_1 <- import("output/q_buttigieg_day_1.Rdata")


# Scraping tweets from February the 11th, saving them into an Rdata file and importing it

q_buttigieg_day_2 <- search_tweets(
  "buttigieg",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-11", until="2020-02-12",
  n = 10000
)

save(q_buttigieg_day_2, file="output/q_buttigieg_day_2.Rdata")

about_buttigieg_day_2 <- import("output/q_buttigieg_day_2.Rdata")


# Scraping tweets from February the 12th, saving them into an Rdata file and importing it

q_buttigieg_day_3 <- search_tweets(
  "buttigieg",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-12", until="2020-02-13",
  n = 10000
)

save(q_buttigieg_day_3, file="output/q_buttigieg_day_3.Rdata")

about_buttigieg_day_3 <- import("output/q_buttigieg_day_3.Rdata")


# Scraping tweets from February the 13th, saving them into an Rdata file and importing it

q_buttigieg_day_4 <- search_tweets(
  "buttigieg",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-13", until="2020-02-14",
  n = 10000
)

save(q_buttigieg_day_4, file="output/q_buttigieg_day_4.Rdata")

about_buttigieg_day_4 <- import("output/q_buttigieg_day_4.Rdata")


# Scraping tweets from February the 14th, saving them into an Rdata file and importing it

q_buttigieg_day_5 <- search_tweets(
  "buttigieg",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-14", until="2020-02-15",
  n = 10000
)

save(q_buttigieg_day_5, file="output/q_buttigieg_day_5.Rdata")

about_buttigieg_day_5 <- import("output/q_buttigieg_day_5.Rdata")


# Scraping tweets from February the 15th, saving them into an Rdata file and importing it

q_buttigieg_day_6 <- search_tweets(
  "buttigieg",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-15", until="2020-02-16",
  n = 10000
)

save(q_buttigieg_day_6, file="output/q_buttigieg_day_6.Rdata")

about_buttigieg_day_6 <- import("output/q_buttigieg_day_6.Rdata")

# Scraping tweets from February the 16th, saving them into an Rdata file and importing it

q_buttigieg_day_7 <- search_tweets(
  "buttigieg",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-16", until="2020-02-17",
  n = 10000
)

save(q_buttigieg_day_7, file="output/q_buttigieg_day_7.Rdata")

about_buttigieg_day_7 <- import("output/q_buttigieg_day_7.Rdata")

# Combining the seven dataset

about_pete <- rbind(about_buttigieg_day_1, about_buttigieg_day_2, about_buttigieg_day_3, about_buttigieg_day_4, about_buttigieg_day_5, about_buttigieg_day_6, about_buttigieg_day_7)

save(about_pete, file = "output/about_pete.Rdata")

# Scraping tweets about Joe Biden ---------------------------------------------------

# Scraping tweets from February the 10th, saving them into an Rdata file and importing it

q_biden_day_1 <- search_tweets(
  "biden",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-10", until="2020-02-11",
  n = 10000
)

save(q_biden_day_1, file="output/q_biden_day_1.Rdata")

about_biden_day_1 <- import("output/q_biden_day_1.Rdata")


# Scraping tweets from February the 11th, saving them into an Rdata file and importing it

q_biden_day_2 <- search_tweets(
  "biden",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-11", until="2020-02-12",
  n = 10000
)

save(q_biden_day_2, file="output/q_biden_day_2.Rdata")

about_biden_day_2 <- import("output/q_biden_day_2.Rdata")


# Scraping tweets from February the 12th, saving them into an Rdata file and importing it

q_biden_day_3 <- search_tweets(
  "biden",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-12", until="2020-02-13",
  n = 10000
)

save(q_biden_day_3, file="output/q_biden_day_3.Rdata")

about_biden_day_3 <- import("output/q_biden_day_3.Rdata")


# Scraping tweets from February the 13th, saving them into an Rdata file and importing it

q_biden_day_4 <- search_tweets(
  "biden",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-13", until="2020-02-14",
  n = 10000
)

save(q_biden_day_4, file="output/q_biden_day_4.Rdata")

about_biden_day_4 <- import("output/q_biden_day_4.Rdata")


# Scraping tweets from February the 14th, saving them into an Rdata file and importing it

q_biden_day_5 <- search_tweets(
  "biden",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-14", until="2020-02-15",
  n = 10000
)

save(q_biden_day_5, file="output/q_biden_day_5.Rdata")

about_biden_day_5 <- import("output/q_biden_day_5.Rdata")


# Scraping tweets from February the 15th, saving them into an Rdata file and importing it

q_biden_day_6 <- search_tweets(
  "biden",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-15", until="2020-02-16",
  n = 10000
)

save(q_biden_day_6, file="output/q_biden_day_6.Rdata")

about_biden_day_6 <- import("output/q_biden_day_6.Rdata")


# Scraping tweets from February the 16th, saving them into an Rdata file and importing it

q_biden_day_7 <- search_tweets(
  "biden",
  include_rts = FALSE,
  lang = "en",
  since="2020-02-16", until="2020-02-17",
  n = 10000
)

save(q_biden_day_7, file="output/q_biden_day_7.Rdata")

about_biden_day_7 <- import("output/q_biden_day_7.Rdata")

# Combining the seven dataset

about_biden <- rbind(about_biden_day_1, about_biden_day_2, about_biden_day_3, about_biden_day_4, about_biden_day_5, about_biden_day_6, about_biden_day_7)
save(about_biden, file = "output/about_biden.Rdata")