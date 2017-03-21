##Dimension Reduction - example

##Matrix data
set.seed(12345)
par(mar = req(0.2,4))
dataMatrix <- matrix(rnorm(400),nrow = 40)
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])


##Cluster the data
heatmap(dataMatrix)

##What if we add a pattern?
set.seed(678910)
for(i in 1:40){
    # filp a coin
    coinFlip <- rbinom(1,size=1,prob=0.5)
    #if coin is heads add a common patter to that row
    if(coinFlip){
        dataMatrix[i,] <- dataMatrix[i,]+rep(c(0,3),each = 5)
    }
}
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])


##Cluster the data - pattern
heatmap(dataMatrix)


#Patterns in rows and columns
hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order,]
par(mfrow=c(1,3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered),40:1,,xlab="Row Mean",ylab="Row",pch=19)
plot(colMeans(dataMatrixOrdered),xlab="Column",ylab="Column Mean",pch=19)
