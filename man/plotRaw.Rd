% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/Raw_Methods.R, R/SetMethods.R
\name{plotRaw}
\alias{plotRaw}
\alias{plotRaw,ptrRaw-method}
\alias{plotRaw,ptrSet-method}
\title{Plot method for 'ptrRaw' objects}
\usage{
plotRaw(
  object,
  mzRange,
  timeRange = c(NA, NA),
  type = c("classical", "plotly")[1],
  ppm = 2000,
  palette = c("heat", "revHeat", "grey", "revGrey", "ramp")[1],
  showVocDB = TRUE,
  figure.pdf = "interactive",
  ...
)

\S4method{plotRaw}{ptrRaw}(
  object,
  mzRange,
  timeRange = c(NA, NA),
  type = c("classical", "plotly")[1],
  ppm = 2000,
  palette = c("heat", "revHeat", "grey", "revGrey", "ramp")[1],
  showVocDB = TRUE,
  figure.pdf = "interactive",
  ...
)

\S4method{plotRaw}{ptrSet}(
  object,
  mzRange,
  timeRange = c(NA, NA),
  type = c("classical", "plotly")[1],
  ppm = 2000,
  palette = c("heat", "revHeat", "grey", "revGrey", "ramp")[1],
  showVocDB = TRUE,
  figure.pdf = "interactive",
  fileNames = NULL,
  ...
)
}
\arguments{
\item{object}{An S4 object of class \code{ptrRaw-class} or \code{ptrSet}}

\item{mzRange}{Either a vector of 2 numerics indicating the m/z limits
or an integer giving a nominal m/z}

\item{timeRange}{Vector of 2 numerics giving the time limits}

\item{type}{Character: plot type; either 'classical' [default] or 'plotly'}

\item{ppm}{Integer: Half size of the m/z window when mzRange is set to a
nominal mass}

\item{palette}{Character: Color palette for the 'classical' plot; either 'heat'
[default], 'revHeat', 'grey', 'revGrey' or 'ramp'}

\item{showVocDB}{Logical: Should putative m/z annotations from the internal
package database be displayed (default is TRUE)}

\item{figure.pdf}{Character: Either 'interactive' [default], or the filename
of the figure to be saved (with the 'pdf' extension); only available for the
'classical' display}

\item{...}{not used}

\item{fileNames}{vector of character. The file names of the ptrSer that you 
want to plot. Could be in 
basename or fullname.}
}
\value{
Invisibly returns a list of the raw (sub)matrix 'rawsubM' and
the voc (sub)database 'vocsubDB'
}
\description{
Displays the image of the matrix of intensities, the TIC and the TIS,
for the selected m/z and time ranges
}
\examples{
dirRaw <- system.file("extdata/exhaledAir", package = "ptairData")
exhaledPtrset <- createPtrSet(dir=dirRaw, setName="exhaledPtrset", 
mzCalibRef = c(21.022, 60.0525), fracMaxTIC = 0.7, saveDir = NULL )
ptairMS::plotRaw(exhaledPtrset ,mzRange=59,fileNames='ind1-1.h5')

patientRaw <- ptairMS::readRaw(system.file('extdata/exhaledAir/ind1/ind1-1.h5',  
package = 'ptairData'),  mzCalibRef=c(21.022,59.049,75.05))
ptairMS::plotRaw(patientRaw, mzRange = 59)
ptairMS::plotRaw(patientRaw, mzRange = 59, type = 'plotly')

}
