% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sonar.R
\name{SpeedOfSoundDryAir}
\alias{SpeedOfSoundDryAir}
\title{Speed of sound in dry air at sea level air density and one atmosphere pressure}
\usage{
SpeedOfSoundDryAir(temperatureC)
}
\arguments{
\item{temperatureC}{numeric, temperature in degrees Celsius accurate to within 1\%}
}
\value{
the speed of sound (m/s)
}
\description{
Returns the speed of sound in dry air at sea level air density
and one atmosphere pressure
}
\examples{
#Speed of sound (dry air, at sea level air density, one atmosphere pressure)
#temperature 20 C
SpeedOfSoundDryAir(20)
}
\author{
Jose Gama
}
\references{
Kleeman L. & Kuc R., 2008
Springer Handbook of Robotics, Bruno Siciliano, Oussama Khatib (Eds.)
Springer-Verlag Berlin Heidelberg, pp.496 eq (21.6).
}

