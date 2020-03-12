# clear memory
rm(list=ls(all=TRUE))
#This splits the graphs to fit on one page
par(mfrow=c(2, 1))
# Gets rid of warnings
options(warn=-1)

# simulate data
set.seed(32)
npts = 32
x = seq(from=-1,to=1,length.out=npts)
y = x + rnorm(n=npts,mean=0,sd=0.5)

# split into test and train
trainind = seq(from=1,to=32,by=2)
xtrain = x[trainind]
ytrain = y[trainind]
xtest = x[-trainind]
ytest = y[-trainind]

# plot training set data
# par(mfrow=c(2,1))
# plot(xtrain, ytrain, pch=20)

# build model using training set
numpow = c(1:16)

# Creating a vector that has the index length of numIndex
MSEtest = numpow
# Same thing for MSEout vector
MSEtrain = numpow

# cycle through all values of numpow from 1 to 16.
for(i in numpow){
  # fit the model and calculate both the training set MSE (mean-squared error) and the test set MSE.   
  xnam = paste("I(x**",c(1:numpow[i]),")",sep='')
  regression = as.formula(paste("y ~ ", paste(xnam, collapse="+")))
  # Need to establish each data frame based on the give data for train and test
  train = data.frame(x=xtrain, y=ytrain)
  test = data.frame(x=xtest, y=ytest)
  # Making the linear regression model
  mylm = lm(regression, data=train)
  # compute test predictions
  testpred = predict(mylm, newdata=test)
  trainpred = predict(mylm, newdata=train)
  # Test MSE in sample
  MSEtest[i] = mean((testpred - test[,2])^2)
  # Test MSE out of sample
  MSEtrain[i] = mean((trainpred -train[,2])^2)
}

# Finds the minimum value of any given MSE
findMin = function(MSE){
  # Establishing the minimum value as a random index
  minVal = MSE[1]
  for(j in 1:length(MSE)){
    # If an index is smaller than the first index
    if(MSE[j] < minVal){
      # The index value is equal to the minimum value
      minVal = MSE[j]
    }
  }
  return(minVal)
}

# Prints the smallest MSE with the data that is given for each column
cat("Smallest value for test samples MSE: ", findMin(MSEtest), "\n")
# Prints the smallest MSE with the data that is not given for each column
cat("Smallest value for training samples MSE: ", findMin(MSEtrain))
cat("\n")

# plot training set predictions
# note that they go right through the data points
plot(numpow, MSEtest, xlab="numpow", ylab="MSEtest", main="MSE Test Data")
lines(numpow, MSEtest, col="red")

# lines(xtrain, predict(mylm), col='red')

# plot test set data
plot(numpow, MSEtrain, xlab="numpow", ylab="MSEtrain", main="MSE Train Data")
lines(numpow, MSEtrain, col="green")

# plot(xtest, ytest, pch=18, ylim=c(-10,10))

# plot test set predictions
# lines(xtest, testpred, col='blue')




