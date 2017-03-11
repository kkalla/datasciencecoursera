library(sqldf)
library(RMySQL)
library(tcltk)

options(sqldf.driver = "SQLite")

acs <- read.csv("American_community_survey_data.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")

result1 <- unique(acs$AGEP)
result2 <- sqldf("select distinct AGEP from acs")

