
## Linear Regression
This is the simplest regression algorithm.
We always start with a good dataset that we collect.

```
(Training Set that get's fed to a learning algorithm) 
	-> h 
	
h(x) 
	-> estimated price
```

h is the hypothesis.

Ask yourself these questions (when designing ML models)
(1) What is the workflow
(2) What is the dataflow
(3) What is the hypothesis.

How do we represent h?
- h can take in multiple features

>$$
h(x) = \sum_{j=0}^{2} 𝚹_j x_j
$$
>$$
Where -  X_0 = 1
$$

This becomes
> $$ 𝚹 = [ 𝚹_1, 𝚹_2, 𝚹_3 ] $$
> $$ x = [ x_1, x_2, x_3 ] $$

---
#### Terms

> 𝚹 = parameters. 
	The job of the learning algorithm is to choose parameter theta that allows to make good decisions (y) for inputs to h.

> m = # of training examples.
	(# of rows in a table as an example to feed into an ML model)

> x = inputs (features)
- Θ_1 and x_1 are pairwise in a learning equation. One feature and one parameter.

> y = output

> (x,y) = "training example"

$$ (x^i, y^i) $$
					*Training run.


> n = # of features

---

#### Linear Regression Learning Algorithm

*Given the data set and given that we define the hypothesis like above, how do we choose parameters theta?*

Choose 𝚹 such that h(x) ~ y for the training examples. We minimize the squared different below, or the cost function.

>*Cost function*
$$
J(𝚹) = 1/2\sum_{i=1}^{m} (h_𝚹(x^i) - y)^2
$$
> *In order to minimize the cost function, we use gradient descent*

Start with some initial value of Θ.
Keep changing value of Θ to reduce `J(Θ)` 

#### Gradient Descent Algorithm

We just tweak and modify the value of theta. 



>*Gradient Descent*
$$
Θ_j := Θ_j - \alpha \frac{\delta}{\delta\theta_j }J(\theta)
$$

Where alpha is the learning rate. Some hyperparameter we set in the overall program/input.


>**a** *Partial Derivative With respects to Θ*
$$
\frac{\delta }{(\delta \theta_j)} J(\theta)
$$

We repeat the gradient descent until convergence. 
here we start at x.
![[Screenshot 2024-09-13 at 8.00.15 PM.png]]
![[Screenshot 2024-09-13 at 8.03.58 PM.png]]
**Note**
We try a few values to see what value of the learning rate allows us to more efficiently of `J(\theta)'

If we see the cost function increasing, that is a good sign that the learning rate is too large.


## Batch / Stochastic Gradient Descent

#### Batch 

Batch Gradient Descent always reaches the global minima. 
This is optimal when trying to optimize the output.

#### Stochastic 

In practice, SGD is used much more commonly in practice due to it's efficiency over large data sets. 
- in practice we can reduce the learning rate over time. This allows us to make smaller and smaller adjustments to the gradient throughout the lifecycle of the algorithm.

>*Stochastic Gradient Descent*

```
Repeat: 
{
	for i = i to M do 
		theta = theta_1 - alpha ( prediction )
}
```

## Normal Equation

The normal equation only works for the pure linear regression algorithm. It allows us to hop directly to the optimal value for \theta 

"Trace" of a Matrix. Sum of the diagonal entries in a Matrix.

Trace of A = Trace of Transpose(A)



