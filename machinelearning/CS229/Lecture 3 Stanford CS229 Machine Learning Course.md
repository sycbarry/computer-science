
## Locally Weighted Regression 

Parametric Learning Algorithms. We can fit certain set of parameters such as `Θ_i` to delta
- no matter how big the training set is, we fit the params to `Θ_i` then we can erase the training set from the computer memory and build predictions.

LWR is a non-parametric learning algorithm.
- the amount of data/parameters we need to keep grows linearly with the size of the training set.
- we need to keep all of the original data in memory.

**For LR, say we have a data set like this:** 

![[Screenshot 2024-09-14 at 10.24.41 AM.png]]
> to evaluate h at certain x
> - fit Θ to minimize: 
>  $$
	\frac{1}{2} \sum_i (y^i - \theta^t x^i)^2
$$
 () => Return theta^t x

**For LWR**
We focus on a smaller subset of data and make a prediction in that area of x
![[Screenshot 2024-09-14 at 10.29.35 AM.png]]

*LWR*
Fit Θ to minimize the cost function where w^i is a "weight function".
- the main consideration for LWR is that we added the w^i weighting term to the cost function

where w^i = $$ w(i) = exp(-\frac{(x^i - x)^2}{2\tau^2}) $$
`𝜏` is the "bandwidth", or the width that we decide to chose the points around the curve from. This is a hyperparameter we adjust. The choice of  `𝜏` makes a difference with under fitting and/or overfitting the data
![[Screenshot 2024-09-14 at 10.41.36 AM.png]]

LWR says that if an example is x^i is far away from the prediction, multiple that constant by zero. If it's close, multiple that error term by 1.
- the net effect is that the algorithm sums over only the terms for the examples that are close to where we want to make a prediction.

When we fit \theta over the data, we tend to focus only on the points that are closest to the correct prediction output.
![[Screenshot 2024-09-14 at 10.37.24 AM.png]]

===***We should use LWR when the # of features are not too big. When we have a lot of data and we don't want to determine what features to use.***===

## Why Least Squares?

for housing predictions, assume that we have a true price of every house.

Assume: 
$$
y(i) = \theta^T x(^i) + \epsilon^i
$$
										\epsilon "error" random noise.

\epsilon is the normal distribution. `Θ` is the true price of something
![[Screenshot 2024-09-14 at 10.50.56 AM.png]]

Under the assumptions that this is a gaussian distribution, 

The likelihood of `Θ` = probability of the data.
(likelihood of theta does mean that theta are random variables)

CLM (central limit theorem) in statistics, most distributions are Gaussian.
- Gaussian has become the default noise distribution.


##### Log Likelihood

$$ l(\theta) = log(\theta)$$
Maximize likelihood estimation. 
Choose `Θ` to maximize L(\theta) 
IE, choose \theta to minimize the cost function: 
$$
J(\theta) = 1/2 \sum_{i=1}^M (y^i - \theta^t x^i)^2
$$



## Classification 

Binary Classification
$$ 
y\epsilon \{0, 1\}
$$
![[Screenshot 2024-09-14 at 11.12.07 AM.png]]

Linear regression (like above), is not a good prediction algorithm for classification problems.

If we have an X all the way to the right on that graph, the line of best fit shifts and makes the line not a proper prediction metric.
#### Logistic Regression 

We want to output that are 0 to 1. Binary classification.
$$ h_\theta(x) \epsilon[0, 1] $$ 
The "hypothesis" to output all values from 0 to 1 given input data.

![[Screenshot 2024-09-14 at 11.16.50 AM.png]]

![[Screenshot 2024-09-14 at 11.17.01 AM.png]]

This takes as input the \theta^t * x and passes the product into a LR function, that sets the values b/w 0 and 1. This "classifies" the output.

***The two probabilities (given classification) must add up to 1 (100%)***
$$
A = P(y=1 | x; \theta) = h_\theta(x)
$$
$$
B = P(y=0 | x; \theta) = 1- h_\theta(x)
$$
$$ 
:: A + B = 1
$$
We can compress the two equations above into a single equation.

$$
P(y|x;\theta) = h(x)^y * (1-h(x))^{1-y}
$$

We can take the log likelihood to make things simpler: 
$$
l(\theta) = log * L(\theta)
$$
$$
= \sum_{i=1}^M y^i * log * h_\theta (x^i) + (1-y^i) * log(1-h_\theta(x^i))
$$
We want to choose `Θ` ot maximize l(\theta) above. We can use an algorithm for that.
-> Batch Gradient Ascent
$$
\theta_j := \theta_j + \alpha(\frac{d}{d\theta_j})  l(\theta)
$$
==Note==, instead of using J(\theta), or the cost function to update theta, we use the log likelihood and optimize the log likelihood. We use the + to maximize the log likelihood.

Gradient Ascent tries to climb up the hill in the parabola.
![[Screenshot 2024-09-14 at 11.37.16 AM.png]]

## Newton's method
Gradient Ascent is relatively slow, as it makes baby steps towards a local maxima.
We can optimize that process.

Example: 
Say we have f. 
We want to find theta such that `f(theta) = 0`
- we want to maximize `l(theta)`
- i.e we want to the value where `l'(theta) = 0`

This is how NM works visually.
![[Screenshot 2024-09-14 at 11.47.49 AM.png]]

NM, uses "Quadratic Convergence"
- under certain assumptions, the # of significant digits doubles with every iteration.
- this is why the algorithm is very efficient, as after a few iterations we can get to the proper error value or goal.







