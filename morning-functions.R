
# nested for loop example ----

file_prefix = c("temp", "ph", "salinity")
file_suffix = c(1, 2, 3, 4)

for (i in 1:length(file_prefix)) {
  for (j in 1:length(file_suffix)) {
  print(paste0(file_prefix[i], "_", file_suffix[j]))
  }
}
# iterates through one prefix with each of the suffixes, 
# then goes back to the top and goes to the next prefix with all of the suffixes

# another nested for loop ----

odds <- c(1, 3, 5)
evens <- c(2, 4, 6, 8)

for (i in seq_along(odds)) {
  for (j in seq_along(evens)) {
    print(odds[i] * evens[j])
  }
}

# functions ----

# create function
bird_dog_sum <- function(bird, dog) {
  pets <- bird + dog
  return(pets)
}

# call function
x <- bird_dog_sum(bird = 2, dog = 5)

# create function
double_it <- function(x) {
  print(2*x)
}

# call function
double_it(x = 56)
double_it(x = 1:4)

# create function
exclaim_age <- function(age) {
  print(paste("I am", age, "years old!"))
}

# call function
exclaim_age(age = 10)

# create function
find_max <- function(val1, val2) {
  if(val1 > val2) {
    return(val1)
  } else if (val2 > val1) {
    return(val2)
  }
}
# anything you want to see at the end of your function, you need to return 
# return stores it so it can be used later 

# call function
find_max(198,200)

# create function
quarter_splits <- c(1.0, 1.1, 1.2, 1.1, 1.4, 1.5, 1.6, 1.4)

for (i in 1:length(quarter_splits)) {
  print(quarter_splits[i] + quarter_splits[i+1])
}

# create function
animal_age <- function(animal, age) {
  if (animal == "dog") {
    print(age * 7)
  } else if (animal == "goat") {
    print(age * 4.7)
  }
}

# call function
animal_age(animal = "dog", age = 8)
animal_age(animal = "cow", age = 2)
animal_age(animal = "dog", age = "yellow")


dog_choice <- data.frame(dog_name = c("Khora", "Teddy", "Waffle", "Banjo"),
                         food = c("everything", "salmon", "pancakes", "chicken"))

#library(tidyverse)

# create function
dog_menu <- function(name) {
  my_sub <- dog_choice %>%
    dplyr::filter(dog_name == name)
  print(paste("My name is", my_sub$dog_name, "and I like to eat", my_sub$food))
}
# call function
dog_menu(name = "Waffle")


# adding in error messages! ----

animal_age <- function(animal, age) {
  
  if (!animal %in% c("dog", "goat")) {
    stop("Oops! Animal must be a dog or goat")
  } # catches animals that aren't in the function
  
  if (is.numeric(age) == FALSE) {
    stop("Oops! Age must be a number")
  } # catches non-numeric ages
  
  if (age <= 0) {
    stop("Oops! Age must be greater than zero")
  } # catches ages that are negative or 0
  
  if (animal == "dog") {
    print(age * 7)
  } else if (animal == "goat") {
    print(age * 4.7)
  }
}

# calling function that will print out our error message
animal_age("cow", 12)
animal_age("dog", "cat")
animal_age("dog", -1)

# adding in warning messages! ----

calc_windpower <- function(rho, radius, windspeed) {
  if (windspeed > 130) {
    warning("Wow, that's fast! Are you sure?")
  }
  if (rho > 1.225) {
    warning("That air density is suspicious. Are you sure?")
  }
  if (radius < 0) {
    stop("Rotor radius must be a positive value (in meters)")
  }
  print(0.3 *rho*pi*(radius^2)*(windspeed^3))
}

calc_windpower(rho = 2, radius = 10, windspeed = 50)
calc_windpower(2, -1, 50) 

