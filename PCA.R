# Example of Principal Component Analysis

# Using the mtcars dataset, excluding the categorical variables 
mtcars.pca<- prcomp(mtcars[,c(1:7,10,11)], center = TRUE, scale. = TRUE)
summary(mtcars.pca) #importance of components 

# This obtains 9 principal components
# Proportion of variance- explains the percentage of the total variation in the dataset
# i.e. PC1 explains 63% of the total variance, 
# meaning 63% of the information in the dataset can be summarized by this one component

# Look at the PCA structure 
str(mtcars.pca)
# Each variable:
# $center- center point 
# $scale- scaling 
# sdev- standard deviation
# $rotation- the relationship between the initial variables and the principal components -> this is where you'll look for collinearity 
# $x- value of each sample in terms of PC

# Plotting PCA -> important to detect relationships and multicollinearity 
install.packages("devtools")
library(devtools)
install_github("vqv/ggbiplot")
1
library(ggbiplot)
ggbiplot(mtcars.pca)
ggbiplot(mtcars.pca, labels = rownames(mtcars))
# shows which variables contrbute to each PC
# let's you see how the data points relate to the axes
# in this plot, you can see which cars are similar to one another 

# There are more things you can do with PCA, I recommend this tutorial: 
# https://www.datacamp.com/community/tutorials/pca-analysis-r