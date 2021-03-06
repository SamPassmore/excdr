% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pair_dplace.R
\name{pair_dplace}
\alias{pair_dplace}
\title{Pair a D-Place csv file to a D-place phylogeny}
\usage{
pair_dplace(tree, csv, family)
}
\arguments{
\item{tree}{an object of class phylo or list of phylo objects}

\item{csv}{the imported dataframe from D-PLACE}

\item{id}{character of the language family for which you have a phylogeny for (e.g. "austro", "bantu" or "uto-aztecan")}
}
\value{
\item{data} a dataframe subset to those societies existing in tree
\item{phy} a phylogeny pruned to match the data you input
}
\description{
When downloading a phylogeny and csv file from D-place there is no direct link between the two files. This function will connect the two using additional identifying files.
}
\keyword{d-place,}
\keyword{excd,}
\keyword{phylogeny}
