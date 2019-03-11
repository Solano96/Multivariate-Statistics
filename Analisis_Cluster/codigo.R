require("datasets")
data("iris") # load Iris Dataset
str(iris) #view structure of dataset

summary(iris)
head(iris)

# eliminamos la etiqueta 
iris.new<- iris[,c(1,2,3,4)]
iris.class<- iris[,"Species"]

cat("\nDatos sin etiquetas:\n\n")
head(iris.new)
cat("\nEtiquetas:\n\n")
head(iris.class)

# definimos la siguiente función para normalizar
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}

# normalizamos los datos
iris.new$Sepal.Length<- normalize(iris.new$Sepal.Length)
iris.new$Sepal.Width<- normalize(iris.new$Sepal.Width)
iris.new$Petal.Length<- normalize(iris.new$Petal.Length)
iris.new$Petal.Width<- normalize(iris.new$Petal.Width)

cat("\nDatos normalizados:\n\n")
head(iris.new)

# aplicamos el algoritmo de clustering k-meas
result<- kmeans(iris.new,3) #aplly k-means algorithm with no. of centroids(k)=3

result$size # gives no. of records in each cluster
result$centers # gives value of cluster center datapoint value(3 centers for k=3)
result$cluster #gives cluster vector showing the custer where each record falls

#checking how the diffrent petal families are getting grouped
table(result$cluster, iris$Species)

# descomenta la siguiente línea si no tienes instalado ggplot2
#install.packages("ggplot2")

# cargamos ggplot2 
library(ggplot2)

result$cluster <- as.factor(result$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color = result$cluster)) + geom_point()
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()

