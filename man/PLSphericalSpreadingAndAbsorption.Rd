% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sonar.R
\name{PLSphericalSpreadingAndAbsorption}
\alias{PLSphericalSpreadingAndAbsorption}
\title{PL Spherical Spreading and Absorption}
\usage{
PLSphericalSpreadingAndAbsorption(r, alpha)
}
\arguments{
\item{r}{radius (meters)}

\item{alpha}{Molecular relaxation attenuation coeficient}
}
\value{
Propagation loss (PL) (dB)
}
\description{
Returns the PL Spherical Spreading and Absorption
}
\examples{
PLSphericalSpreadingAndAbsorption( 1000, 0.9 )
}
\author{
Jose Gama
}
\references{
Waite A. D., 2002
Sonar for Practising Engineers, 3rd Edition
Chichester: Wiley. pp. 48.
}

