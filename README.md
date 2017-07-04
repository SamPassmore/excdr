# excdr
A R package of useful functions for members of the excd lab (excd.org) at the University of Bristol 


## BayesTraits workflow

The `excdr` package includes a few functions to aid the use of BayesTraits for phylogenetic analysis. 
Here we have an example of the intended use and workflow of these functions

First we start with a dataframe and phylogeny in R. 
For this example I will create some random data

```R
dt <- rtree(n=26)

Q<-matrix(c(-1,0.5,0.5,
            0.5,-1,0.5,
            0.5,0.5,-1),
          nrow = 3, ncol = 3,
            dimnames=list(letters[1:3],letters[1:3]))

st<-sim.history(dt,Q)

x<-data.frame(states = st$states, misc = letters[1:length(st$states)])
```
