# This clears the memory
rm(list=ls(all=TRUE))

# Make a universal vecor that depends on 2^n
sizevec = 2^(c(5:16))
# store length of sizevec 
ns = length(sizevec)

# ////////////////////////////////////////////////////////////////////////////////////////////////////

#Discrete RV 1

# Initiate the stocks vector of size ns
stocks = numeric(length = ns)
# Initiate the result vector of size ns
results = numeric(length = ns)

# Create a urn for the stock prices with their probabilities
urnOfStocks = c(100, 50, 10, 50, 100, 10, 50, 50, 100, 50)
# Print the mean of the entire distribution
print(mean(urnOfStocks))

# Loop to find the index for the necessary vectors
for(i in c(1: ns)){
  # We must now select one of the samples to determine if the probablility is correct
  pick = sample(x = urnOfStocks,size = sizevec[i], replace = TRUE)
  # Set the stock index to the sum of values of one particular stock
  stocks[i] = sum(pick)
  #store the result index to the sum of stock divided by the sum of the whole vector
  results[i] = sum(stocks[1:i])/sum(sizevec[1:i])
}

#plot the data
plot(c(5:16),results,type='b',xlab='log_2(Avg PMF)')
abline(h = 57, col='red')