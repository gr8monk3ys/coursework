# Got help from Michael Ngo on the second task

# This clears the memory
rm(list=ls(all=TRUE))
# Loads the data onto the global environment
load("C:/Users/lscaturchio/OneDrive/School/MATH 32/R/Lab 04/concrete.RData")
options(warn = -1)

#////////////////////////////////////////////////////////////////////////////////////// Exploring

# matrix of all possible scatterplots
pairs(x)

# This creates the pdf of whatever is sandwitched after it
pdf("norm_hist.pdf",height=7,width=7)
# This is the boxplot of the water column
boxplot(x$water, main = "Water Boxplot")
dev.off()

# This creates the pdf of whatever is sandwitched after it
pdf("norm_hist.pdf",height=7,width=7)
# This is the normalized histogram
hist(x$cement,probability = TRUE,main = "Cement Histogram", ylab="Probability", xlab="Cement")
dev.off()

# This creates the pdf of whatever is sandwitched after it
pdf("matrix_X.pdf",height=7,width=7)
# matrix of all possible scatterplots
pairs(x)
dev.off()

#////////////////////////////////////////////////////////////////////////////////////// Model with one linear variable

# Create a linear regression model
mylm = lm(y ~ cement,data=x)
# This is to make predictions on the dataset
ypred = predict(mylm,newdata = xtest)

# Plot the graph of Cement, with the y variable
#plot(x$cement,y, main = "1 Var Lin Regression")

# Graph the regression line on the plot
lines(x$cement,predict(mylm), col="red")

# Test MSE in sample 
cat("Inner sample MSE of one Variable: ", mean((ytest - predict(mylm))^2), "\n")
# The MSE out of sample
cat("Outer sample MSE of one Variable: ", mean((ytest - ypred)^2), "\n")
cat("\n")

#////////////////////////////////////////////////////////////////////////////////////// Model with two linear variables 

# This is the linear regression model with the second variable added (Beta2)
mylm2 = lm(y ~ cement + water, data=x)
# This is to make predictions on the dataset
ypred2 = predict(mylm2, newdata = xtest)

# Test MSE in sample 
cat("Inner sample MSE of two Variables: ", mean((y - predict(mylm2))^2), "\n")
# The MSE out of sample
cat("Outer sample MSE of two Variables: ", mean((ytest - (ypred2))^2), "\n")
cat("\n")

#////////////////////////////////////////////////////////////////////////////////////// Model with three linear variables

# This is to store the amount of options for columns in x
numIndex = length(dim(x)[2] - 2)
# Creating a vector that has the index length of numIndex
MSEin = numeric(numIndex)
# Same thing for MSEout vector
MSEout = MSEin

# We want the index to start at 1 in order to find the min
j = 1
# This looks at all of the columns except water and cement
for (i in colnames(x)[-c(1,4)]){
  #This is the linear model that has the index as the determinant for what column
  lm_multiple = lm(y ~ x$cement + x$water + x[[i]], data = x)
  # This is to make multiple predictions on the dataset
  ypred_multiple = predict(lm_multiple, newdata = xtest)
  # Test MSE in sample
  MSEin[j] = mean((y - predict(lm_multiple))^2)
  # Test MSE out of sample
  MSEout[j] = mean((ytest -(ypred_multiple))^2)
  # Increment the index so that the values can be stored in each vector
  j <- j + 1
}

# varind = c(1:8)
# varind = -c(1,3)
# 
# numind = length(varind)
# 
# MSEin = numeric(numind)
# MSEout = MSEin
#
# We want the index to start at 1 in order to find the min
# j = 1
#
# for (i in varind){
#   newdf = x[c(1,3,varind[i])]
#   lm_multiple = lm(y~.,data = newdf )
#   # This is to make multiple predictions on the dataset
#   ypred_multiple = predict(lm_multiple, newdata = xtest)
#   # Test MSE in sample
#   MSEin[j] = mean((y - predict(lm_multiple))^2)
#   # Test MSE out of sample
#   MSEout[j] = mean((ytest -(ypred_multiple))^2)
# }

#//////////////////////////////////////////////////////////////////////////// Finding the Minimum value of the MSE out & In

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

cat("\n")
# Prints the smallest MSE with the data that is given for each column
cat("Smallest Value inside samples MSE for 3 variables: ", findMin(MSEin), "\n")
# Prints the smallest MSE with the data that is not given for each column
cat("Smallest value outside samples MSE for 3 variables: ", findMin(MSEout))
cat("\n")

#//////////////////////////////////////////////////////////////////////////// Proving the minimum value

# All of the following is just to test specific columns to see if the for loop is valid which it is based on what prints
mylm_age = lm(y ~ x$cement + x$water + x$age, data = x)
mylm_fly_ash = lm(y ~ x$cement + x$water + x$fly_ash, data = x)
ypred = predict(mylm_fly_ash, newdata = xtest)
cat("\n")
cat("Age MSE: ", mean((y - predict(mylm_age))^2), "\n")
cat("Fly Ash MSE: ", mean((ytest - (ypred))^2))
