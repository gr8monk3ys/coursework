# This clears the memory
rm(list=ls(all=TRUE))

# Make a universal vecor that depends on 2^n
sizevec = 2^(c(5:16))
# store length of sizevec 
ns = length(sizevec)

# ////////////////////////////////////////////////////////////////////////////////////////////////////

#Discrete RV 3

# Lets establish values for p and q
p = 0.5
q = 0.75
# Generate 100 samples of Y
y = rbinom(n=100,size = 1,prob = p)
# Generate 100 samples of Z
z = rbinom(n=100,size = 1,prob = q)

# Initiate the stocks vector of size ns
trials3 = numeric(length = ns)
# Initiate the result vector of size ns
results3 = numeric(length = ns)

drv3 = function(i){
  # Let x be the sum of y and z
  x = y + z
  # Since sapply will be used we needed a function
  return(x)
}

# Creates a uniform distribution on an interval
xVec = sapply(FUN = drv3, X = c(1:10000))
# Print the mean of the entire distribution
print(mean(xVec))

# Loop to find the index for the necessary vectors
for (i in c(1:ns)){
  # Establish a vector that samples from the distribution xVec
  pick3 = sample(xVec, size = sizevec[i], replace = TRUE)
  # set the index of each trial to the sum of the samples
  trials3[i] = sum(pick3)
  # Find the summation of the trial and see how it converges to the mean
  results3[i] = sum(trials3[1:i])/sum(sizevec[1:i])
}


#plot the data
plot(c(5:16),results3,type='b',xlab='log_2(PDF)')
abline(h = mean(xVec), col='green')
