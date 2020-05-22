################################################################################
###
### Introductory R Exercises
###
### Sara Gottlieb-Cohen, Manager of Statistical Support Services
### Center for Science and Social Science Information
### Yale University
###
################################################################################

### You will work with the mtcars data set to complete these exercises.

################################################################################

# First, save the data frame as "my_data"

mydata <- mtcars

# Examine the structure of mtcars, and also look at the first few observations. Type ?mtcars to get a 
# description of each variabe.

str(mtcars)
head(mtcars)
?mtcars

## Exercise 1: Which gets better mileage - automatic or manual cars? ##

# 1a. Is "am" (automatic or manual) correctly identified as a factor variable? If not, convert it to one.

class(mtcars$am)
mtcars$am <- factor(mtcars$am)

# 1b. Recode the "am" variable so that 0 = automatic and 1 = manual. Hint: try following the instructions
# on this website: https://rpubs.com/Mentors_Ubiqum/Rename_Levels. 

levels(mtcars$am) <- c("automatic", "manual")

# 1c. Create a subset of data called "automatic_data" that includes only the automatic cars.

automatic_data <- subset(mtcars, am == "automatic")

# 1d. Do the same for manual cars; call it "manual_data."

manual_data <- subset(mtcars, am == "manual")

# 1e. Calculate the mean mpg for both automatic and manual cars. Which gets better mileage?

mean(automatic_data$mpg)
mean(manual_data$mpg)

## Exercise 2: We are going to return now to the full mtcars data set. Which car is heaviest? ##

# 2a. Use a new command - summary(mtcars$wt) to get some descriptive statistics about that variable. 

summary(mtcars$wt)

# 2b. Use what you have learned about indexing only certain observations to find out which car has the highest
# weight. Hint: find where the max weight (from 2a) appears in the data.

mtcars[mtcars$wt == max(mtcars$wt),]

# 2c. Which car has the lowest weight?

mtcars[mtcars$wt == min(mtcars$wt),]

## Exercise 3: Is there a relationship between weight and mpg? ##

# The commands in this exercise will be new to you, but will serve as an introduction to next week's lesson. 

# 3a. First, examine your data. You can use hist(variable) name to create a histogram. Get histograms for both
# variables; you will see them appear in the panel to your right.

hist(mtcars$wt)
hist(mtcars$mpg)

# 3b. We now want to make a basic scatterplot with weight on the x-axis and mpg on the y=axis. You can do this using
# plot(variable on x axis, variable on y axis).

plot(mtcars$wt, mtcars$mpg)

# 3c. Look at the plot. Does there appear to be a relationship? How would you describe it?

# There appears to be a strong negative relationship.

# 3d. Is there a significant correlation between the two? We can examine this relationship numerically using the cor.test 
# function. Use ?cor.test or Google it to see which inputs you need, and try to work through it on your own. Does this 
#  resultmatch your expectation? 
# Hint: you will know you have performed the correct test if you found a correlation coefficient (r) of -.87. 

cor.test(mtcars$wt, mtcars$mpg)
