% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/phylo.d2.R
\name{phylo.d2}
\alias{phylo.d2}
\title{Custom phylo.d function}
\usage{
phylo.d2(data, phy, names.col, binvar, permut = 1000, rnd.bias = NULL)
}
\arguments{
\item{data}{a data.frame object}

\item{names.col}{A *string* specifying the column in 'data' that matches rows to tips in 'phy'}

\item{tree}{An object of class 'phylo'}
}
\value{
See \link[caper]{phylo.d}
}
\description{
A custom re-make of phylo.d in caper which allows character strings as arguments
See \link[caper]{phylo.d} for more detailed information.
}
\keyword{&}
\keyword{Fritz}
\keyword{Purvis}
\keyword{excd,}
\keyword{phylo.d,}
