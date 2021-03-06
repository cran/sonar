% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sonar.R
\name{SpeedOfSound}
\alias{SpeedOfSound}
\title{Speed of sound}
\usage{
SpeedOfSound(lambda, f)
}
\arguments{
\item{lambda}{numeric, wavelength (meters)}

\item{f}{numeric, frequency (Hz)}
}
\value{
the speed of sound (m/s)
}
\description{
Returns the speed of sound from wavelength and frequency
}
\examples{
SpeedOfSound( 5,  70)
}
\author{
Jose Gama
}
\references{
Waite A. D., 2002
Sonar for Practising Engineers, 3rd Edition
Chichester: Wiley. pp. 1.
}

