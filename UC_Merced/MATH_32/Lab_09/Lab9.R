# This clears the memory
rm(list=ls(all=TRUE))
# Getting the functions of pareto

dpareto = function(x, shape, scale = 1, log = FALSE) {
  if (shape <= 0) {
    stop("shape should be strictly positive.")
  }
  if (scale <= 0) {
    stop("scale should be strictly positive.")
  }
  d = ifelse(x >= scale, shape/scale*(scale/x)^(shape+1), 0)
  if (log) d = log(d)
  return(d)
}

ppareto = function(x, shape, scale = 1, lower.tail = TRUE, log.p = FALSE) {
  if (shape <= 0) {
    stop("shape should be strictly positive.")
  }
  if (scale <= 0) {
    stop("scale should be strictly positive.")
  }
  p = ifelse(x >= scale, 1-(scale/x)^shape, 0)
  if (!lower.tail) p = 1-p
  if (log.p) p = log(p)
  return(p)
}

qpareto = function(p, shape, scale = 1, lower.tail = TRUE, log.p = FALSE) {
  if (shape <= 0) {
    stop("shape should be strictly positive.")
  }
  if (scale <= 0) {
    stop("scale should be strictly positive.")
  }
  if (log.p) p = exp(p)
  if (!lower.tail) p = 1-p
  if (all(p >= 0 & p <= 1)) {
    return(scale*(1-p)^(-1/shape))
  } else {
    stop("p should be between 0 and 1.")
  }
}

rpareto = function(n, shape, scale = 1) {
  if (shape <= 0) {
    stop("shape should be strictly positive.")
  }
  if (scale <= 0) {
    stop("scale should be strictly positive.")
  }
  return(qpareto(runif(n), scale=scale, shape=shape))
}


#//////////////////////////////////////////////////////////////////////////////////// Task 1 

# Set random seed
set.seed(32)

# Define a vector that gives pts
pts = seq(from=1, to=5, length.out = 1000)

# Randomly sample from Pareto distribution
x = ppareto(pts,3,1)
y = ppareto(pts,3,1)

# Make z distribution
z = 0.5*(x + y)
z = sort(z)

# Real CDF value
truecdf =  ((2*(-1 + pts)*pts*(15 + 2*pts*
            (-15 - 5*pts + 4*pts^3 + 16*pts^5)))/(1 - 2*pts)^2 - 
            15*log(-1 + 2*pts))/(16*pts^6)

# Plotting the result given from Z
plot(pts, z, main="Comparing CDFs", xlabel="X", ylabel="CDF Values",
     type='l', col="blue")
# Plotting the true CDF
lines(pts, truecdf, type='l', col='red')
legend("bottomright", inset=.05, c("Exact","Approximate"), fill= c('blue','red'), horiz = TRUE)

#//////////////////////////////////////////////////////////////////////////////////// Task 2

# Generate M samples from N RVs
M = 10
N = 10

pts = seq(1,5, lenght.out = M*N)

# Define a matrix that has 100 rows and 10 columns with Pareto
x = matrix(rpareto(M*N,3,1), M,N)

# Find the column means
xbar = colMeans(x)

# Plot the empirical CDF of the column means
#plot(ecdf(xbar))
h <- hist(xbar, breaks = 10, col = 'red', xlab='Means', main='Estimated Parameters From CDF')

# Fitting the data so that we can compare the histograph from the curve
xfit = seq(min(xbar), max(xbar), length = 400)
yfit = dnorm(xfit, mean=mean(xbar), sd=sd(xbar))
yfit = yfit * diff(h$mids[1:2]) * length(xbar)
lines(xfit,yfit,col='blue', lwd='2')

#//////////////////////////////////////////////////////////////////////////////////// Task 3

# When changing the value of M, what occurs is:

# Generate M samples from N RVs
M = 1000
N = 10

pts = seq(1,5, lenght.out = M*N)

# Define a matrix that has 100 rows and 10 columns with Pareto
x = matrix(rpareto(M*N,3,1), M,N)

# Find the column means
xbar = colMeans(x)

# Find the mean of the distribution 
mean = mean(xbar)

# Find the standard deviation of the distribution
sd = sd(xbar)

# Plot the empirical CDF of the column means
hist(xbar, breaks = 10, col = 'red', xlab='Means', main='Estimated Parameters Changing M')

# Fitting the data so that we can compare the histograph from the curve
xfit = seq(min(xbar), max(xbar), length = 400)
yfit = dnorm(xfit, mean=mean(xbar), sd=sd(xbar))
yfit = yfit * diff(h$mids[1:2]) * length(xbar)
lines(xfit,yfit,col='blue', lwd='2')

# If you mess with the values such as N for an example, when it is increased, then what is noticed is a
# significant difference in accuracy. 

# Generate M samples from N RVs
M = 100
N = 1000

pts = seq(1,5, lenght.out = M*N)

# Define a matrix that has 100 rows and 10 columns with Pareto
x = matrix(rpareto(M*N,3,1), M,N)

# Find the column means
xbar = colMeans(x)

# Plot the empirical CDF of the column means
hist(xbar, breaks = 10, col = 'red', xlab='Means', main='Estimated Parameters Changing N')

# Fitting the data so that we can compare the histograph from the curve
xfit = seq(min(xbar), max(xbar), length = 400)
yfit = dnorm(xfit, mean=mean(xbar), sd=sd(xbar))
yfit = yfit * diff(h$mids[1:2]) * length(xbar)
lines(xfit,yfit,col='blue', lwd='2')
