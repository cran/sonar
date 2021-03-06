% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sonar.R
\name{TargetStrength}
\alias{TargetStrength}
\title{Target Strength (TS)}
\usage{
TargetStrength(Ir, Ii)
}
\arguments{
\item{Ir}{reflected intensity referred to 1 m from the acoustic centre of the target}

\item{Ii}{incident intensity}
}
\value{
Target Strength (TS)
}
\description{
Returns the Target Strength (TS), the echo returned by an underwater target
}
\examples{
TargetStrength( 900, 1000 )
}
\author{
Jose Gama
}
\references{
Waite A. D., 2002
Sonar for Practising Engineers, 3rd Edition
Chichester: Wiley. pp. 67.
}

