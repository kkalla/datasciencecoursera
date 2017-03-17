##Example of reshaping data

##start with reshaping
library(reshape2)
##example data set
head(mtcars)

##Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),
                measure.cars = c("mpg","hp"))


##Casting data frames
##dcast function recasts the data set into a particular shape 
cylData <- dcast(carMelt, cyl~variable)
cylData
cylData <- dcast(carMelt,cyl~variable, mean)


##Avaraging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)

##Another way - split
spIns = split(InsectSprays$count,InsectSprays$spray)

##apply
sprCount = lapply(spIns,sum)
##combine
unlist(sprCount)
##or
sapply(spIns,sum)

##Another way - plyr package
ddply(InsectSprays,.(spray),summarize,sum=sum(count))

##Creating a new variable
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
