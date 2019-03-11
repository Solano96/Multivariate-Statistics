#loading the dataset of iris
library(datasets)
head(iris)

#uncomment this if you don't have ggplot2 installed
#install.packages("ggplot2")

#loading ggplot2 and plotting Petal information
library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()

#setting the seed so results are reproducible
set.seed(20)
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)
irisCluster

#checking how the diffrent petal families are getting grouped
table(irisCluster$cluster, iris$Species)

irisCluster$cluster <- as.factor(irisCluster$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color = irisCluster$cluster)) + geom_point()





