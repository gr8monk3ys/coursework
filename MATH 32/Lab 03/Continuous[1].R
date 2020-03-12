# This clears the memory
rm(list=ls(all=TRUE))

# Make a universal vecor that depends on 2^n
sizevec = 2^(c(5:16))
# store length of sizevec 
ns = length(sizevec)


# ////////////////////////////////////////////////////////////////////////////////////////////////////

#Continuous RV 1

# Store the trials and results in a vector
trials4 = numeric(length = ns)
results4 = numeric(length = ns)

# Creates a uniform distribution on an interval
X = runif(n=100,min=-5,max=10)
# Print the mean of the entire distribution
print(mean(X))

# Loop to find the index for the necessary vectors
for(i in c(1:ns)){
  # Establish a vector that samples from the distribution X
  pick4 = sample(X, size = sizevec[i], replace = TRUE)
  # set the index of each trial to the sum of the samples
  trials4[i] = sum(pick4)
  # Find the summation of the trial and see how it converges to the mean
  results4[i] = sum(trials4[1:i])/sum(sizevec[1:i])
}

#plot the data
plot(c(5:16),results4,type='b',xlab='log_2(PDF)')
abline(h = mean(X), col='magenta')
