library(tidyverse)

df_names <- c("date","rating_beet","comment_beet",
              "rating_ginger","comment_ginger",
              "rating_straw","comment_straw",
              "rating_rose","comment_rose")   

dfLog <- setNames(data.frame(matrix(ncol = 9, nrow = 0)), df_names)

#populate dataframe with inputs:
dfLog = data.frame(
  date = Sys.Date(),
  rating_beet = 5,
  comment_beet = 1,
  rating_ginger = 4,
  comment_ginger = 1,
  rating_straw = 3,
  comment_straw = 1,
  rating_rose = 3,
  comment_rose = 1
)

write_delim(dfLog,"data/ratinglog.csv",delim=",")

test_log <- read_delim("data/ratinglog.csv",delim=",")

rm(list=ls())
