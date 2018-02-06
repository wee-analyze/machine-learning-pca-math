# machine-learning-pca-math
How to reduce dataset dimensions using PCA with vector multiplication

Programming language: R

Machine learning datasets can have millions of features and often those features are similar to one another and end
up wasting computer resources when performing calculations: this also leads to waiting longer for results. Principal Component
Analysis is a way that we can reduce the dimension (features) of data and retain high variance which is much more ideal for
running machine learning algorithms.

This repository focuses on using vector multiplication to show the mathematics behind PCA instead of just using 
the PCA function in order to see "under the hood" of the analysis.

Steps to calculating PCA:
1. standardize data
2. Make covariance matrix of data 

covariance = (1 / # of data samples) * X' * X

3. Find eigenvectors and singular value of covariance matrix using Singular Value Decomposition.
4. Determine minimum # of principal components which retains at least 95% variance
- using the singular values you can calculate k by adding the values starting from index 1 to a certain index
and diving that by the total sum of the all singular values so that it is >= 95%. Keep the number of principal components 
from column index 1:k.
5. Project standardized dataset examples onto the kept principal components. The dataset is now reduced and can be used
for running algorithms.

reduced dataset = scaled data x selected principal components

* 6. Additionally, it is possible to implement a vector multiplication on the reduced dataset that will return 
a dataset very similar to the original standardized dataset.

expansion = reduced data x (selected principal component matrix)'

##################################################

Included in this repository in a wine quality dataset from https://archive.ics.uci.edu/ml/datasets/wine+quality. This dataset has
12 features and was reduced to 9 with 95% retained variance. If I had dataset with 1,000,000 features, PCA could possibly 
reduce the features by hundreds of thousands which would make processing much more efficient.
