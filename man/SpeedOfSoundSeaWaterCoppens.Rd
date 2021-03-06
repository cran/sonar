% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sonar.R
\name{SpeedOfSoundSeaWaterCoppens}
\alias{SpeedOfSoundSeaWaterCoppens}
\title{speed of sound (m/s) in sea water from Coppens 1981}
\source{
A.B. Coppens, 1981
Underwater Acoustics Technical Guides - Speed of Sound in Sea Water
\url{http://resource.npl.co.uk/acoustics/techguides/soundseawater/}
}
\usage{
SpeedOfSoundSeaWaterCoppens(D, S, temperatureC)
}
\arguments{
\item{D,}{depth in meters}

\item{S,}{salinity in parts per thousand}

\item{temperatureC,}{temperature in degrees Celsius}
}
\value{
the speed of sound (m/s)
}
\description{
Returns the speed of sound (m/s)
 Range of validity: temperature 0 to 35 C
 salinity 0 to 45 parts per thousand and depth 0 to 4000 m
}
\examples{
SpeedOfSoundSeaWaterCoppens(0, 35, 25)
}
\author{
Jose Gama
}
\references{
A.B. Coppens, 1981
Simple equations for the speed of sound in Neptunian waters
J. Acoust. Soc. Am. 69(3), pp 862-863
}

