library(rhdf5)

if(!file.exists("exaple.h5")){
    created = h5createFile("example.h5")
}

created

created = h5createGroup("example.h5","foo")
created = h5createGroup("example.h5","baa")
created = h5createGroup("example.h5","foo/foobaa")
h5ls("example.h5")

## Write to groups
A = matrix(1:10, nrow = 5, ncol = 2)
h5write(A, "example.h5","foo/A")
B = array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B,"scale") <- "liter"
h5write(B, "example.h5","foo/foobaa/B")


##Write a data set
df = data.frame(1L:5L, seq(0,1,length.out = 5), c(
    "ab","cde","fghi","a","s"),stringsAsFactors = FALSE
)
h5write(df,"example.h5","df")

##Reading data
readA = h5read("example.h5","foo/A")
readB = h5read("example.h5","foo/foobaa/B")


##Writing and reading chunks
h5write(c(12,13,14),"example.h5","foo/A", index=list(1:3,1))
h5read("example.h5","foo/A")