# Clear memory
rm(list=ls(all=TRUE))

#set the working directory
setwd('C:/Users/lscaturchio/OneDrive/School/MATH 32/R/Lab 10')

# Load the data
load('mlb2015.RData')

# Clean the data
# NameIndex = which(colnames(mlb2015)=='Tm')
# WinIndex = which(colnames(mlb2015)=='W')
# LossIndex = which(colnames(mlb2015)=='L')
WinLossRatioIndex = which(colnames(mlb2015)=='W.Lpct')

# Create New Data Frame
mlb = mlb2015[,-c(33,34,1)]
attach(mlb)

# WinRatio = mlb2015[c(WinLossRatioIndex)]
WinRatio = mlb2015[c(WinLossRatioIndex)]

# First try: predict win ratio with batter age
Model1 = lm(W.Lpct ~ BatAge, data=mlb)
print(summary(Model1))

# Test model using LOOCV
allmodels = list(NULL)
n = nrow(mlb)
indiverrors = numeric(length=n)
for(i in c(1:30)){
  allmodels[[i]] = lm(W.Lpct ~ BatAge, data = mlb[-i,])
  truewinpct = mlb[i,]$W.Lpct
  predwinpct = predict(allmodels[[i]], newdata = mlb[i,])
  indiverrors[i] = (truewinpct-predwinpct)^2
}

print(mean(indiverrors))

# Second try: Predict win ratio with batter age and RBI
Model2 = lm(W.Lpct ~ BatAge + RBI, data=mlb)
print(summary(Model2))

# Test model using LOOCV
allmodels2 = list(NULL)
indiverrors2 = numeric(length=n)
for(i in c(1:30)){
  allmodels2[[i]] = lm(W.Lpct ~ BatAge + RBI, data = mlb[-i,])
  truewinpct = mlb[i,]$W.Lpct
  predwinpct = predict(allmodels2[[i]], newdata = mlb[i,])
  indiverrors2[i] = (truewinpct-predwinpct)^2
}
print(mean(indiverrors2))

#Third try: Predict win ratio with batter age, RBI, and IBB
Model3 = lm(W.Lpct ~ BatAge + RBI + IBB, data=mlb)
print(summary(Model3))

# Test model using LOOCV
allmodels3 = list(NULL)
indiverrors3 = numeric(length=n)
for(i in c(1:30)){
  allmodels3[[i]] = lm(W.Lpct ~ BatAge + RBI + IBB, data = mlb[-i,])
  truewinpct = mlb[i,]$W.Lpct
  predwinpct = predict(allmodels3[[i]], newdata = mlb[i,])
  indiverrors3[i] = (truewinpct-predwinpct)^2
}
print(mean(indiverrors3))