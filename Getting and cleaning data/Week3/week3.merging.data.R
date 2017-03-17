##Tutorial of merging data

##Peer review data
if(!file.exists("./data")){dir.create("./data")}
fileUrl1 = "http://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "http://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1, destfile = "./data/reviews.csv")
download.file(fileUrl2, destfile = "./data/solutions.csv")
reviews = read.csv("./data/reviews.csv");solutions <- read.csv("./data/solutions.csv")
head(reviews,2)


##Merging data - merge()
## Merges data frames
## Important parameters: x,y,by, by.x,by.y, all

names(reviews)

mergedData = merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)

##Default - merge all common column names
intersect(names(solutions),names(reviews))
mergedData2 = merge(reviews,solutions,all=TRUE)

##Using join in the plyr package
##Faster, but less full featured - defaults to left join, see help file for more

##if you have multiple data frames
df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))
df3 = data.frame(id=sample(1:10),z=rnorm(10))
dfList = List(df1,df2,df3)
join_all(dfList)