# install.packages("dplyr")
library(dplyr)
data_matrix <- read.csv('winequality-red.csv') %>% as.matrix

# data must be standardized for PCA
scaled_data <- scale(data_matrix)

# variables needed
m <- nrow(scaled_data) #number of data samples
n <- ncol(scaled_data) #number of features

# Calculate covariance matrix
covariance_matrix <- (1/m) * (t(scaled_data) %*% scaled_data)

# Calculate Singular Value Decomposition of Matrix to get eigenvectors and singular values. 
svd_return <- svd(covariance_matrix)
principal_components <- svd_return$u
singular_values <- svd_return$d

# Determine number of principal components (k) which will give you at least 95% of variance retained
k <- 9 #choose number of principal components here that gives >= 95% variance
reduced_pc <- principal_components[,1:k]
reduced_dataset <- scaled_data %*% reduced_pc

### Expand reduced dataset back to almost equivalent standardized dataset
expanded_dataset = reduced_dataset %*% t(reduced_pc)
