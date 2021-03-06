% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sonar.R
\name{SpeedOfSoundFreshWaterGrossoMader}
\alias{SpeedOfSoundFreshWaterGrossoMader}
\title{speed of sound (m/s) in fresh water from Grosso and Mader}
\source{
National Physical Laboratory, 2015
Underwater Acoustics Technical Guides - Speed of Sound in Pure Water
\url{http://support.echoview.com/WebHelp/Reference/Algorithms/Sonar_calculator_algorithms.htm}
}
\usage{
SpeedOfSoundFreshWaterGrossoMader(temperatureC)
}
\arguments{
\item{temperatureC,}{temperatureC in Celsius}
}
\value{
the speed of sound (m/s)
}
\description{
Returns the speed of sound (m/s)
Range of validity: 0-95C, D = 0, error +-0.015
}
\examples{
SpeedOfSoundFreshWaterGrossoMader(25)
}
\author{
Jose Gama
}
\references{
Del Grosso, VA and Mader C.W., 1972
Speed of sound in pure water. J. acoust. Soc. Am., 52, 1442-6.
}

