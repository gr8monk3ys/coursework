# This clears the memory
rm(list=ls(all=TRUE))

# Make a universal vecor that depends on 2^n
sizevec = 2^(c(5:16))
# store length of sizevec 
ns = length(sizevec)

# ////////////////////////////////////////////////////////////////////////////////////////////////////

#Discrete RV 2

# Create a vector of the coin with heads and tails
coin = c(1:2)
# Create a vector of a 6-sided die
sixSideDie = c(1:6)
# Create a vector of a 4-sided die
fourSideDie = c(1:4)

# Initiate the stocks vector of size ns
trials2 = numeric(length = ns)
# Initiate the result vector of size ns
results2 = numeric(length = ns)

drv2 = function(i){
  # Make a flip that samples either heads or tails
  flip = sample(coin, 1)
  
  # If it lands on heads
  if(flip == 1){
    # Make a roll that samples 6-sided die
    return(sample(sixSideDie, 1))
  # If it lands on tails
  }else if (flip == 2){
    # Make a roll that samples 4-sided die
    return(sample(fourSideDie, 1))
  }
}

# Creates a uniform distribution on an interval
rolls = sapply(FUN = drv2, X = c(1:10000))
# Print the mean of the entire distribution
print(mean(rolls))

# Loop to find the index for the necessary vectors
for(i in c(1:ns)){
  # Establish a vector that samples from the distribution rolls
  pick2 = sample(x = rolls, size = sizevec[i], replace = TRUE)
  # set the index of each trial to the sum of the samples
  trials2[i] = sum(pick2)
  # Find the summation of the trial and see how it converges to the mean
  results2[i] = sum(trials2[1:i])/sum(sizevec[1:i])
}

#plot the data
plot(c(5:16),results2,type='b',xlab='log_2(Trials)')
abline(h = 3, col='blue')
