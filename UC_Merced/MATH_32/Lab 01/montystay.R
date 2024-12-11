
# ask the user for how many doors they want
numDoors <- readline(prompt="How many doors?: ")
# convert character into integer and return it
numDoors <- as.integer(numDoors)

# This function helps us determine which doors have a car and a goat
montystay = function(i)
{
  # set up vector of doors
  doors = c(1:numDoors)
  # randomly pick where the car is
  carDoor = sample(doors, 1)
  # randomly pick player's door
  playerDoor = sample(doors, 1)
  if (playerDoor == carDoor){
    return(TRUE)
  }else {
    return(FALSE)
  }
}

findMean <- function(j)
{
  # run experiment 10000 times
  results = sapply(FUN = montystay, X = c(1:10000))
  # prints the mean and return the double value
  return (mean(results))
}

# validate function:
trials = sapply(FUN = findMean, X = c(1:20))

# print computed probability (20 trials)
print(trials)

# graph the data showing that as more doors are added, the mean becomes 1 - (1/n)
plot(trials, type = "l", ylim = c((1/numDoors - .05),(1/numDoors + .05)), main = "Monystay Trials", xlab = "Trials",ylab = "Mean",col = "red")
#additional line to show what the desired value is
abline(h = (1/numDoors), col = "blue")