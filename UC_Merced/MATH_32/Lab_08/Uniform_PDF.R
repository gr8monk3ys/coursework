# clear memory
rm(list=ls(all=TRUE))
#This splits the graphs to fit on one page
par(mfrow=c(3, 1))
# Gets rid of warnings
options(warn=-1)
#/////////////////////////////////////////////////////////////////////////////////// Assignment 1
#Setting the sample size for both the first and second assignment
n = 400

# Chooses a sample from the uniform distribution [1,10]
x = runif(n,min=0, max=10)
cat("Variance of x: ", var(x), "\n")
# Defining the epsilon value and manipulating its standard deviation
eps = rnorm(n,mean=0,sd=.5)
# Setting the given y equation for plotting
y = (3 * x) - 5 + eps
# Plotting the graph
plot(x,y, main = 'Standard Deviation Data Manipulation',xlab = "Sample",ylab = 'Variance')
line(x,y)
cat("\n")

# When you change the standard deviation, the approximation of the values condenses more to become a line when the sd becomes
# smaller as opposed to when you change the size of n, nothing really changes.

#/////////////////////////////////////////////////////////////////////////////////// Assignment 2
j = 10
n = 2^(1:j)
var = 1:j

# The for loop runs through each iteration of j
for(i in 1:j){
  # Chooses a sample from the uniform distribution [0,10]
  x = runif(n,min=0, max=10)
  # the variance vector index is the variance of x
  var[i] = var(x)
}

# Defining the epsilon value and manipulating its standard deviation
eps = rnorm(n,mean=0,sd=1)
# Setting the given y equation for plotting
y = (0.75 * x) - 5 + eps

# Printing out the covariance as well as correlation between x and y
cat("Variance of x: ", var(x), "\n")
cat("Variance of y: ", var(y), "\n")
cat("Covariance: ", cov(x,y), "\n")
cat("Correlation: ",cor(x,y), "\n")

# Plotting the graph
#plot(x,y, main = 'Convergence Values', ylabel = 'Sample')
# Plot the given variance that was calculated
plot(log2(n), var, col = 'red', main = 'Convergence of Variance',xlab = "Sample", ylab = 'Variance')
lines(log2(n), var)
# Show the convergence value
abline(10.11,j, col = 'blue')
cat("\n")

#/////////////////////////////////////////////////////////////////////////////////// Assignment 3 (Bonus)
n = 400
alpha = 1
beta = 1
# Chooses a sample from the uniform distribution [0,3]
x = runif(n, min=0, max=3)
# Setting the given y equation for plotting
y = alpha /(x + beta)
# Printing out the covariance as well as correlation between x and y
cat("Covariance: ", cov(x,y), "\n")
cat("Correlation: ",cor(x,y), "\n")
# Plotting the graph
plot(x,y, main = 'Covariance & Correlation Relationship', ylabel = 'Sample')

# Covariance and correlation relate with each other because correlation determines the relationship between the given variables
# while covariance determines how much two given variables change in correspondance with each other.

# You can make the covariance close to -1 when you make alpha approach 8.

# You can make the covariance close to 0 when you make beta larger than alpha. The greater beta is from alpha, the closer it
# gets to 0

# You can make the covariance positive because if you take one of the values (either alpha or beta) you can make one of them
# negative which would give you a positive covariance that is greater that 0. 