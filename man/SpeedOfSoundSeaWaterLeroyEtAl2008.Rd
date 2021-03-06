% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sonar.R
\name{SpeedOfSoundSeaWaterLeroyEtAl2008}
\alias{SpeedOfSoundSeaWaterLeroyEtAl2008}
\title{Calculation of speed of sound in sea water from Leroy et Al 2008}
\source{
Leroy, C.C., Robinson, S.P., and Goldsmith, M.J. 2008
A new equation for the accurate calculation of sound speed in all oceans
J. Acoust. Soc. Am., 124, 2774-82.
}
\usage{
SpeedOfSoundSeaWaterLeroyEtAl2008(temperatureC, S, D, L)
}
\arguments{
\item{temperatureC,}{temperature in degrees C 1990 universal temperature scale}

\item{S,}{salinity in \%}

\item{D,}{depth in meters}

\item{L,}{latitude in degrees}
}
\value{
the speed of sound (m/s)
}
\description{
Returns the speed of sound in sea water from Leroy et Al 2008
}
\examples{
SpeedOfSoundSeaWaterLeroyEtAl2008(0, 30, 0, 0)
}
\author{
Jose Gama
}

