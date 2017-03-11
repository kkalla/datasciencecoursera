con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)

result <- numeric()
k <- 0

for(i in c(10,20,30,100)){
    result[k+1] <- nchar(htmlCode[i])
    k<- k+1
}

result[1] <- nchar(htmlCode[10])
result[2] <- nchar(htmlCode[20])
result[3] <- nchar(htmlCode[30])
result[4] <- nchar(htmlCode[100])


