head(Womens_Clothing_E_Commerce_Reviews)

#Import libraries
install.packages('ggplot2')
install.packages('dplyr')
install.packages('tidyr')
install.packages('plotly')
install.packages('plyr')
library("ggplot2")
library("dplyr")
library("tidyr")
library("plotly")
library("plyr")

#Check for Missing Data
is.na(Womens_Clothing_E_Commerce_Reviews)

#Replace Nan values with "None" in Title
##Because the only nan values I have are in the Title variable and is not necessarily required for positive or negative
#analyzation, I will replace with "None" as it is still True
Womens_Clothing_E_Commerce_Reviews[ is.na(Womens_Clothing_E_Commerce_Reviews) ] <- "None"
Womens_Clothing_E_Commerce_Reviews

#Checking for Missing Data again
is.na(Womens_Clothing_E_Commerce_Reviews)

#Avg Age of Reviews being left = 43.2
#Using mean function
mean(Womens_Clothing_E_Commerce_Reviews$Age)

#Avg rating given in dataset = 4.2
mean(Womens_Clothing_E_Commerce_Reviews$Rating)

#Grouping ClothingID to find most purchased/reviewed item = 1078
#Using mode
find_mode2 <- function(x) {
  u <- unique(x)
  tab <- tabulate(match(x, u ))
  u[tab == max(tab)]
}

find_mode2(Womens_Clothing_E_Commerce_Reviews$`Clothing ID`)

#Grouping Rating to find the most given rating = 5
find_mode <- function(x) {
  u <- unique(x)
  tab <- tabulate(match(x, u ))
  u[tab == max(tab)]
}

find_mode(Womens_Clothing_E_Commerce_Reviews$Rating)

#Highest upvote given = 122
##Upvote belongs to _____
max(Womens_Clothing_E_Commerce_Reviews$`Positive Feedback Count`)

#Recode Division Name
if("Intimates" %in% WCC_df$`Division Name`) {
  print(1) 
} else if ("General" %in% WCC_df$`Division Name`) {
  print(2)
} else {
  print(3)
}

head(WCC_df)

#Recode Department Name

#Recode Class Name