##Example of summarizing data

##getting the data from the web
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/kewm-hd3n/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")

##Look at a bit of the data
head(restData, n=3)
tail(restData,n=3)

##Make summary
summary(restData)

##More in depth information
str(restData)

##Quantiles of quantitive variables
quantile(restData$councilDistrict,na.rm = T)
quantile(restData$councilDistrict,probs = c(0.5,0.75,0.9))

##Make table
table(restData$zipCode,useNA = "ifany")
##2-D table
table(restData$councilDistrict,restData$zipCode)

##Check for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
## It returns true or false 
all(restData$zipCode>0)

##Row and column sums
colSums(is.na(resdData))
## You can check whether there is NA value in all columns
all(colSums(is.na(restData)==0))

##Values with specific characteristics
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),]

##Cross tabs
##Use another dataset
data("UCBAdmissions")
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq~Gender + Admit,data=DF)


##Flat tables
warpbreaks$replicate <- rep(1:9,len=54)
xt = xtabs(breaks ~.,data = warpbreaks)
ftable(xt)


##Size of a data set
fakeData = rnorm(1e5)
object.size(fakeData)
## or
print(object.size(fakeData),units="Mb")
