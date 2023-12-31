% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/SetMethods.R
\name{plotFeatures}
\alias{plotFeatures}
\alias{plotFeatures,ptrSet-method}
\title{Plot raw average spectrum around a mzRange}
\usage{
plotFeatures(
  set,
  mz,
  typePlot = "plotly",
  addFeatureLine = TRUE,
  ppm = 2000,
  pdfFile = NULL,
  fileNames = NULL,
  colorBy = "rownames"
)

\S4method{plotFeatures}{ptrSet}(
  set,
  mz,
  typePlot = "plotly",
  addFeatureLine = TRUE,
  ppm = 2000,
  pdfFile = NULL,
  fileNames = NULL,
  colorBy = "rownames"
)
}
\arguments{
\item{set}{a \code{\link[ptairMS]{ptrSet-class}} object}

\item{mz}{the mz values to plot}

\item{typePlot}{set "plotly" to get an interactive plot, or "ggplot"}

\item{addFeatureLine}{boolean. If TRUE a vertical line at the mz masses 
is plotted}

\item{ppm}{windows size of the plot round \code{mz} in ppm}

\item{pdfFile}{a file path to save a pdf with a individual plot per file}

\item{fileNames}{vector of character. The file names you want to plot. 
If \code{NULL}, it plot all files}

\item{colorBy}{character. A column name of sample metadata by which 
the line are colored.}
}
\value{
a plotly or ggplot2 object
}
\description{
Plot the raw data spectrum for several files in a ptrSet object around 
the \code{mz} masses. The expiration average spectrum is in full lines, 
and background in dashed lines.
}
\examples{
dirRaw <- system.file("extdata/exhaledAir", package = "ptairData")
exhaledPtrset <- createPtrSet(dir=dirRaw, 
setName="exhaledPtrset", mzCalibRef = c(21.022, 60.0525),
fracMaxTIC = 0.7, saveDir = NULL )
plotF<-plotFeatures(exhaledPtrset ,mz=59.049,type="ggplot",colorBy="subfolder")
print(plotF)
}
