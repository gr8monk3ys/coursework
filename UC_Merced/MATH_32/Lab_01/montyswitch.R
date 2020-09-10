
# ask the user for how many doors they want
numDoors <- readline(prompt="How many doors?: ")
# convert character into integer and return it
numDoors <- as.integer(numDoors)

montyswitch = function(i)
{
  doors = c(1:numDoors)
  # randomly pick where the car is
  carDoor = sample(doors, 1)
  # randomly pick player's door
  playerDoor = sample(doors, 1)
  # pick host's door: not player's door, not car door
  hostDoor <- doors[which(doors != playerDoor && doors != carDoor)]
  if (length(hostDoor) > 1){
    hostDoor = sample(doors, 1)
  }
  
  #Update the doors by taking out playerDoor and hostDoor
  updatedDoors <- doors[-c(playerDoor, hostDoor)]
  # pick final choice: not player's door, not host door
  finalChoice = sample(updatedDoors, 1)
  
  #Modified the if statement where there is a probablility the first door picked is the car door
   if (finalChoice == carDoor || playerDoor == carDoor){
     return(TRUE)
   } else {
     return(FALSE)
   } 
}

findMean <- function(j)
{
  # run experiment 10000 times
  results = sapply(FUN = montyswitch, X = c(1:10000))
  # prints the mean and return the double value
  return (mean(results))
}

# validate function:
trials = sapply(FUN = findMean, X = c(1:20))

# print computed probability (20 trials)
print(trials)

# graph the data showing that as more doors are added, the mean becomes 1 - (2/n)
plot(trials, type = "l", ylim = c((2/numDoors - .05),(2/numDoors + .05)), main = "Monystay Trials", xlab = "Trials",ylab = "Mean",col = "red")
#additional line to show what the desired value is
abline(h = ((1/numDoors) * 2), col = "blue")