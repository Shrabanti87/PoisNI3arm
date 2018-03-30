# PoisNI3arm
### R codes for "Bayesian and Frequentist Approaches for Testing Non-inferiority for Three-arm Trials with Poisson Outcomes"

We provide the codes that generates the sample size table under simulation setting for both Frequentist and Bayesian approaches. Throughout the codes the following notations are used for the corresponding parameters:

* lamE, lamR and lamP: The Poisson rate parameter in the arm E, R and P respectively
* nP=n: The sample size in the placebo arm (P)
* nR: The sample size in the reference arm (R)
* nE: The sample size in the experimental arm (E)
* theta: effect retention parameter
* r.alloc: Allocation vector which can be (1,1,1), (1,2,2) or (1,2,3)
* N: Total sample size


We give brief description of the R files below:


1 **`power_poisson_functions.R`** 

This file contains the functions that need to be sourced first to calculate sample size under Frequentist and Bayesian approaches. The main functions, arguments and outputs are described below:


a) **`power_freq`**

This function calculates the Frquentist power for a given sample size, allocation, lamE and theta.

**Arguments**  
* n: Sample size in the arm P
* r.alloc: Allocation vector 
* lamE: lambda of the arm E 
* theta: effect retention parameter 

**Output**  
power: Power for the specified values of the parameters in the arguments


b) **`samplesize_fn_freq`**

This function calculates the Frequentist sample size for a particular value of theta for a given allocation and lamE.

**Arguments**   
* r.alloc: Allocation vector 
* lamE: lambda of the arm E 
* theta: effect retention parameter 

**Output**   
n: Minimum sample size of the arm P satisfying power>=0.8


c) **`power_fbayes`**

This function calculates the fully Bayesian power for a given sample size, allocation, lamE and theta.

**Arguments**  
* n: Sample size in the arm P
* r.alloc: Allocation vector 
* lamE: lambda of the arm E 
* theta: effect retention parameter 

**Output**  
power: Power for the specified values of the parameters in the arguments


d) **`samplesize_fn_fbayes`**

This function calculates the fully Bayesian sample size for a particular value of theta for a given allocation and lamE.

**Arguments**   
* r.alloc: Allocation vector 
* lamE: lambda of the arm E 
* theta: effect retention parameter 
* a_max: maximum range of search for the Bayesian sample size 

**Output**   
n: Minimum sample size of the arm P satisfying power>=0.8


e) **`power_approxbayes`**

This function calculates the approximation-based Bayesian power for a given sample size, allocation, lamE and theta.

**Arguments**  
* n: Sample size in the arm P
* r.alloc: Allocation vector 
* lamE: lambda of the arm E 
* theta: effect retention parameter 

**Output**  
power: Power for the specified values of the parameters in the arguments


f) **`samplesize_fn_approxbayes`** 

This function calculates the sample size under approximation-based Bayesian approach for a particular value of theta for a given allocation and lamE.

**Arguments**  
* r.alloc: Allocation vector
* lamE: lambda of the arm E
* theta: effect retention parameter

**Output**   
n: Minimum sample size of the arm P satisfying power>=0.8


2. **`samplesize_calc.R`**

This file calculates the sample size for 80% power under the Frequentist, fully Bayesian and approximation-based Bayesian approaches across different values of lamE, theta and allocations.


3. **`freq.simulatedpower.R`**

This file calculates the Frequentist simulated power across different values of lamE, theta and allocations using the calculated sample size.


4. **`full.bayes.simulatedpower.R`**

This file calculates the fully Bayesian simulated power across different values of lamE, theta and allocations using the calculated sample size.


5. **`approx.bayes.simulatedpower.R`**

This file calculates the simulated power under approximation-based Bayesian approach across different values of lamE, theta and allocations using the calculated sample size.

