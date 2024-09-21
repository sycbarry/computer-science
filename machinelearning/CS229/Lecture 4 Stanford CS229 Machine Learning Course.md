## Perceptron

Logistic Regression, uses functions to "force" output values to either 0 or 1 exactly. We can do so using certain functions, that help us map the model's output to a probability.

***Sigmoid Function***
$$ 
g(z) = \frac{1}{1 + e^{-2}}
$$
***Threshold Function***
$$ 
g(z) = \begin{cases}
1 & \text{if } z \geq 0 \\
0 & \text{if } z < 0
\end{cases}
$$

***The Perception Algorithm***
$$
\theta_j := \theta_j + \alpha(y^i - h_\theta(x^i))x_j^i
$$
	where `𝜶(x)` = scalar and rotates the decision boundary. We want to get all `x` values within the decision boundary. We are essentially adding two vectors together where the third vector get's closer to the first one..

If the input value is mis-classified, we update the vector values thus updating the decision boundary.
![[Screenshot 2024-09-16 at 8.10.26 AM.png]]


==There are limitations to the perceptron, as there are sometimes difficulties when classifying certain values in the input data. (data points are really scattered). How often we train the model, the decision boundary just doesn't align correctly==

---
# Generalized Linear Models

## Exponential Family
A class of probability distributions.
An exponential family, who's PDF (prob density function), can be written in the form: 
> [[LearningNotes.pdf#page=30&selection=63,28,112,0|LearningNotes, page 30]]

> p(y;\eta) where y is the input data. We use the exponential families to model the output data.

> \eta is the natural parameter. 

> \T(y) is the sufficient statistic. T(y) can be replaced with y. 

> b(y) is called the base measure. 

> a(\eta) is called the log partition function.


Depending on the input data, we can choose any of the following
	Real #'s - Gaussian 
	Binary - Bernoulli
	Count - Poission
	R+ -  Gamma, Exponential (Distribution)
	Distribution - Beta, Dirichlet (Show up in Bayesian ML/Stats)

Exponential Families / Mathematical Properties 
1. MLE w/re η => concave 
	NLL is convex.
2. Expectation of \[y;η] = d/d_eta a(n)
3. Var = d^2/d\eta^2 (a(n))


##### Bernoulli Distribution (Models Binary Data)

##### Gaussian Distribution (with fixed variance)
- has two parameters the mean and the variance. We can have variable variance too. 

## GLM (Generalized Linear Models)
- Are like exponential families, that include input features. 

Assumptions / Design Choices That take us from EXP Families to GLMs
![[Screenshot 2024-09-16 at 8.49.14 AM.png]]


#### GLM Train Time

Learning update rule is the same regardless of GLM we use. 
$$
\theta_j = \theta_j + \alpha(y^i - h_\theta * x^i)x_j^i
$$

***Terminology***
`η` -> is called the natural parameter
$E[y;η] = g(η)$ -> Canonical response function
$\eta = g^-1(\mu)$ -> canonical line function

***3 parameterizations***
$\theta$ Model Parameter
$\eta$ Natural Parameter
$\phi$  Bar
$\lambda$ poisson

*Logistic Regression*
The mean of the Bernoulli distribution is phi in the canonical parameter space. 
$h_\theta(x)=E[y|x;\theta] = \phi = \frac{1}{1+e^-n}=\frac{1}{1+e^-\theta*x}$

==Note==
The task at hand, (regression or classification), we use the appropriate distribution we want to choose.
- regression we choose a distribution over real #'s like Gaussian
- logistic/classification we choose a distribution over binary data.

## Softmax Regression 
(Multiclass Classification)

This is another member of the GLM family. Softmax is also doing a `cross entropy` minimization.

![[Screenshot 2024-09-17 at 8.26.22 AM.png]]

Given an input, we want to determine whether the point is a circle, triangle, square. This image has 3 shapes but can n amount of classes. 

`k` = # of classes. 
$x^i \epsilon R^n$
 Label $y = [{0}^k] eg [0, 0, 1, 0]$
$\theta_class \eta R^n$ where class $\epsilon \{△, circle, square\}$
