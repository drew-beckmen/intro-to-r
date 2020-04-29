################################################################################
###
### Introduction to R
###
### Sara Gottlieb-Cohen, Manager of Statistical Support Services
### Center for Science and Social Science Information
### Yale University
###
################################################################################

## Goals for this session:
##  1. Get comfortable with the R environment
##  2. Learn R basics: arithmetic, variable assignment, and data types
##  3. Get comfortable working with vectors
##  4. Get comfortable working with matrices
##  5. Get comfortable working with factors
##  6. Get comfortable working with data sets
##  7. Feel confident completing the homework exercises 

## Some of this information may seem high-level and not helpful. If you feel bored
## and confused as to why this lesson is relevant - do not worry, you are not alone!
## Using R for statistical purposes requires a proficiency in manipulating data; when 
## it comes to running a test, your data usually needs to be in a specific format.
## Without a strong foundation in R basics, you will later run into problems that you 
## do not know how to troubleshoot. Similarly, you will often find yourself reading 
## online documentation about how to implement a test or fix an error; without 
## basic R knowledge, reading StackOverflow will seem like a foreign language.
##
## My best advice when learning R is to not skip the foundational basics. Take it slow,
## and assume that everything will become relevant later on, even if it does not seem that way
## today.

################################################################################
### R basics ###

# You can perform basic arithmetic in R.
1 + 1 
2^5
4*6
2*(8+1)
21/3

# But you usually aren't just adding or dividing numbers - you are working with variables.
# You will often see the "<-" symbol, which is assignment.

x <- 9
z <- 2

# This is setting x to 9, and z to 2.
# If you ever want to see your variables, just type the variable name to print the assigned
# value.

x
z

# You see in the console that x is equal to 9, and z is equal to 2

# We can also assign a list of numbers to a variable
# The c() function means "combine," with each item on the list separated with a comma

y <- c(2, 4, 5, 7, 9)
y

# Exercise: Add x and y. What do you expect the answer to be?

sum <- x + y
sum

# Exercise: multiply z by y. What answer do you expect to get? Does the output match your 
# expectation?



# Exercise: run the code below to define q. Then multiply q and y. Why do you get an error?

q <- c(2, 4, 6)

# You cannot multiply q and y together because they are vectors of different length. 
# Define another vector of length 3

p <- c(1, 4, 5)

product <- q * p
product

# We just assigned numeric values to these variables, but we can also assign to them non-numeric
# values. We use quotation marks to indicate that something is a character string. We can also
# assign a logical value, like TRUE or FALSE. Remember that case matters! R will not recognize the
# logical value unless it is all uppercase. 

my_number_variable <- 3
my_character_variable <- "cucumber"
my_logical_variable <- FALSE

# Exercise: print these three variables to see their assigned values

my_number_variable
my_character_variable
my_logical_variable

sum(my_logical_variable) #Sum outputs zero when FALSE, one when TRUE

# We can also ask see what kind of variable something is by using the function class(variablename),
# with the name of your variable in parentheses. Note that although a variable name is a text string,
# R recognizes it as a saved variable so it does NOT need to be in quotations.

class(my_number_variable) #this is a numeric variable

# Exercise: what kind of variables are the other two? Use code to find the answer.

class(my_character_variable) #this is a character variable/string
class(my_logical_variable) #this is a logical variable


################################################################################
### Vectors ###

# A vector is essentially a list. If you think of a data set, each individual column or variable
# is a vector, with one value for each observation.

# In this section, we will use vectors to analyze made-up data about emails and text messages.
# The first thing to do is record the number of emails and texts you received each day in a given week,
# beginning on Monday.

emails <- c(30, 10, 12, 27, 16, 23, 26)
texts <- c(19, 40, 32, 35, 27, 22, 31)

# We are assigning multiple values to our variables, just as we did earlier. These lists of 
# values are vectors. We use the c() function (c stands for combine), and enter each
# value separated by a comma.

# We can see how many values are in a vector by using length().

length(emails)
length(texts)

# You will see that these both have 7 elements, one for each day of the week.
# On Monday you received 30 emails and 19 texts. However, looking 
# at our two vectors, this is not obvious. We want to name each column so that we can see which element
# belongs to which day of the week. We do this using the names() command:

names(emails) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

# On the left hand side, we put the vector we are naming inside the parentheses. On the right hand side,
# we assign a name to each element of our vector. 

# Exercise: assign names to the texts vector, using code similar to that above.

names(texts) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday") # Just creates the headers for each column/element

# Examine how texts and emails are now changed:

texts
emails

# To see the number of texts or emails you received over the whole week, you can sum the vector
# with sum().

sum(emails)
sum(texts)

# Exercise: what is the average number of emails you received on a given day? Use the mean() command.

average_emails <- mean(emails)
average_texts <- mean(texts)

# We can add vectors, too. This adds the corresponding element from each vector - component wise addition.

emails_and_texts <- emails + texts
emails_and_texts

# We see in the console the total number for each day.

# Exercise: Run the following command. On which days did you receive more emails than texts?
# How do you know? Monday and Saturday returns TRUE. > is a logical operator and returns a logical variable. 

emails > texts

# We often times want to isolate a single element of a vector. We index elements using square brackets.

# To see how many emails we received on Saturday, we write:

emails[6] #Indexing begins with 1 in R, thus you can index up to the length of the vector. 

# or

emails["Saturday"] #Saturday serves as a "key" for the value in 6th entry in the vector.

# We can use a colon to get a range of days. For example, to get Tuesday through Thursday we write:

emails[2:4]

# To get ONLY Tuesday and Thursday, we use c() within the brackets, with each day separated with a comma.
# Get multiple days rather than a range. Need to use c(). If you don't use c, R will think you are indexing
# a matrix rather than a vector. 

emails[c(2,4)]

# or

emails[c("Tuesday","Thursday")]

# Exercise: how many texts did you receive on Monday?

monday_texts <- texts[1]

# Exercise: how many texts do you receive on Monday, Tuesday, and Friday?

texts[c(1, 2, 5)]

# Sometimes we want to save a value or set of values.

weekday_texts <- texts[1:5]
weekday_texts

# Exercise: create a variable called weekend_texts, with texts from Saturday and Sunday.

weekend_texts <- texts[6:7]
weekend_texts

# Exercise: on average, did you receive more texts during the week or on the weekend?

#more_on_week is a logical variable with value TRUE - you did receive more texts during the week compared to the weekend.

more_on_week <- mean(weekday_texts) > mean(weekend_texts)
more_on_week

# Indexing with Logical Statements:
# We might also want to select certain elements based on a condition. For example, if we
# want to see ONLY the days when we received fewer than 25 emails:

emails[emails < 25]

# Inside the brackets, we are essentially saying "index only the elements of emails where we received 
# fewer than 25 emails." 

# We can also use "=="

emails[emails == 30]

# This looks for the days during which we received EXACTLY 30 emails. We use two equal signs
# because it is a logical function, not variable assignment.

################################################################################
### Matrices ###

# We just learned about vectors, which are one dimensional. We often times are working with
# matrices, which more closely resemble data sets.
# We want to create a matrix with the email and text data.

# To combine the two, we can use rbind(), which stands for row bind, and put the things we want to 
# combine inside the parentheses, each separated by a comma. We will call the matrix "conversations."

conversations <- rbind(emails, texts) #creates variable of two rows and seven columns (still the 7 days of the week)
conversations

# Sum matrices either row-wise or column-wise
# We can sum both rows and columns. Before you run the following, think about how many values
# you expect R to return for each command. 

rowSums(conversations)
colSums(conversations)

# Just as we indexed elements in a vector, we want to index elements of a matrix. We again use
# square brackets, but have to specify both a row and a column: [row,column]. For emails on Tuesday:

conversations[1,2]

# Exercise: select emails from Tuesday through Friday

conversations[1, 2:5]

# Exercise: select texts from Thursday and Saturday. Hint: you will have to combine a few things here -
# don't forget about using "combine" within your brackets.

conversations[2, c("Thursday", "Saturday")]

# Alternatively, 
conversations[2, c(4, 6)]

################################################################################
### Factors ###

# We have, so far, only dealt with continuous variables. The number of emails or texts you get could,
# in theory, be an infinite set of values. Factor variables are discrete categories.
# Categorical variables are factors since they have discrete categories (ie: text, email)

# We are going to create a vector called "conversation_type," either text or email.

conversation_type <- c("text", "email")

# Exercise: what class of variable is this? Use code to find out.

class(conversation_type) #as of now, conversation_type is a character variable

# A factor is different from a character variable; each element must belong to a category.
# To change this to a factor, we can use factor():

conversation_type <- factor(conversation_type) #overwriting conversation_type to convert it to a factor variable

# Now if we examine it again, we see it looks a bit different:

class(conversation_type) #factor variable has two levels - the two categories in the categorical variable
#output: "factor" variable

# Sometimes our categories are ordinal, meaning that the order matters.
# If you were to plot on an x axis, there would be a meaningful order. 
# Categorial variables (texts, emails) cannot be compared or put in a meaningful order

size <- c("small", "medium", "large")
size <- factor(size)
size #3 levels: large medium small ordered alphabetically. 

# You can see that R automatically alphabetized the levels of the factor, which isn't what we want.
# To change it, we can use the factor() command a bit differently:

# Decide how the factor levels should be ordered rather than letting R alphabatize them.
size <- factor(size, order = TRUE, levels = c("small", "medium", "large"))
size #output: small < medium < large

# The order input states that it should be an ordered/ordinal variable; the levels input states
# the order of the levels. Look at it again:

size

# Now we have a bit more information about the categories.

# Exercise: returning to the email and text data, change emails so that it is a factor variable.
# Assign each element to be either "high" or "low", depending on whether it is greater than 20. 
# Make sure to look at your new "emails" variable and ensure that R is treating it as a factor. 

# The first line of code is just to create the new variable - don't worry about it too much.
# It is basically a placeholder for the new factor variable we are creating.

emails_category <- array(0) #creating a null variable

emails_category[emails > 20] <- "high"
emails_category[emails <= 20] <- "low"

emails_category <- factor(emails_category, order = TRUE, levels = c("low", "high")) #establishing order to the factor variable
emails_category

################################################################################
### Data frames ###

# We are going to begin working with our first data frame! 
# We will start with mtcars, a data set already loaded into R.

mtcars

# To see the first few lines of data, we use:

head(mtcars)

# To look at the structure:

str(mtcars) #shows us the continuous numerical variables

# Try looking just at the mpg variable:

mpg #outputs ERROR

# Uh oh! An error. 
# Try typing mtcars in the console, followed by a $ (mtcars$). You will see a bunch of suggestions
# (note: if you have an older version of R you might have to press tab to see the suggestions);
# these are each variables within mtcars. I like to think of $ as a door: you can open the door to
# the data frame to explore the information contained within it.

# If we want to just look at the "mpg" variable, we must type: (functions like a path name)
mtcars$mpg #outputs all the numerical quantities associated with mpg as a VECTOR

# R needs to know that we are looking for mpg WITHIN the mtcars data frame.

# And we can index individual elements just like we did earlier. To get the first 10 observations for mpg:

mtcars$mpg[1:10]

# Note that the conversations data we used previously is a matrix, not a data set. R does not
# recognize it as having the structure of a data set; you cannot type conversations$ to pull the data
# from a certain day of the week. However, we can convert it to a data frame using the simple code:

conversations_data <- data.frame(conversations) #type conversion to data frame from a matrix.
conversations_data$Wednesday

# Play around with conversations_data in the console to explore how it is different from conversations.

# We are going to return to thinking about text/email data, but create a separate data set. We will
# construct a data frame with the following elements:

# a peron's name
# average number of emails they get a day
# average number of texts they get a day
# age
# profession

# Run the following to define our variables:

name <- c("Michelle", "Adam", "Steven", "Sara")
av_emails <- c(39, 12, 67, 40)
av_texts <- c(16, 11, 14, 9)
age <- c(51, 48, 43, 31)
profession <- c("environmental consultant", "psychologist", "revenue manager", "instructor")

# We can put these all into a data frame using data.frame
# Try typing ?data.frame into the console; putting a question mark before any function will tell us the inputs
# we need. You'll see from the documentation that we put in parantheses each vector we want, separated by a comma
# (that's explained in the "..." part). There are a bunch of optional inputs, too, but we don't need to worry
# about those now.

communication_data <- data.frame(name,av_emails,av_texts,age,profession)

# Look at the structure of the data set. Luckily, all the variables appear to be in the correct format.

str(communication_data)

# We want to look at ONLY the data for Sara. To do this, we can index it like we did earlier:

communication_data[4,1:5] #equivalent to communication_data[4,] because default is all columns.

# There are shortcuts, though. If we leave the "column" input blank, R assumes we want ALL columns. 

communication_data[4,]

# In large data sets we often can't tell that the row we want is the 4th one, for example. We might 
# rather index based on a logical statement

communication_data[name=="Sara",] #put logical statements within indexing brackets.

# As you can see, we get the same result using all three commands.

# We can create new variables in the data frame, too:

communication_data$gender <- c("F", "M", "M", "F")

# Now look at the structure again, and notice how it has changed:

str(communication_data)

# Exercise: Uh oh! Gender isn't being recognized as a factor. Change it to a factor variable.
# Character variables can take on any value, whereas factor variables (in this case gender) have limited option - male or female.

communication_data$gender = factor(communication_data$gender)
str(communication_data$gender)

# Maybe we want to look at the data just from females. We could index it, but that is cumbersome
# when we start working with large data sets. An easier way is to use subset(data,condition):

female_data <- subset(communication_data, gender == "F") #makes more sense than indexing specific rows/columns. creates a totally new data frame.
female_data

low_email_data <- subset(communication_data, emails < 20)
low_email_data

# Exercise: create a new data frame called "young_data" that has data only from people under 35

young_data <- subset(communication_data, age < 35)
young_data

#Some extra functions:
ncol(communication_data)
nrow(communication_data)

################################################################################
### Reading in data files ###

# Wait a second. You have learned a lot so far, but you hopefully noticed that we 
# skipped over a VERY important step of data analysis - reading in our files.

# In this example, you will read in a data set about dog intelligence. Each 
# row represents one breed. It contains the following variables:

# 1. Breed 
# 2. Classification (e.g., brightest dogs, above average working dogs)
# 3. Percent of commands successfully obeyed 

# This is a .csv file, a very common format for saving data. To read it in, we
# use the read.csv() command. However, we need to include the full file name
# in order to tell R where on our computer to find the file.

dog_data <- read.csv("dog_intelligence.csv") #a data frame just like communication_data

# Examine the data set:

str(dog_data)
head(dog_data)
tail(dog_data)

# Exercise: Which breeds are classified as "Brightest Dogs?" Using indexing to find out.

dog_data[dog_data$Classification == "Brightest Dogs" ,]
subset(dog_data, Classification == "Brightest Dogs")

# Exercise: What classification is a puli? What percentage of commands do they obey?

dog_data[dog_data$Breed == "Puli", 2:3]
puli_subset <- subset(dog_data, Breed == "Puli")
#Above Average Working Dogs          0.7


### You have finished this tutorial! ###
# You should now have some familiarity with the R environment, working with vectors, matrices, data frames and factors.
# Try completing the additional exercises over the next week to reinforce what you have learned.

