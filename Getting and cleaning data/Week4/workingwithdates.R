## Working with dates

##Starting simple
d1 = date()
d1
class(d1)

#Date class
d2 = Sys.Date()
d2
class(d2)

##Formatting dates
## %d = day as number (0-31), %a = abbreviated weekday, %A = unabbreviated weekday
## %m = month (00-12), %b = abbreviated month, %B = unabbreviated month
## %y = 2 digit year, %Y = four digit year
format(d2,"%a %b %d")


##Creating dates
x = c("1jan1960","2jan1960","31mar1960","30jul1960"); z = as.Date(x,"%d%b%Y")
z
x


##Lubridate package
library(lubridate)
ymd("20140108")
mdy("08/04/2013")
z<-dmy("03-04-2014")
class(z)
##Dealing with times
ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03",tz="Pacific/Auckland")

##Some functions have slightly different syntax
x = dmy(c("1jan2013","2jan1960","31mar1960","30jul1960"))
wday(x[1])
