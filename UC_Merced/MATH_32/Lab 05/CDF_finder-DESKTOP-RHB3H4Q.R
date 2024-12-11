# This clears the memory
rm(list=ls(all=TRUE))
options(warn = -1)
par(mfrow=c(2, 2))

#////////////////////////////////////////////////////////////////////////////////////// Question 1

# Set the range for the x
x = seq(from=0.5, to=1.5, by=0.01)

# Find the CDF values in a
y1 = dnorm(x, mean=0.7, sd=.5)
y2 = dnorm(x, mean=0.9, sd=.46)
y3 = dnorm(x, mean=1.2, sd=.78)

# Plot the data
plot(x,y1,type="l", ylim=c(0,1), ylab="f(x)")
lines(x, y2, type="l", col="red")
lines(x, y3, type="l", col="blue")

#////////////////////////////////////////////////////////////////////////////////////// Question 2

# Set the range for the x
grade_range = seq(from=0, to=1.0, by=0.01)
# Find the CDF values in a
params = dnorm(grade_range, mean=0.60, sd=0.0175)
# Plot the PDF
plot(grade_range,params,type="l", xlab="Grade Range", ylab="Number of Students")

# The probablility of the grade < 0 || grade > 100
cat("Probability of < 0%: ", pnorm(0, mean=0.60, sd=0.0175), "\n") 
cat("Probability of > 100%: ", (1 - pnorm(1.0, mean=0.60, sd=0.0175)), "\n")

# Defining the range for getting an A grade
grade_A = seq(from=0.9, to=1.0, by=0.01)
# The probability that the grade is greater than 90%
z = (1 - dnorm(grade_A, mean=0.60, sd=0.0175))

# Defining the range for a passing grade
#grade_pass = seq(from=0.5, to=1.0, by=0.01)
passing_prob = dnorm(1.0, mean=0.60, sd=0.0175) - dnorm(0.5, mean=0.60, sd=0.0175)
cat("Probability of passing: ", passing_prob ,"\n")

#////////////////////////////////////////////////////////////////////////////////////// Question 3

# Defining alpha and beta
alpha = -10
beta = 5

# Setting the range between alpha and beta
x = seq(from=alpha, to=beta, by=0.01)
# Calculating CDF and matching with paper & pen analysis
y = punif(x, min=0, max =1)

# Plot the data
plot(x,y,type="l", ylab="f(x)")

#////////////////////////////////////////////////////////////////////////////////////// Question 4

# Defining alpha and beta
alpha = -10
beta = 5

# Setting the range between alpha and beta
x = seq(from=alpha, to=beta, by=0.01)
# Calculating CDF and matching with paper & pen analysis
y = qunif(x, min=0, max =1)

# Plot the data
lines(x,y,type="l", col="red")

#////////////////////////////////////////////////////////////////////////////////////// Question 5

# Setting the value of lambda
lambda = 0.25
# Setting the range from -5 to 5
x = seq(from=-5, to=5, by=0.01)
# Finding the Exponential PDF
y = dexp(x, rate =lambda)

# Plot the data
plot(x,y,type="l", ylab="f(x)")

#////////////////////////////////////////////////////////////////////////////////////// Question 6

# Setting the value of lambda
lambda = 0.25
# Setting the range from -5 to 5
x = seq(from=-5, to=5, by=0.01)
# Finding the Exponential PDF
y = qexp(x, rate =lambda)

# Plot the data
lines(x,y,type="l", col="red")