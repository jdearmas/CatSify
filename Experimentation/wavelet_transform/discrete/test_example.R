# Load Library
library(wavelets)

# obtain the two series listed in Percival and Walden (2000), page 42
X1 <- c(.2,-.4,-.6,-.5,-.8,-.4,-.9,0,-.2,.1,-.1,.1,.7,.9,0,.3)

# plot example
plot(X1)

# combine them and compute DWT
wt <- dwt(X1, n.levels=3, boundary="reflection", fast=FALSE)
plot(wt@W[["W1"]])
# align
wt.aligned <- align(wt)

