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
###############################################################

df_names <- c("date",
              "rating_beet","tasted_beet","flavour_beet","again_beet",
              "rating_ginger","tasted_ginger","flavour_ginger","again_ginger",
              "rating_straw","tasted_straw","flavour_straw","again_straw",
              "rating_rose","tasted_rose","flavour_rose","again_rose"
              )

dfLog = data.frame(
  date = Sys.Date(),
  rating_beet = 5,
  tasted_beet = "Ja",
  flavour_beet = "Frisk",
  again_beet = "Ja",
  rating_ginger = 3,
  tasted_ginger = "Ja",
  flavour_ginger = "Merkelig",
  again_ginger = "Vet ikke",
  rating_straw = 4,
  tasted_straw = "Ja",
  flavour_straw = "Sur",
  again_straw = "Nei",
  rating_rose = 3,
  tasted_rose = "Vet ikke",
  flavour_rose = "Søt",
  again_rose ="Ja"
  )

write_delim(dfLog,"data/ratinglog_new.csv",delim=",")

test_log <- read_delim("data/ratinglog_new.csv",delim=",")
