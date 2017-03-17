##Example of creating variables

##getting the data from the web
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/kewm-hd3n/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")

##Creating sequences
##Sometimes you need an index for your data set
s1 <- seq(1,10,by=2)
s2 <- seq(1,10,length = 3)
x <- c(1,3,8,25,100) ; seq(along = x)

##Subsetting variables
restData$nearMe = restData$neighborhood %in% c("Roland Park","Homeland")
table(restData$nearMe)

##Creating binary variables
restData$zipWrong = ifelse(restData$zipCode <0,TRUE,FALSE)
table(restData$zipWrong,restData$zipCode<0)

##Creating categorical variables
restData$zipGroups = cut(restData$zipCode,breaks = quantile(restData$zipCode))
##Easier cutting
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode,g=4)


##Creating factor variables
restData$zcf <- factor(restData$zipCode)

##Levels of factor variables
yesno <- sample(c("yes","no"),size=10,replace=TRUE)
yesnofac = factor(yesno,levels=c("yes","no"))
relevel(yesnofac,ref="yes")
##To change factor variable to numeric
as.numeric(yesnofac)

##Cutting produces factor variables
##Using the mutate function
library(Hmisc);library(plyr)
restData2 = mutate(restData,zipGroups=cut2(zipCode,g=4))