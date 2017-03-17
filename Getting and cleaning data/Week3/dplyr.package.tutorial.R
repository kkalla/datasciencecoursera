##Example of Managing data frame using dplyr package

library(dplyr)

chicago <- readRDS("chicago.rds")
dim(chicago)
names(chicago)

##Select function subsets data frame
head(select(chicago,city:dptp))

##Filter function makes subset of data frame
## with some conditions

chic.f <- filter(chicago,pm25mean2 > 30 $ tmpd >80)

## Arrange is used to reorder the rows in data frame
chicago <- arrange(chicago, date)
chicago <- arrange(chicago, desc(date))

## Rename function is used to rename variables
chicago <- rename(chicago,pm25 = pm25mean2, dewpoint = dptp)

##Mutate
chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25,na.rm = TRUE))

##Group by
chicago <- mutate(chicago, tempcat = factor(1*tmpd >80), labels = c("cold","hot"))
hotcold <- group_by(chicago, tempcat)

##another example
chicago <- mutate(chicago, year = as.POSIXlt(date)$year +1900)
years <- group_by(chicago,year)


##Use pipeline operation
chicago %>% mutate(month = as.POSIXlt(date)$mon +1) %>% group_by(month) %>% summarize(pm25 = mean(pm25,
                                                                                                  na.rm=TRUE),
                                                                                      o3 = max(o3tmean2))


