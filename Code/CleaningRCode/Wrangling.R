#head(Womens_Clothing_E_Commerce_Reviews)

#Import libraries
install.packages('ggplot2')
install.packages('dplyr')
install.packages('tidyr')
install.packages('plotly')
install.packages('plyr')
install.packages('fastDummies')
library("ggplot2")
library("plyr")
library("dplyr")
library("tidyr")
library("plotly")
library("fastDummies")

#Check for Missing Data
is.na(Womens_Clothing_E_Commerce_Reviews)

#Replace Nan values with "None" in Title
##Because the only nan values I have are in the Title variable and is not necessarily required for positive or negative
#analyzation, I will replace with "None" as it is still True
Womens_Clothing_E_Commerce_Reviews[is.na(Womens_Clothing_E_Commerce_Reviews) ] <- "None"
Womens_Clothing_E_Commerce_Reviews

#Checking for Missing Data again
is.na(Womens_Clothing_E_Commerce_Reviews)

WCECR_1 <- Womens_Clothing_E_Commerce_Reviews

#Avg Age of Reviews being left = 43.2
#Using mean function
mean(WCECR_1$'Age')

#Avg rating given in dataset = 4.2
mean(WCECR_1$'Rating')

#Grouping ClothingID to find most purchased/reviewed item = 1078
#Using mode
find_mode2 <- function(x) {
  u <- unique(x)
  tab <- tabulate(match(x, u ))
  u[tab == max(tab)]
}

find_mode2(WCECR_1$`Clothing ID`)

#Grouping Rating to find the most given rating = 5
find_mode <- function(x) {
  u <- unique(x)
  tab <- tabulate(match(x, u ))
  u[tab == max(tab)]
}

find_mode(WCECR_1$Rating)

#Highest upvote given = 122
##Upvote belongs to _____
max(WCECR_1$`Positive Feedback Count`)

#Analyzing Division Name = 4 categories
##Specify the column to be categorized
categories <- unique(WCECR_1$`Division Name`)
numberofCategories <- length(categories)
numberofCategories

sort(table(WCECR_1$`Division Name`), decreasing= TRUE)

#Analyzing Department Name = 7 categories
categories2 <- unique(WCECR_1$`Department Name`)
numberofCategories2 <- length(categories2)
numberofCategories2
categories2

sort(table(WCECR_1$`Department Name`), decreasing= TRUE)

#Analyzing Class Name = 21
categories3 <- unique(WCECR_1$`Class Name`)
numberofCategories3 <- length(categories3)
numberofCategories3
categories3

sort(table(WCECR_1$'Class Name'), decreasing= TRUE)

#Comparisons of clothing products vs rating
Department_table <- table(WCECR_1$`Department Name`)

pie(Department_table)


install.packages("lessR")
library(lessR)

#Creating a table to visualize in pie chart
Rating_table <- table(WCECR_1$Rating)

pie(Rating_table, main = "Overall Rating's Given by Customers", radius = -1,
    col.main = "black")
#Looks like reviews are primarily 5s

#Create scatter plot to see where age and rating have more of a relatiosnhip
plot(x = WCECR_1$Rating, y = WCECR_1$Age, xlab = "Rating", ylab = "Age", main = "Age VS Rating",
    col.lab = "dark green", col.main = "dark green", col.axis = "dark blue")
#Hard to see where there is more of a relationship but it looks like the older the age the higher the rating, surprisingly

#Bar graph of the department name VS rating and recommended upvote
WCECR_2 <- aggregate(WCECR_1$Rating, by=list(Department=WCECR_1$`Department Name`), FUN=mean)
warnings()

x <- WCECR_2

barplot(x, xlab = "Department Name", ylab = "Rating", col = "white",
        col.axis = "green",
        col.lab = "blue")l

#Drop columns
keptdf = select(WCECR_3, -9, -11)

write.csv(keptdf, "C:\\Users\\12543\\OneDrive\\Desktop\\DataScience\\FINAL\\Code\\CleaningRCode\\Wrangling.csv")