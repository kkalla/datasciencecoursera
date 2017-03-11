df <- read.fwf (
    file = url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
    widths = c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4),
    skip = 4, header = FALSE)

str(df)
head(df)