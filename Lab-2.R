# Monty Hall Game

door <- c(1, 2, 3) # Setting up the 3 doors
cardoor <- sample(door, 1) # Sampling 1 of the doors to have the car
choice <- sample(door, 1) # Sampling the door the contestant chooses

# Now, the reveal
goatdoors <- setdiff(door, cardoor) 

?setdiff # Finds all the rows of door that doesn't have cardoor

reveal_options <- setdiff(goatdoors, choice) # Now we know which doors we can open


# Scenario 1, 2 goats to choose from
if (choice == cardoor) {
  reveal <- sample(reveal_options, 1)
}

# Scenario 2, we can only open 1 door
if (choice == cardoor) {
  reveal <- sample(reveal_options, 1)
} else {
  reveal <- reveal_options
}

# This works as in scenario 1, we have 2 doors to open
# but for scenario 2, reveal_options would only have 1 door
# to choose from so works both ways. The else here is just
# defaulting to our only option.

remaining_doors <- setdiff(door, reveal)

# Switch or stay
newchoice <- setdiff(remaining_doors, choice)

if (choice == cardoor) {
  print("Stay: You got a car")
} else {
  print("Stay: You got a goat")
}
if (newchoice == cardoor) {
  print("Switch: You got a car")
} else {
  print("Switch: You got a goat")
}

# This works for 1 run through of the game
# I will add the code below for 100 games

n_stay <- 0    
n_switch <- 0

for ( i in 1:100) {
  door <- c(1,2,3) 
  cardoor <- sample(door,1) 
  choice <- sample(door,1) 
  goatdoors <- setdiff(door, cardoor) 
  reveal_options <- setdiff(goatdoors, choice) 
  if (choice == cardoor) { 
    reveal <- sample(reveal_options,1)  
  } else {
    reveal <- reveal_options 
  }
  remaining_doors <-setdiff(door, reveal)
  newchoice <- setdiff(remaining_doors, choice)   
  
  if (choice == cardoor) {
    n_stay <- n_stay + 1
  }
  
  if (newchoice == cardoor) {
    n_switch <- n_switch + 1
  }
}
print(n_stay/100)
print(n_switch/100)

