% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sonar.R
\name{fuelStabilizer}
\alias{fuelStabilizer}
\title{Number of milliliters or drops of stabilizer are needed to stabilize a certain amount of fuel}
\usage{
fuelStabilizer(Lfuel, mLstabilizer = 25, Lstabilizer2fuel = 20,
  dropml = 0.05)
}
\arguments{
\item{Lfuel}{numeric, liters of fuel to stabilize}

\item{mLstabilizer}{numeric, manufacturer's recommended milliliters of stabilizer per liters of fuel}

\item{Lstabilizer2fuel}{numeric, manufacturer's recommended liters of fuel per mms of stabilizer}

\item{dropml}{numeric, how many milliliters per drop}
}
\value{
the number of milliliters or drops of stabilizer
}
\description{
Returns the number of milliliters or drops of stabilizer are needed to stabilize a certain amount of fuel
}
\examples{
# liqui moly, petrol stabilizer CNG/LPG gasoline stabilizer
# 25ml of stabilizer are the recommended amount for 20 litres of gasoline
# stabilizer for 1l of gasoline
fuelStabilizer(1)
# stabilizer for 0.5l of gasoline
fuelStabilizer(0.5)
}
\author{
Jose Gama
}

