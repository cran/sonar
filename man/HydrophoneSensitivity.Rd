% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sonar.R
\name{HydrophoneSensitivity}
\alias{HydrophoneSensitivity}
\title{Hydrophone Sensitivity}
\usage{
HydrophoneSensitivity(p, v)
}
\arguments{
\item{p}{sound pressure in micropascals at the hydrophone}

\item{v}{voltage at the open circuit terminals}
}
\value{
Hydrophone Sensitivity (dB/V)
}
\description{
Returns the Hydrophone Sensitivity
}
\examples{
HydrophoneSensitivity( 1000, 2 )
}
\author{
Jose Gama
}
\references{
Waite A. D., 2002
Sonar for Practising Engineers, 3rd Edition
Chichester: Wiley. pp. 9.
}

