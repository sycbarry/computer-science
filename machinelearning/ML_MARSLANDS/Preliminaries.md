**Dimensionality**
The # of elements in the vector is called the **dimensionality** of the vector. 

**Output Vector**
The output vector is $y$ 

We can measure the distances b/w inputs and neurons by computing the Euclidian Distance.
$$
d = \sqrt{(x_1 - x_2)^2 + (y_1 - y_2)^2 .}
$$
**Curse of Dimensionality**

As the # of dimensions increase the volume of the unit hypersphere does not increase with it. In higher dimensions, the sphere becomes a hypersphere. For ML, this means that as we increase dimensions of features and classifications, we must also increase the # of data points we use in the model.

**Overfitting**
We have learnt about the noise and inaccuracies in the data as well as the actual function. This is not optimal, because we always want the model to generalize more effectively.

**Training, Testing, Validation Sets**
We always want to split our data in these 3 categories with a level of randomness associated with each data point.

- if we are really sort of training data or data sets in general ,we can use **multi-fold cross-validation**

**Multi-fold cross-validation**
This takes our data and splits it into $K-subsets$ .  One subset is used as validation while the algorithm is used on all other sets. 
- A different subset is then left out and a new model is trained on that subset, repeating the same process for all of the different subsets. 
- The model that produces the lowest validation error is tested and used.

**Confusion Matrix**
- This is a matrix that contains all possible classes in both the horizontal and vertical directions. 
- For each output of the model, we can use the confusion matrix to show the predictions of each model output.

$$
Outputs
\begin{bmatrix} 
 & & Class_{1} & Class_{2} & Class_{3} \dots \\
 & Class_{1} & 5 & 2 & 3\\
 & Class_{2} & 2 & 8 & 1\\
 & Class_{3} & 3 & 4 & 8
\end{bmatrix}
$$
	 The leading diagonal is the correct output of the model.

- **for a small # of classes, this is useful**

**Accuracy Metrics**
- FP (False positive values)
- FN (False negative values)
- TP (True positives)
- TN (True negatives)

$accuracy$ is defined as the sum of the number of true positives and true negatives divided by the total # of examples.
$sensitivity$ (true positive rate) is the ratio of the # of correct positive examples to the # classified as positive.
$specificity$ is the same ratio for negative examples.

We can collate all of the scores together into a single # called the $F_1$ score.
$$
F_1 = 2*\frac{precision \space * \space recall}{precision \space + \space recall}
$$

**ROC Curve**
Using a plot, we can determine if the classification model performed well. The higher the area is under the curve, the better the model performed.  
- If we multiple classifiers, we can plot multiple ROC curves against each (respectively) and determine which performed better by measuring the area under the curve. 

**Un-Balanced Datasets**
It is often not true that the input dataset contains a balanced amount of positive and negative record of data.
Using $Matthew's Correlation Coefficient$ we can measure something called the $Balanced Accuracy Score$ as the sum of sensitivity and specificity / 2.

**Measurement Precision**
This measures the variability of the algorithm, more known as precision and it tells us how repeatable the predictions that the algorithm makes are.
- variability of the probability distribution.

- Just because a model is precise, it does not mean that it is accurate.
- $trueness$ helps us map how well the model's predictions are to reality.
	 trueness = average distance b/w the correct output and the predictions

**Variance and Covariance**

$variance$ of the set of #'s is a measure of how spread out the values are. 
- it is computed as the sum of the squared distances b/w each element in the set and the expected value of the set (the mean $\mu$) 

$standard \space deviation$ is the square root of the variance.

$covariance$ can provide us detail on how two variables vary together.

$covariance \space matrix$ computes the covariance of each pair in a dataset.
- it says how the data varies along each data dimension and how each data point relates to other data points in the matrix. 
- if the data is tightly controlled, then the test point we choose is close to the mean.
- if the data is highly spread out, then the distance of the test point from the mean does not matter as much (low correlation)
	- this can be constructed to form a distance measure called $Mahalanobis \space Distance$
	covariance matrix: ``` np.cov(x)``` 
	inverse: ```np.linalg.inv(x)```


$Probability \space Distribution$
- describes the probabilities of something occurring over the range of possible feature values.  
- We can use the $Central \space Limit \space Theorem$, which says that lots of small data points add up to something looking like a $Gaussian \space Distribution$

**Bias-Variance Tradeoff**

Bias 
- A model is not accurate and does not match the data well. 

Variance 
- a model is not very precise and there is a lot of variation in the results.

For these two expressions, we usually have to make a tradeoff b/w the two. We cannot have both be perfect but must choose b/w a high variance and a lower bias or vice-versa.

- Choosing the complexity of the model is important to get good results. Some models are better than others. 

the most common way of choosing the error b/w the targets and the predicted outputs is to sum up the squares of the difference b/w (variance and bias).