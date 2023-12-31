% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/alignment.R
\name{impute}
\alias{impute}
\title{Imputes the missing values}
\usage{
impute(eSet, ptrSet, parallelize = FALSE, nbCores = 2)
}
\arguments{
\item{eSet}{ExpressionSet returned by the \code{\link[ptairMS]{alignSamples}} 
function}

\item{ptrSet}{\code{\link[ptairMS]{ptrSet-class}} object processed by the 
\code{\link[ptairMS]{detectPeak}} function}

\item{parallelize}{boolean. If \code{TRUE}, the loop over all files will be 
parallelized}

\item{nbCores}{number of clusters to use for parallel computation.}
}
\value{
the same ExpressionSet as in input, with the imputed missing values 
in the assayData slot
}
\description{
Imputes missing values by returning back to the raw data and fitting the 
peak shape function on the noise (or on the residuals signals if peaks have 
already been detected).
}
\examples{
library(ptairData)
dirRaw <- system.file("extdata/exhaledAir", package = "ptairData")
exhaledPtrset <- createPtrSet(dir=dirRaw, 
setName="exhaledPtrset", mzCalibRef = c(21.022, 60.0525),
fracMaxTIC = 0.7, saveDir = NULL )
exhaledPtrset<-detectPeak(exhaledPtrset,mz=c(21,52))
eSet <- alignSamples(exhaledPtrset,pValGreaterThres=0.05,fracGroup=0)
Biobase::exprs(eSet)
eSet <- impute(eSet,exhaledPtrset)
Biobase::exprs(eSet)
}
