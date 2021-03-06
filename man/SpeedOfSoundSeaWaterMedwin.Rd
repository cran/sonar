% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sonar.R
\name{SpeedOfSoundSeaWaterMedwin}
\alias{SpeedOfSoundSeaWaterMedwin}
\title{speed of sound (m/s) in sea water from Medwin 1975}
\source{
X Lurton, 2002
 An Introduction to Underwater Acoustics, 1st ed.
 London, Praxis Publishing LTD
}
\usage{
SpeedOfSoundSeaWaterMedwin(temperatureC, D, S)
}
\arguments{
\item{temperatureC,}{temperature in degrees Celsius}

\item{D,}{depth in meters}

\item{S,}{salinity in parts per thousand}
}
\value{
the speed of sound (m/s)
}
\description{
Returns the speed of sound (m/s) (approximation)
 Range of validity: limited to 1000 meters in depth
}
\examples{
SpeedOfSoundSeaWaterMedwin(0, 1, 30)
}
\author{
Jose Gama
}
\references{
Medwin H, 1975
Speed of sound in water: A simple equation for realistic parameters
Journal of the Acoustical Society of America, 58, 1318-1319, 1975
}

