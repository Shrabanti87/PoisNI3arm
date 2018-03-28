# PoisNI3arm
### R codes for "Bayesian and Frequentist Approaches for Testing Non-inferiority for Three-arm Trials with Poisson Outcome"

We provide the codes that generate the power curves for varying parameters, sample size table and the posterior probabilities in the real data setting for both Frequentist and Bayesian approaches. Throughout the simulation codes the following parameters are used:

lamE, lamR and lamP: The Poisson rate parameter in the arm E, R and P respectively, 
nP=n: The sample size in the placebo arm (P), 
nR: The sample size in the reference arm (R), 
nE: The sample size in the experimental arm (E), 
theta: effect retention parameter
r.alloc: Allocation vector which can be (1,1,1), (1,2,2) or (1,2,3)
N: Total sample size

We give brief description of the R files below:

```
power_poisson_functions.R: This file contains all functions that need to be sourced first. The main functions, arguments and outputs are described below:
```
```
1. power_theta_fn_freq: This function generates the Frequentist power curve for a particular value of theta for a given allocation and sample size.
Argument: theta: effect retention parameter
Output: Power values for a rangle of lamE
```

```
2. samplesize_fn_freq: This function calculates the Frequentist sample size for a particular value of theta for a given allocation and lamE.
Arguments: 
r.alloc: Allocation vector
lamE: lambda of the arm E
theta: effect retention parameter
Output: Minimum sample size n=nP of the arm P satisfying power>=0.8
```

```
3. power_theta_fn_fbayes: This function generates the Bayesian power curve for a particular value of theta for a given allocation and sample size.
Argument: theta: effect retention parameter
Output: Power values for a rangle of lamE
```

```
4. samplesize_fn_fbayes: This function calculates the Bayesian sample size for a particular value of theta for a given allocation and lamE.
Arguments: 
r.alloc: Allocation vector
lamE: lambda of the arm E
theta: effect retention parameter
a_max: maximum range of search for the Bayesian sample size
Output: Minimum sample size n=nP of the arm P satisfying power>=0.8
```

```
5. power_theta_fn_info: This function generates the informative Bayesian power curve for a particular value of theta for a given allocation and sample size.
Argument: theta: effect retention parameter
Output: Power values for a rangle of lamE
```

```
6. power_theta_fn_noninfo: This function generates the non-informative Bayesian power curve for a particular value of theta for a given allocation and sample size.
Argument: theta: effect retention parameter
Output: Power values for a rangle of lamE
```

```
7. samplesize_fn_approxbayes: This function calculates the sample size under approximation-based Bayesian approach for a particular value of theta for a given allocation and lamE.
Arguments: 
r.alloc: Allocation vector
lamE: lambda of the arm E
theta: effect retention parameter
Output: Minimum sample size n=nP of the arm P satisfying power>=0.8
```

```
8. power_theta_fn_nonconjug: This function generates the non-conjugate Bayesian power curve for a particular value of theta for a given allocation and sample size.
Arguments: 
theta: effect retention parameter
N: Total sample size
Output: Power values for a range of lamE
```

```
9. data.info1: This function calculates the Bayesian posterior probability under informative prior for a particular value of theta for the year 1 data.
Argument: theta: effect retention parameter
Output: Posterior probability values for a range of lamE
```

```
10. data.info2: This function calculates the Bayesian posterior probability under informative prior for a particular value of theta for the year 2 data.
Argument: theta: effect retention parameter
Output: Posterior probability values for a range of lamE
```

```
11. data.noninfo1: This function calculates the Bayesian posterior probability under non-informative prior for a particular value of theta for the year 1 data.
Argument: theta: effect retention parameter
Output: Posterior probability values for a range of lamE
```

```
12. data.noninfo2: This function calculates the Bayesian posterior probability under non-informative prior for a particular value of theta for the year 2 data.
Argument: theta: effect retention parameter
Output: Posterior probability values for a range of lamE
```

```
13. data.nc.info1: This function calculates the Bayesian posterior probability under non-conjugate informative prior for a particular value of theta for the year 1 data.
Argument: theta: effect retention parameter
Output: Posterior probability values for a range of lamE
```

```
14. data.nc.info2: This function calculates the Bayesian posterior probability under non-conjugate informative prior for a particular value of theta for the year 2 data.
Argument: theta: effect retention parameter
Output: Posterior probability values for a range of lamE
```

```
15. data.nc.noninfo1: This function calculates the Bayesian posterior probability under non-conjugate non-informative prior for a particular value of theta for the year 1 data.
Argument: theta: effect retention parameter
Output: Posterior probability values for a range of lamE
```

```
16. data.nc.noninfo2: This function calculates the Bayesian posterior probability under non-conjugate non-informative prior for a particular value of theta for the year 2 data.
Argument: theta: effect retention parameter
Output: Posterior probability values for a range of lamE
```


