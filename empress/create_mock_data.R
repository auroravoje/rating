library(tidyverse)

df_names <- c("date","rating_beet","comment_beet",
              "rating_ginger","comment_ginger",
              "rating_straw","comment_straw",
              "rating_rose","comment_rose")   

dfLog <- setNames(data.frame(matrix(ncol = 23, nrow = 0)), df_names)

#populate dataframe with inputs:
dfLog = data.frame(
  date = Sys.Date(),
  rating_beet = 5,
  comment_beet = "Liker den jordlige smaken",
  rating_ginger = 4,
  comment_ginger = "Bra, men litt for mye ingefær for min del.",
  rating_straw = 3,
  comment_straw = "God, men litt for syrlig",
  rating_rose = 3,
  comment_rose = "Forfriskende!"
)

write_delim(dfLog,"data/ratinglog.csv",delim=",")

test_log <- read_delim("data/ratinglog.csv",delim=",")

