library(DBI)
#----------------------Conectar a nuestro servidor-----------------------------#
connect_own<-function() {
  
  options(mysql = list(
    "host" = "localhost", 
    "port" = 3306,
    "user" = "abel",
    "password" = "T77vqlra$"
    
  ))
  
  
  db <- RMySQL::dbConnect(RMySQL::MySQL(), dbname = "PROYECTO_3",
                          host = options()$mysql$host, 
                          port = options()$mysql$port, user = options()$mysql$user, 
                          password = options()$mysql$password)  
  
  
  
  return(db)
}

con_own <- connect_own()
table <- dbReadTable(con_own, "Tabla_Proyecto_3")
data <- data.frame(table)
#--------------------------Visualizacion de los Datos-------------------------#
str(data)
names(data)
head(data)
summary(data)

sd(data$Age)
sd(data$Annual.Income..k..)
sd(data$Spending.Score..1.100.)

barplot(table(data$Gender), legend.text=rownames(table(data$Gender)), 
  col = c("red", "lightblue"), main = "Gender comparasion")

library(plotrix)
porcent <- (table(data$Gender)/sum(table(data$Gender)) * 100)
pie3D(table(data$Gender), labels = paste(row.names(porcent), porcent, "%"),
      main = "Percent of woman and man")

hist(data$Age, col = "royalblue", xlab = "Age", main = "Distribution of Age ")

boxplot(data$Age, main = "Boxplot de Edad", col = "seagreen")

hist(data$Annual.Income..k.., col = "violetred4",
     xlab = "Ingresos", main = "Histograma de Ingresos", labels = TRUE)

plot(density(data$Annual.Income..k..),main = "Density of Annual Income", xlab = "Income") 
polygon(density(data$Annual.Income..k..),col = "#39a9cb")

boxplot(data$Spending.Score..1.100., 
        main = "Boxplot Sependig Score", col = "mediumorchid1", horizontal = TRUE)

hist(data$Spending.Score..1.100., col = "mediumpurple",
     xlab = "Spending Score", main = "Spending Score", labels = TRUE)

#----------------------------Algoritmo K-means---------------------------------#
library(purrr)
set.seed(2021)
data_clustering <- cbind.data.frame(data$Annual.Income..k..
                                    , data$Spending.Score..1.100.)
names(data_clustering)[1] <- "IncomeAnnual"
names(data_clustering)[2] <- "SpendingScore"

plot(x = data_clustering$IncomeAnnual, y = data_clustering$SpendingScore, ylab = "Spending Score"
     , xlab = "Income Annual", main = "Customer clustering per Income and Spend")

kmeans_tot_withinss <- c()

for (k in c(1:10)) {
  k_means <- kmeans(data_clustering,k,iter.max = 100, 
                    nstart = 100, algorithm = "Lloyd" )
  kmeans_tot_withinss[k] <- k_means$tot.withinss
  
}

kmeans_tot_withinss
plot(c(1:10), kmeans_tot_withinss, type = "o", main = "ELbow Method", xlab = "Cluster"
     , ylab = "Total within-cluster sum of squares")
#----------------------Average Silhouette Method------------------------------#
library(cluster)
library(factoextra)
library(ggplot2)
average_sil <- c()
for (i in c(2:9)) {
  k<-kmeans(data_clustering, i,iter.max=100,nstart=50,algorithm="Lloyd")
  #silh_plot<-plot(silhouette(k$cluster,dist(data_clustering,"euclidean")))
  s <- silhouette(k$cluster,dist(data_clustering,"euclidean"))
  average_sil[i-1] <- mean(s[,3])
}
plot(c(2:9), average_sil, type = "o", main = "Silhouette Method", xlab = "Cluster",
     ylab = "Avg of Sil Method")
final <- kmeans(data_clustering,5,iter.max=100,nstart=50,algorithm="Lloyd")
fviz_cluster(final, data = data_clustering)



