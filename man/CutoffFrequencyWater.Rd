% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sonar.R
\name{CutoffFrequencyWater}
\alias{CutoffFrequencyWater}
\title{Calculation of cutoff frequency in water from Jensen et Al 2011}
\source{
Finn B. Jensen, William A. Kuperman, Michael B. Porter, Henrik Schmidt, 2011
Computational Ocean Acoustics, 2nd Edition. Springer. pp. 26
}
\usage{
CutoffFrequencyWater(Cw, D)
}
\arguments{
\item{Cw,}{velocity of sound in water}

\item{D,}{depth in meters of isothermal surface layer}
}
\value{
the cutoff frequency (Hz)
}
\description{
Returns the cutoff frequency in water from Jensen et Al 2011
}
\examples{
CutoffFrequencyWater(3000, 1)
}
\author{
Jose Gama
}

