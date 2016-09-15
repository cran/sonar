
# datasets

#' @name CorrectiveTermsDepthFromPressure
#' @title Corrective terms to be added for obtaining depth from pressure
#' @description Corrective terms to be added for obtaining depth (m) from pressure (MPa)
#' @docType data
#' @usage CorrectiveTermsDepthFromPressure
#' @format dataframe with 13 rows and 5 columns:
#' \describe{
#'  \item{No}{Number}
#'  \item{Area.of.applicability}{Area of applicability}
#'  \item{Expression.for.deltaf}{Expression for deltaf}
#'  \item{Latitude}{Latitude in degrees}
#'  \item{Accuracy}{Accuracy}
#' }
#' @references C. C. Leroy and F Parthiot, 1998
#' Depth-pressure relationship in the oceans and seas. J. Acoust. Soc. Am. 103(3) pp 1346-1352
#' @author Jose Gama
#' @keywords data
"CorrectiveTermsDepthFromPressure"

#' @name CorrectiveTermsPressureFromDepth
#' @title Corrective terms to be subtracted for obtaining pressure from depth
#' @description Corrective terms to be added for obtaining pressure (MPa) from depth (m)
#' @docType data
#' @usage CorrectiveTermsPressureFromDepth
#' @format dataframe with 14 rows and 5 columns:
#' \describe{
#'  \item{No}{Number}
#'  \item{Area.of.applicability}{Area of applicability}
#'  \item{Expression.for.deltaf}{Expression for deltaf}
#'  \item{Latitude}{Latitude in degrees}
#'  \item{Accuracy}{Accuracy}
#' }
#' @references C. C. Leroy and F Parthiot, 1998
#' Depth-pressure relationship in the oceans and seas. J. Acoust. Soc. Am. 103(3) pp 1346-1352
#' @author Jose Gama
#' @keywords data
"CorrectiveTermsPressureFromDepth"

#' @name SpeedAlgorithmParameterRanges
#' @title Data on Speed of Sound Algorithm Parameter Ranges
#' @description Data on Speed of Sound Algorithm Parameter Ranges
#' @docType data
#' @usage SpeedAlgorithmParameterRanges
#' @format dataframe with 10 rows and 10 columns:
#' \describe{
#'  \item{Reference}{Reference}
#'  \item{TemperatureRangeMin}{Temperature Range (C) Min}
#'  \item{TemperatureRangeMax}{Temperature Range (C) Min}
#'  \item{SalinityRangeMin}{Salinity Range (ppt) min}
#'  \item{SalinityRangeMax}{Salinity Range (ppt) max}
#'  \item{PressureOrDepthRangeMin}{Pressure or Depth Range min}
#'  \item{PressureOrDepthRangeMax}{Pressure or Depth Range max}
#'  \item{PressureOrDepthRangeUnits}{Pressure or Depth Range units}
#'  \item{StandardError}{Standard Error}
#'  \item{NumberOfTerms}{Number of Terms}
#' }
#' @references Paul C. Etter, 2013
#' Underwater Acoustic Modeling and Simulation, Fourth Edition
#' pp. 28. CRC Press
#' @author Jose Gama
#' @keywords data
"SpeedAlgorithmParameterRanges"

#' @name MolecularRelaxationAttenuationCoeficient
#' @title Molecular relaxation attenuation coeficient (alpha)
#' @description Returns the attenuation coeficient of absorption losses
#' due to molecular relaxation
#' @docType data
#' @usage MolecularRelaxationAttenuationCoeficient
#' @format dataframe with 3 rows and 11 columns:
#' \describe{
#' \item{temperatureC}{numeric, temperature in degrees Celsius}
#' \item{0.5}{attenuation coeficient for 0.5 kHz}
#' \item{1}{attenuation coeficient for 1 kHz}
#' \item{2}{attenuation coeficient for 2 kHz}
#' \item{5}{attenuation coeficient for 5 kHz}
#' \item{10}{attenuation coeficient for 10 kHz}
#' \item{20}{attenuation coeficient for 20 kHz}
#' \item{50}{attenuation coeficient for 50 kHz}
#' \item{100}{attenuation coeficient for 100 kHz}
#' \item{200}{attenuation coeficient for 200 kHz}
#' \item{500}{attenuation coeficient for 500 kHz}
#' }
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 47.
#' @author Jose Gama
#' @keywords data
"MolecularRelaxationAttenuationCoeficient"

# functions

#' Speed of sound in dry air at sea level air density and one atmosphere pressure
#' @description Returns the speed of sound in dry air at sea level air density
#' and one atmosphere pressure
#' @param temperatureC numeric, temperature in degrees Celsius accurate to within 1\%
#' @return the speed of sound (m/s)
#' @references Kleeman L. & Kuc R., 2008
#' Springer Handbook of Robotics, Bruno Siciliano, Oussama Khatib (Eds.)
#' Springer-Verlag Berlin Heidelberg, pp.496 eq (21.6).
#' @author Jose Gama
#' @examples
#' #Speed of sound (dry air, at sea level air density, one atmosphere pressure)
#' #temperature 20 C
#' SpeedOfSoundDryAir(20)
SpeedOfSoundDryAir<-function(temperatureC) 20.05*sqrt(temperatureC + 273.16)

#' Speed of sound in Humid air at sea level air density and one atmosphere pressure
#' @description Returns the speed of sound in Humid air at sea level air density
#' and one atmosphere pressure
#' @param temperatureC numeric, temperature in degrees Celsius in the range -30 C to 43 C
#' @param Hr numeric, relative humidity, accurate to within 0.1\% for temperatures
#' @return the speed of sound (m/s)
#' @references Kleeman L. & Kuc R., 2008
#' Springer Handbook of Robotics, Bruno Siciliano, Oussama Khatib (Eds.)
#' Springer-Verlag Berlin Heidelberg, pp.496 eq (21.7).
#' @author Jose Gama
#' @examples
#' #Speed of sound (Humid air, at sea level air density, one atmosphere pressure)
#' #temperature 20 C, 90\% relative humidity
#' SpeedOfSoundHumidAir(20, 0.9)
SpeedOfSoundHumidAir<-function(temperatureC, Hr) 20.05*sqrt(temperatureC + 273.16)+ Hr * (1.0059 * 10^-3 + 1.7776 * 10^-7 * (temperatureC + 17.78)^3)

#' speed of sound in humid air at sea level air density and known atmospheric pressure
#' @description Returns the speed of sound in humid air at sea level air density
#' and known atmospheric pressure
#' @param temperatureC numeric, temperature in degrees Celsius in the range -30 C to 43 C
#' @param Hr numeric, relative humidity, accurate to within 0.1\% for temperatures
#' @param pressurekPa numeric, atmospheric pressure in kPa
#' @return the speed of sound (m/s)
#' @references Kleeman L. & Kuc R., 2008
#' Springer Handbook of Robotics, Bruno Siciliano, Oussama Khatib (Eds.)
#' Springer-Verlag Berlin Heidelberg, pp.496 eq (21.8).
#' @author Jose Gama
#' @examples
#' #Speed of sound (Humid air, at sea level air density)
#' #temperature 20 C, 90\% relative humidity, 101 kPa atmosphere pressure
#' SpeedOfSoundAir(20, 0.9, 101)
SpeedOfSoundAir<-function(temperatureC, Hr, pressurekPa){
Ps0 <- 101.325
T01 <- 273.16
Psat <- Ps0 * 10^( 10.796 * (1-T01/temperatureC) - 5.0261 * log10(T01/temperatureC) + 1.5047 * 10^-4 * ( 1 - 10^(-8.2927*((temperatureC/T01 )-1)))
+ 0.42873 * 10^-3 * (-1 + 10^(4.7696*(1-(T01 /temperatureC )))) - 2.2196 )
20.05*sqrt((temperatureC + 273.16)/(1 - 3.79 * 10^-3 * (Hr*Psat/pressurekPa)))
}

#' Number of milliliters or drops of stabilizer are needed to stabilize a certain amount of fuel
#' @description Returns the number of milliliters or drops of stabilizer are needed to stabilize a certain amount of fuel
#' @param Lfuel numeric, liters of fuel to stabilize
#' @param mLstabilizer numeric, manufacturer's recommended milliliters of stabilizer per liters of fuel
#' @param Lstabilizer2fuel numeric, manufacturer's recommended liters of fuel per mms of stabilizer
#' @param dropml numeric, how many milliliters per drop
#' @return the number of milliliters or drops of stabilizer
#' @author Jose Gama
#' @examples
#' # liqui moly, petrol stabilizer CNG/LPG gasoline stabilizer
#' # 25ml of stabilizer are the recommended amount for 20 litres of gasoline
#' # stabilizer for 1l of gasoline
#' fuelStabilizer(1)
#' # stabilizer for 0.5l of gasoline
#' fuelStabilizer(0.5)
fuelStabilizer<-function(Lfuel, mLstabilizer=25, Lstabilizer2fuel=20, dropml=0.05)
{
R<-Lfuel*1e3*mLstabilizer/(Lstabilizer2fuel*1e3)
c(milliliters=R, drops=R/dropml)
}

#' Sonar Range Resolution for monotonic acoustic systems
#' @description Returns the Sonar Range Resolution for monotonic acoustic systems
#' @param SonarPulseDuration, Sonar Pulse Duration
#' @param Cw, Velocity of sound
#' @return the Sonar Range Resolution
#' @author Jose Gama
#' @examples
#' RangeResolutionMonotonic(1, 343)
RangeResolutionMonotonic<-function(SonarPulseDuration, Cw) SonarPulseDuration * Cw / 2

#' Sonar Range Resolution CHIRP
#' @description Returns the Sonar Range Resolution CHIRP
#' @param SonarBandwidth, Sonar Bandwidth
#' @param Cw, Velocity of sound
#' @return the Sonar Range Resolution
#' @author Jose Gama
#' @examples
#' RangeResolutionCHIRP(1, 343)
RangeResolutionCHIRP<-function(SonarBandwidth, Cw) Cw / SonarBandwidth / 2

#' Speed of sound (m/s) from Kinsler et al
#' @description Returns the speed of sound (m/s) from Kinsler et al
#' accurate to within 0.05\% for 0<=T<=100 C and 0<=P<=200 bar
#' @param PressureBar, Pressure in bars (1 bar = 100 kPa)
#' @param temperatureC, temperatureC in Celsius
#' @return the speed of sound (m/s)
#' @references L. Kinsler, A. Frey, A. Coppens, J. Sanders, 1982
#' Fundamentals of Acoustics, Third Edition
#' New York: John Wiley & Sons. pp. 121 (5.6.8)
#' @author Jose Gama
#' @examples
#' SpeedOfSoundKinslerEtal(1, 20)
SpeedOfSoundKinslerEtal<-function(PressureBar,temperatureC)
{
t001<-temperatureC/100
1402.7 + 488*t001 - 482*t001^2 + 135*t001^3 + (15.9 + 2.8*t001 + 2.4*t001^2) *PressureBar /100
}

#' speed of sound (m/s) from Lubbers and Graaff's simplified equations a and b
#' @description Returns returns the speed of sound (m/s)
#' temperature interval 15-35 C at atmospheric pressure, maximum error 0.18 m/s
#' Lubbers and Graaff's simplified equation a)
#' @param temperatureC, temperatureC in Celsius
#' @return the speed of sound (m/s)
#' @source National Physical Laboratory, 2015
#' Underwater Acoustics Technical Guides - Speed of Sound in Pure Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundpurewater/content.html#LUBBERS} 
#' @references J. Lubbers and R. Graaff, 1998
#' A simple and accurate formula for the sound velocity in water, 
#' Ultrasound Med. Biol. Vol 24, No 7, pp 1065-1068.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundPureWaterLubbersandGraaffSEa(20)
SpeedOfSoundPureWaterLubbersandGraaffSEa<-function(temperatureC) 1404.3+4.7*temperatureC-0.04*temperatureC^2

#' speed of sound (m/s) from Lubbers and Graaff's simplified equations a and b
#' @description Returns returns the speed of sound (m/s)
#' temperature interval 10-40C at atmospheric pressure, maximum error 0.18 m/s
#' Lubbers and Graaff's simplified equation b)
#' @param temperatureC, temperatureC in Celsius
#' @return the speed of sound (m/s)
#' @source National Physical Laboratory, 2015
#' Underwater Acoustics Technical Guides - Speed of Sound in Pure Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundpurewater/content.html#LUBBERS} 
#' @references J. Lubbers and R. Graaff, 1998
#' A simple and accurate formula for the sound velocity in water, 
#' Ultrasound Med. Biol. Vol 24, No 7, pp 1065-1068.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundPureWaterLubbersandGraaffSEb(20)
SpeedOfSoundPureWaterLubbersandGraaffSEb<-function(temperatureC) 1405.03+4.624*temperatureC - 0.0383 *temperatureC^2

#' speed of sound (m/s) from Bilaniuk and Wong 112 point equation
#' @description Returns returns the speed of sound (m/s)
#' Range of validity: 0-100 OC at atmospheric pressure
#' @param temperatureC, temperatureC in Celsius
#' @return the speed of sound (m/s)
#' @source National Physical Laboratory, 2015
#' Underwater Acoustics Technical Guides - Speed of Sound in Pure Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundpurewater/content.html#LUBBERS}
#' @references Bilaniuk and Wong 1993
#' Speed of sound in pure water as a function of temperature, J. Acoust. Soc. Am. 93(3) pp 1609-1612
#' Bilaniuk and Wong 1996
#' Erratum: Speed of sound in pure water as a function of temperature [J. Acoust. Soc. Am. 93, 1609-1612 (1993)], J. Acoust. Soc. Am. 99(5), p 3257.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundPureWaterBilaniukWong112(20)
SpeedOfSoundPureWaterBilaniukWong112<-function(temperatureC) 1.40238742 * 10^3 + 5.03821344 *temperatureC - 5.80539349 * 10^-2*temperatureC^2+ 3.32000870 * 10^-4* temperatureC^3 - 1.44537900 * 10^-6* temperatureC^4 + 2.99402365 * 10^-9* temperatureC^5

#' speed of sound (m/s) from Bilaniuk and Wong 36 point equation
#' @description Returns returns the speed of sound (m/s)
#' Range of validity: 0-100 OC at atmospheric pressure
#' @param temperatureC, temperatureC in Celsius
#' @return the speed of sound (m/s)
#' @source National Physical Laboratory, 2015
#' Underwater Acoustics Technical Guides - Speed of Sound in Pure Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundpurewater/content.html#LUBBERS}
#' @references Bilaniuk and Wong 1993
#' Speed of sound in pure water as a function of temperature, J. Acoust. Soc. Am. 93(3) pp 1609-1612
#' Bilaniuk and Wong 1996
#' Erratum: Speed of sound in pure water as a function of temperature [J. Acoust. Soc. Am. 93, 1609-1612 (1993)], J. Acoust. Soc. Am. 99(5), p 3257.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundPureWaterBilaniukWong36(20)
SpeedOfSoundPureWaterBilaniukWong36<-function(temperatureC) 1.40238677 * 103 + 5.03798765 *temperatureC - 5.80980033 * 10^-2 *temperatureC^2+ 3.34296650 * 10^-4 *temperatureC^3 - 1.47936902 * 10^-6 *temperatureC^4 + 3.14893508 * 10^-9 *temperatureC^5

#' speed of sound (m/s) from Bilaniuk and Wong 148 point equation
#' @description Returns returns the speed of sound (m/s)
#' Range of validity: 0-100 OC at atmospheric pressure
#' @param temperatureC, temperatureC in Celsius
#' @return the speed of sound (m/s)
#' @source National Physical Laboratory, 2015
#' Underwater Acoustics Technical Guides - Speed of Sound in Pure Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundpurewater/content.html#LUBBERS}
#' @references Bilaniuk and Wong 1993
#' Speed of sound in pure water as a function of temperature, J. Acoust. Soc. Am. 93(3) pp 1609-1612
#' Bilaniuk and Wong 1996
#' Erratum: Speed of sound in pure water as a function of temperature [J. Acoust. Soc. Am. 93, 1609-1612 (1993)], J. Acoust. Soc. Am. 99(5), p 3257.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundPureWaterBilaniukWong148(20)
SpeedOfSoundPureWaterBilaniukWong148<-function(temperatureC) 1.40238744 * 103 + 5.03836171 *temperatureC - 5.81172916 * 10^-2 *temperatureC^2+ 3.34638117 * 10^-4 *temperatureC^3 - 1.48259672 * 10^-6 *temperatureC^4 + 3.16585020 * 10^-9 *temperatureC^5

#' speed of sound (m/s) from Marczak
#' @description Returns returns the speed of sound (m/s)
#' Range of validity: 0-95C at atmospheric pressure
#' @param temperatureC, temperatureC in Celsius
#' @return the speed of sound (m/s)
#' @source National Physical Laboratory, 2015
#' Underwater Acoustics Technical Guides - Speed of Sound in Pure Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundpurewater/content.html#LUBBERS}
#' @references Marczak, 1997
#' Water as a standard in the measurements of speed of sound in liquids
#' J. Acoust. Soc. Am. 102(5) pp 2776-2779.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundPureWaterMarczak(20)
SpeedOfSoundPureWaterMarczak<-function(temperatureC) 1.402385 * 10^3 + 5.038813 *temperatureC - 5.799136 * 10^-2 *temperatureC^2 +3.287156 * 10^-4 *temperatureC^3- 1.398845 * 10^-6 *temperatureC^4+2.787860 * 10^-9 *temperatureC^5

#' speed of sound (m/s) from Belogolskii, Sekoyan et al
#' @description Returns the speed of sound (m/s) 
#' Range of validity: 0-40C, 0.1 - 60 MPa
#' @param temperatureC, temperatureC in Celsius
#' @param pressureMegaPascals, pressure in mega Pascals
#' @return the speed of sound (m/s)
#' @source National Physical Laboratory, 2015
#' Underwater Acoustics Technical Guides - Speed of Sound in Pure Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundpurewater/content.html#LUBBERS}
#' @references Belogolskii, Sekoyan et al, 1999
#' Pressure dependence of the sound velocity in distilled water, Measurement Techniques, Vol 42, No 4, pp 406-413.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundPureWaterBelogolskiiSekoyanEtal(25, 1)
SpeedOfSoundPureWaterBelogolskiiSekoyanEtal<-function(temperatureC,pressureMegaPascals) 
{
#Table of Coefficients
a00<-1402.38744
a10<-5.03836171
a20<--5.81172916 * 10^-2
a30<-3.34638117 * 10^-4
a40<--1.48259672 * 10^-6
a50<-3.16585020 * 10^-9
a01<-1.49043589
a11<-1.077850609 * 10^-2
a21<--2.232794656 * 10^-4
a31<-2.718246452 * 10^-6
a02<-4.31532833 * 10^-3
a12<--2.938590293 * 10^-4
a22<-6.822485943 * 10^-6
a32<--6.674551162 * 10^-8
a03<--1.852993525 * 10^-5
a13<-1.481844713 * 10^-6
a23<--3.940994021 * 10^-8
a33<-3.939902307 * 10^-10
cT0 =a00 + a10*temperatureC + a20*temperatureC^2 + a30*temperatureC^3 + a40*temperatureC^4 + a50*temperatureC^5
M1T =a01 + a11*temperatureC + a21*temperatureC^2 + a31*temperatureC^3
M2T =a02 + a12*temperatureC + a22*temperatureC^2 + a32*temperatureC^3
M3T =a03 + a13*temperatureC + a23*temperatureC^2 + a33*temperatureC^3
cT0+M1T*(pressureMegaPascals- 0.101325)+M2T*(pressureMegaPascals- 0.101325)^2+M3T*(pressureMegaPascals - 0.101325)^3
}

#' speed of sound (m/s) in fresh water from Grosso and Mader
#' @description Returns the speed of sound (m/s) 
#' Range of validity: 0-95C, D = 0, error +-0.015
#' @param temperatureC, temperatureC in Celsius
#' @return the speed of sound (m/s)
#' @source National Physical Laboratory, 2015
#' Underwater Acoustics Technical Guides - Speed of Sound in Pure Water 
#' \url{http://support.echoview.com/WebHelp/Reference/Algorithms/Sonar_calculator_algorithms.htm}
#' @references Del Grosso, VA and Mader C.W., 1972 
#' Speed of sound in pure water. J. acoust. Soc. Am., 52, 1442-6.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundFreshWaterGrossoMader(25)
SpeedOfSoundFreshWaterGrossoMader<-function(temperatureC) 
{
1402.388+5.03711*temperatureC-0.0580852*temperatureC^2+0.3342*10^-3*temperatureC^3-0.1478*10^-5*temperatureC^4+0.315*10^-8*temperatureC^5
}

#' speed of sound (m/s) in sea water from Leroy 1968
#' @description Returns the speed of sound (m/s) 
#' @param D, depth in meters
#' @param latitude, latitude in degrees
#' @return the speed of sound (m/s)
#' @source Lurton, X, 2002
#' An Introduction to Underwater Acoustics, 1st ed. London, Praxis Publishing LTD, p37.
#' @references Lurton, X, 2002
#' An Introduction to Underwater Acoustics, 1st ed. London, Praxis Publishing LTD, p37.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterLeroy68(25, 0)
SpeedOfSoundSeaWaterLeroy68<-function(D,latitude) 
{
(1.0052405 *(1 + 5.28 * 10^-3 * sin(latitude) ) *D + 2.36 * 10^-6 *D^2 + 10.196 ) * 10^4
}

#' speed of sound (m/s) in sea water from Leroy 1969
#' @description Returns the speed of sound (m/s) 
#' Range of validity: -2:23 C, Error +-0.1
#' @param D, depth in meters
#' @param S, salinity in parts per thousand
#' @param temperatureC, temperatureC in Celsius
#' @return the speed of sound (m/s)
#' @source Leroy C.C. 1969
#' Underwater Acoustics Technical Guides - Speed of Sound in Sea Water 
#' \url{http://support.echoview.com/WebHelp/Reference/Algorithms/Sonar_calculator_algorithms.htm}
#' @references Leroy C.C. 1969
#' Development of simple equations for accurate and more realistic calculation
#' of the speed of sound in sea water. J. acoust. Soc. Am., 46, 216-26.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterLeroy69(0, 35, 25)
SpeedOfSoundSeaWaterLeroy69<-function(D,S,temperatureC) 
{
if ((-2 < temperatureC)|(temperatureC < 23)) warning('Temperature should be -2 < T < 23')
if ((30 < S)|(S < 40)) warning('Salinity should be 30 < S < 40')
if ((0 < D)|(D < 500)) warning('Depth should be 0 < D < 500')
1492.9+3*(temperatureC-10)-0.006*(temperatureC-10)^2-0.04*(temperatureC-18)^2+1.2*(S-35)-0.01*(temperatureC-18)*(S-35)+D/61
}

#' speed of sound (m/s) in sea water from Mackenzie 1981
#' @description Returns the speed of sound (m/s) 
#  Range of validity: temperature 2 to 30 C, salinity 25 to 40 parts per thousand
#  and depth 0 to 8000 m
#' @param D, depth in meters
#' @param S, salinity in parts per thousand
#' @param temperatureC, temperatureC in Celsius
#' @return the speed of sound (m/s)
#' @source Mackenzie K.V., 1981
#' Underwater Acoustics Technical Guides - Speed of Sound in Sea Water 
#' \url{http://support.echoview.com/WebHelp/Reference/Algorithms/Sonar_calculator_algorithms.htm}
#' @references Mackenzie K.V., 1981
#' Nine-term equation for sound speed in the ocean.
#' J. acoust. Soc. Am., 70, 807-12.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterMackenzie(0, 35, 25)
SpeedOfSoundSeaWaterMackenzie<-function(D,S,temperatureC){
 1448.96 + 4.591*temperatureC - 5.304 * 10^-2*temperatureC^2 + 2.374 * 10^-4*temperatureC^3 + 1.340 *(S-35) + 1.630 * 10^-2*D + 
 1.675 * 10^-7*D^2 - 1.025 * 10^-2*temperatureC*(S - 35) - 7.139 * 10^-13*temperatureC*D^3
}

#' speed of sound (m/s) in sea water from Coppens 1981
#' @description Returns the speed of sound (m/s) 
#'  Range of validity: temperature 0 to 35 C
#'  salinity 0 to 45 parts per thousand and depth 0 to 4000 m
#' @param D, depth in meters
#' @param S, salinity in parts per thousand
#' @param temperatureC, temperature in degrees Celsius
#' @return the speed of sound (m/s)
#' @source A.B. Coppens, 1981
#' Underwater Acoustics Technical Guides - Speed of Sound in Sea Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundseawater/}
#' @references A.B. Coppens, 1981
#' Simple equations for the speed of sound in Neptunian waters
#' J. Acoust. Soc. Am. 69(3), pp 862-863
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterCoppens(0, 35, 25)
SpeedOfSoundSeaWaterCoppens<-function(D,S,temperatureC) 
{
t10 <- temperatureC/10
1449.05 + 45.7*t10 - 5.21*t10^2 + 0.23*t10^3 + (1.333 - 0.126*t10 + 0.009*t10^2)*(S - 35) + 
(16.23 + 0.253*t10)*D + (0.213-0.1*t10)*D^2 + (0.016 + 0.0002*(S-35))*(S - 35)*t10*D
}

#' speed of sound (m/s) in sea water from Del Grosso 1974
#' @description Returns the speed of sound (m/s) 
#'  Range of validity: temperature 0 to 30 C, salinity 30 to 40 parts per thousand
#'  pressure 0 to 1000 kg/cm^2 , where 100 kPa=1.019716 kg/cm^2
#' @param S, salinity in parts per thousand
#' @param temperatureC, temperature in degrees Celsius
#' @param P, pressure in kg/cm^2
#' @return the speed of sound (m/s)
#' @source V.A. Del Grosso, 1974
#' Underwater Acoustics Technical Guides - Speed of Sound in Sea Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundseawater/}
#' @references V.A. Del Grosso, 1974
#' New equation for the speed of sound in natural waters (with comparisons
#' to other equations). J. Acoust. Soc. Am 56(4) pp 1084-1091.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterDelGrosso(30, 0, 1.019716)
SpeedOfSoundSeaWaterDelGrosso<-function(S,temperatureC,P)
{
C000 <- 1402.392
CT1 <- 0.5012285E1
CT2 <- -0.551184E-1
CT3 <- 0.221649E-3
CS1 <- 0.1329530E1
CS2 <- 0.1288598E-3
CP1 <- 0.1560592
CP2 <- 0.2449993E-4
CP3 <- -0.8833959E-8
CST <- -0.1275936E-1
CTP <- 0.6353509E-2
CT2P2 <- 0.2656174E-7
CTP2 <- -0.1593895E-5
CTP3 <- 0.5222483E-9
CT3P <- -0.4383615E-6
CS2P2 <- -0.1616745E-8
CST2 <- 0.9688441E-4
CS2TP <- 0.4857614E-5
CSTP <- -0.3406824E-3
deltaCT = CT1*temperatureC + CT2*temperatureC^2 + CT3*temperatureC^3
deltaCS = CS1*S + CS2*S^2
deltaCP = CP1*P + CP2*P^2 + CP3*P^3
deltaCSTP =  CST*S*temperatureC + CTP*temperatureC*P + CTP2*temperatureC*P^2 + CT3P*temperatureC^3*P + CT2P2*temperatureC^2*P^2 + CTP3*temperatureC*P^3 + CST2*S*temperatureC^2 + CSTP*S*temperatureC*P + CS2TP*S^2*temperatureC*P + CS2P2*S^2*P^2
C000 + deltaCT + deltaCS + deltaCP + deltaCSTP
}

#' speed of sound (m/s) in sea water from Chen and Millero 1977
#' @description Returns the speed of sound (m/s) 
#'  Range of validity: temperature 0 to 40 C, salinity 0 to 40 parts per thousand, pressure
#'  0 to 1000 bar
#' @param S, salinity in parts per thousand
#' @param temperatureC, temperature in degrees Celsius
#' @param P, pressure in kg/cm^2
#' @return the speed of sound (m/s)
#' @source C-T. Chen and F.J. Millero, 1977
#' Underwater Acoustics Technical Guides - Speed of Sound in Sea Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundseawater/}
#' @references C-T. Chen and F.J. Millero, 1977
#' Speed of sound in seawater at high pressures
#' J. Acoust. Soc. Am. 62(5) pp 1129-1135
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterChenAndMillero(30, 0, 1.019716)
SpeedOfSoundSeaWaterChenAndMillero<-function(S,temperatureC,P)
{
C00 <- 1402.388
A02 <- 7.166E-5
C01 <- 5.03830
A03 <- 2.008E-6
C02 <- -5.81090E-2
A04 <- -3.21E-8
C03 <- 3.3432E-4
A10 <- 9.4742E-5
C04 <- -1.47797E-6
A11 <- -1.2583E-5
C05 <- 3.1419E-9
A12 <- -6.4928E-8
C10 <- 0.153563
A13 <- 1.0515E-8
C11 <- 6.8999E-4
A14 <- -2.0142E-10
C12 <- -8.1829E-6
A20 <- -3.9064E-7
C13 <- 1.3632E-7
A21 <- 9.1061E-9
C14 <- -6.1260E-10
A22 <- -1.6009E-10
C20 <- 3.1260E-5
A23 <- 7.994E-12
C21 <- -1.7111E-6
A30 <- 1.100E-10
C22 <- 2.5986E-8
A31 <- 6.651E-12
C23 <- -2.5353E-10
A32 <- -3.391E-13
C24 <- 1.0415E-12
B00 <- -1.922E-2
C30 <- -9.7729E-9
B01 <- -4.42E-5
C31 <- 3.8513E-10
B10 <- 7.3637E-5
C32 <- -2.3654E-12
B11 <- 1.7950E-7
A00 <- 1.389
D00 <- 1.727E-3
A01 <- -1.262E-2
D10 <- -7.9836E-6
Cw <- (C00 + C01*temperatureC + C02*temperatureC^2 + C03*temperatureC^3 + C04*temperatureC^4 + C05*temperatureC^5) +
 	(C10 + C11*temperatureC + C12*temperatureC^2 + C13*temperatureC^3 + C14*temperatureC^4)*P +
 	(C20 +C21*temperatureC +C22*temperatureC^2 + C23*temperatureC^3 + C24*temperatureC^4)*P^2 +
 	(C30 + C31*temperatureC + C32*temperatureC^2)*P^3
A <- (A00 + A01*temperatureC + A02*temperatureC^2 + A03*temperatureC^3 + A04*temperatureC^4) +
 	(A10 + A11*temperatureC + A12*temperatureC^2 + A13*temperatureC^3 + A14*temperatureC^4)*P +
 	(A20 + A21*temperatureC + A22*temperatureC^2 + A23*temperatureC^3)*P^2 +
 	(A30 + A31*temperatureC + A32*temperatureC^2)*P^3
B <- B00 + B01*temperatureC + (B10 + B11*temperatureC)*P
D <- D00 + D10*P
Cw + A*S + B*S^(3/2) + D*S^2
}

#' speed of sound (m/s) in sea water from Medwin 1975
#' @description Returns the speed of sound (m/s) (approximation)
#'  Range of validity: limited to 1000 meters in depth
#' @param temperatureC, temperature in degrees Celsius
#' @param D, depth in meters
#' @param S, salinity in parts per thousand
#' @return the speed of sound (m/s)
#' @source X Lurton, 2002
#'  An Introduction to Underwater Acoustics, 1st ed. 
#'  London, Praxis Publishing LTD
#' @references Medwin H, 1975
#' Speed of sound in water: A simple equation for realistic parameters
#' Journal of the Acoustical Society of America, 58, 1318-1319, 1975
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterMedwin(0, 1, 30)
SpeedOfSoundSeaWaterMedwin<-function(temperatureC, D, S) 
{
if (((temperatureC >= 0) & (temperatureC <= 35)) & ((D >= 0) & (D <= 1000)) & ((S >= 0) & (S <= 45)))
c1 = 1449.2 + 4.6 * temperatureC - 5.5 * 10^-2 * temperatureC^2 + 2.9 *10^-4 * temperatureC^3 + (1.34 - 10^-2 * temperatureC ) * ( S - 35) + 1.62 *10^- 2 * D
c1
}

#' speed of sound (m/s) in sea water from Skone et al 2002
#' @description Returns the speed of sound (m/s)
#'  modelled using empirical formulae
#' @param temperatureC, temperature in degrees Celsius
#' @param D, depth in meters
#' @param S, salinity in parts per thousand
#' @return the speed of sound (m/s)
#' @source de Jong, C.D., Lachapelle, G., Skone, S. and Elema, I. A., 2002
#'  Hydrography. Delft University Press (The Netherlands). pp.194
#' @references de Jong, C.D., Lachapelle, G., Skone, S. and Elema, I. A., 2002
#' Hydrography. Delft University Press (The Netherlands). pp.194
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterSkone(0, 1, 30)
SpeedOfSoundSeaWaterSkone<-function(temperatureC, D,S){
if (((- 2 <= temperatureC) & (temperatureC <= 24.5)) & ((0 <= D) & (D <= 1000)) & ((30 <= S) & (S <= 42))) c1 <- 1492.9 + 3 * (temperatureC - 10) - 6 *10^-3 * (temperatureC - 10)^2 - 4 * 10^- 2 * (temperatureC - 18)^2 + 1.2 * ( S - 35)- 10^- 2 * (temperatureC - 18) * ( S - 35) + 1.6 * 10^-2 * D
if (((0 <= temperatureC) & (temperatureC <= 35)) & ((0 <= D) & (D <= 1000)) & ((0 <= S) & (S <= 45))) c1 = 1449.2 + 4.6 * temperatureC - 5.5 * 10^-2 * temperatureC^2 + 2.9 *10^-4 * temperatureC^3 + (1.34 - 10^-2 * temperatureC ) * ( S - 35) + 1.6 *10^- 2 * D
if (((0 <= temperatureC) & (temperatureC <= 30)) & ((0 <= D) & (D <= 8000)) & ((30 <= S) & (S <= 40)))
c1 <- 1448.96 + 4.591 * temperatureC - 5.304 *10^-2 * temperatureC^2 + 2.374 *10 - 4 * temperatureC^3 + 1.340 * ( S - 35) + 1.630 *10^- 2 * D + 1.675 * 10^-7 * D^2 - 1.025 *10^- 2 * temperatureC * ( S - 35) - 7.139 * 10^-1 * temperatureC * D^3
c1
}

#' International Formula For Gravity
#' @description Returns the average gravity at certain latitude
#' @param latitude, latitude in degrees
#' @param CorrectiveTerm, optional corrective term
#' @return the average gravity
#' @source Fofonoff and R.C. Millard, 1983
#' Underwater Acoustics Technical Guides - Speed of Sound in Sea Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundseawater/}
#' @references Saunders P.M., Fofonoff N.P., 1976
#' Conversion of pressure to depth in the ocean. Deep Sea Research 23:109-111.
#' @author Jose Gama
#' @examples
#' InternationalFormulaForGravity(0)
InternationalFormulaForGravity<-function(latitude, CorrectiveTerm=NA)
{
crrterm <- 0
g <- 9.780318 * (1+5.2788 * 10^-3* sin(latitude*pi/180)^2 - 2.36 * 10^-5*sin(latitude*pi/180)^4)
if (!is.na(CorrectiveTerm)) {
if (is.numeric(CorrectiveTerm)) crrterm <- CorrectiveTerm else {
if (is.function(CorrectiveTerm)) crrterm <- CorrectiveTerm(g)
}
}
g + crrterm
}

#' Pressure To Depth from Leroy Parthiot 1998
#' @description Returns the Pressure To Depth from Leroy Parthiot 1998
#' @param P, pressure in MPa (relative to atmospheric pressure)
#' @param latitude, latitude in degrees
#' @param CorrectiveTerm, optional corrective term
#' @return the depth
#' @source C. C. Leroy and F Parthiot, 1998
#' Underwater Acoustics Technical Guides - Speed of Sound in Sea Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundseawater/}
#' @references C. C. Leroy and F Parthiot, 1998
#' Depth-pressure relationship in the oceans and seas (1998)
#' J. Acoust. Soc. Am. 103(3) pp 1346-1352
#' @author Jose Gama
#' @examples
#' PressureToDepthLeroyParthiot(0.1, 0)
PressureToDepthLeroyParthiot<-function(P, latitude, CorrectiveTerm=NA)
{
crrterm <- 0
D <- 9.780318 *(1 + 5.2788 * 10^-3* sin(latitude*pi/180)^2 - 2.36 * 10^-5 *sin  (latitude*pi/180)^4)
(9.72659 * 10^2*P - 2.2512 * 10^-1*P^2 + 2.279 * 10^-4*P^3 - 1.82 * 10^-7*P^4)/(InternationalFormulaForGravity(latitude) + 1.092 * 10^-4*P)
if (!is.na(CorrectiveTerm)) {
if (is.numeric(CorrectiveTerm)) crrterm <- CorrectiveTerm else {
if (is.function(CorrectiveTerm)) crrterm <- CorrectiveTerm(D)
}
}
D + crrterm
}

#' Depth To Pressure from Leroy Parthiot 1998
#' @description Returns the Depth To Pressure from Leroy Parthiot 1998
#' @param D, depth in meters
#' @param latitude, latitude in degrees
#' @param CorrectiveTerm, optional corrective term
#' @return the Pressure
#' @source C. C. Leroy and F Parthiot, 1998
#' Underwater Acoustics Technical Guides - Speed of Sound in Sea Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/soundseawater/}
#' @references C. C. Leroy and F Parthiot, 1998
#' Depth-pressure relationship in the oceans and seas (1998)
#' J. Acoust. Soc. Am. 103(3) pp 1346-1352
#' @author Jose Gama
#' @examples
#' DepthToPressureLeroyParthiot(0, 0)
DepthToPressureLeroyParthiot<-function(D, latitude, CorrectiveTerm=NA)
{
crrterm <- 0
h45 <- 1.00818 * 10^-2*D + 2.465 * 10^-8*D^2 - 1.25 * 10^-13*D^3 + 2.8 * 10^-19*D^4
g <- 9.7803 *(1 + 5.3 * 10^-3* sin(latitude*pi/180)^2)
kZ <- (g - 2 * 10^-5*D)/(9.806 - 2 * 10^-5*D)
P <- h45*kZ
if (!is.na(CorrectiveTerm)) {
if (is.numeric(CorrectiveTerm)) crrterm <- CorrectiveTerm else {
if (is.function(CorrectiveTerm)) crrterm <- CorrectiveTerm(P)
}
}
P + crrterm
}

#' Pressure To Depth from Saunders and Fofonoff 1976
#' @description Returns the Pressure To Depth from Saunders and Fofonoff 1992
#' CHECKVALUE: DEPTH = 9712.653 M FOR P=10000 DECIBARS, LATITUDE=30 DEG
#' ABOVE FOR STANDARD OCEAN: T=O DEG. CELSIUS; S=35 (PSS-78)
#' @param P, pressure in MPa (relative to atmospheric pressure)
#' @param latitude, latitude in degrees
#' @return the depth
#' @source Unesco, 1983
#' Algorithms for computation of fundamental properties of
#'  seawater, 1983. Unesco Tech. Pap. in Mar. Sci., No. 44, 53 pp.
#' @references Saunders P.M., Fofonoff N.P., 1976
#' Conversion of pressure to depth in the ocean. Deep Sea Research 23:109-111
#' @author Jose Gama
#' @examples
#' PressureToDepthSaundersFofonoff(0.1, 0)
PressureToDepthSaundersFofonoff<-function(P, latitude)
{
X <- sin(latitude /57.29578)^2
GR <- 9.780318 *(1 +(5.2788E-3+2.36E-5*X)*X)+1.092E-6*P
Depth <- (((-1.82E-15*P+2.279E-10)*P-2.2512E-5)*P+9.72659)*P
Depth/GR
}

#' Calculation of absorption of sound in sea water From Francois & Garrison 1982
#' @description Returns the absorption of sound in sea water From Francois & Garrison 1982
#' Total absorption = Boric Acid Contrib. + Magnesium Sulphate Contrib. 
#' + Pure Water Contrib.
#' @param SonarFreq, sonar frequency (kHz)
#' @param temperatureC, temperature (degC)
#' @param Salinity,  Salinity (ppt)
#' @param D, depth in meters
#' @param pH, pH
#' @return the absorption of sound
#' @source NPL, 2016
#' Underwater Acoustics Technical Guides - Speed of Sound in Sea Water 
#' \url{http://resource.npl.co.uk/acoustics/techguides/seaabsorption/}
#' @references Francois & Garrison 1982
#' Sound absorption based on ocean measurements: 
#' Part I:Pure water and magnesium sulfate contributions
#' J. Acoust. Soc. Am., Vol. 72, No. 6
#' @author Jose Gama
#' @examples
#' AbsorptionSoundSeaWaterFrancoisGarrison(50, 0, 35, 0, 6)
AbsorptionSoundSeaWaterFrancoisGarrison<-function(SonarFreq,temperatureC,Salinity,D,pH)
{
TemperatureKelvin = 273.15 + temperatureC#ambient temperatureC(Kelvin)
speedOfSound = 1412 + 3.21 * temperatureC + 1.19 * Salinity + 0.0167 * D # Calculate speed of sound (m/s) (according to Francois & Garrison, JASA 72 (6) p1886)
#Boric acid contribution
A1 = (8.86 / speedOfSound ) * 10^(0.78 * pH - 5)# (dB/km/kHz)
P1 = 1# pressure correction factor
f1 = 2.8 * sqrt(Salinity / 35) * 10^(4 - 1245 / TemperatureKelvin)# (kHz)
Boric = (A1 * P1 * f1 * (SonarFreq^2))/((SonarFreq^2) + sqrt(f1^2))# boric acid contribution
#MgSO4 contribution
A2 = 21.44 * (Salinity / speedOfSound) * (1 + 0.025 * temperatureC)# (dB/km/kHz)
P2 = 1 - 1.37 * 10^(-4) * D + 6.2 * 10^(-9) * (D^2)
f2 = (8.17 * 10^(8 - 1990/TemperatureKelvin))/(1 + 0.0018 * (Salinity - 35))# (kHz)
MgSO4 = (A2 * P2 * f2 * (SonarFreq^2))/((SonarFreq^2) + (f2^2))# magnesium sulphate contribution
#Pure water contribution
if (temperatureC <= 20)
	A3 = 4.937 * 10^(-4) - 2.59 * 10^(-5) * temperatureC + 9.11 * 10^(-7) * (temperatureC^2) - 1.50 * 10^(-8) * temperatureC^3# (dB/km/kHz)
else
	A3 = 3.964 * 10^(-4) - 1.146 * 10^(-5) * temperatureC + 1.45 * 10^(-7) * (temperatureC^2) - 6.50 * 10^(-10) * temperatureC^3# (dB/km/kHz)
P3 = 1 - 3.83 * 10^(-5) * D + 4.9 * 10^(-10) * (D^2)
H2O = A3 * P3 * (SonarFreq^2)# pure water contribution
#Total absorption
Alpha = Boric + MgSO4 + H2O# total absorption (dB/km)
return (Alpha)
}

#' Calculation of absorption of sound in fresh water From Francois & Garrison 1982
#' @description Returns the absorption of sound in fresh water From Francois & Garrison 1982
#' Total absorption = Pure Water Contrib. 
#' @param SonarFreq, sonar frequency (kHz)
#' @param temperatureC, temperature (degC)
#' @param D, depth in meters
#' @return the absorption of sound
#' @source Echoview, 2016
#' Sonar calculator algorithms 
#' \url{http://support.echoview.com/WebHelp/Reference/Algorithms/Sonar_calculator_algorithms.htm}
#' @references Francois & Garrison 1982
#' Sound absorption based on ocean measurements: 
#' Part I:Pure water and magnesium sulfate contributions
#' J. Acoust. Soc. Am., Vol. 72, No. 6
#' @author Jose Gama
#' @examples
#' AbsorptionSoundFreshWaterFrancoisGarrison(50, 0, 0)
AbsorptionSoundFreshWaterFrancoisGarrison<-function(SonarFreq,temperatureC,D)
{
TemperatureKelvin = 273.15 + temperatureC#ambient temperatureC(Kelvin)
#Pure water contribution
if (temperatureC <= 20)
	A3 = 4.937 * 10^(-4) - 2.59 * 10^(-5) * temperatureC + 9.11 * 10^(-7) * (temperatureC^2) - 1.50 * 10^(-8) * temperatureC^3# (dB/km/kHz)
else
	A3 = 3.964 * 10^(-4) - 1.146 * 10^(-5) * temperatureC + 1.45 * 10^(-7) * (temperatureC^2) - 6.50 * 10^(-10) * temperatureC^3# (dB/km/kHz)
P3 = 1 - 3.83 * 10^(-5) * D + 4.9 * 10^(-10) * (D^2)
H2O = A3 * P3 * (SonarFreq^2)# pure water contribution
#Total absorption
Alpha = H2O# total absorption (dB/km)
return (Alpha)
}

#' Calculation of speed of sound in sea water from Wilson 1960
#' @description Returns the speed of sound in sea water from Wilson 1960
#' @param temperatureC, temperature from -4C to 30C
#' @param S, salinity from 0 to 37 per 1000
#' @param P, hydrostatic pressure from 0.1 MPa to 100 MPa
#' @return the speed of sound
#' @source N. N. Andreyev Acoustics Institute, 2015
#' The speed of sound in sea water 
#' \url{http://www.akin.ru/spravka_eng/s_i_svel_e.htm}
#' @references Wilson W D, 1960
#' Equation for the speed of sound in sea water
#' J. Acoust. Soc. Amer., vol.32, N 10, p. 1357
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterWilson(0, 30, 0.1)
SpeedOfSoundSeaWaterWilson<-function(temperatureC,S,P)
{
vt=4.5721*temperatureC-4.4532e-2*temperatureC*temperatureC-2.6045e-4*temperatureC^3+7.9851e-6*temperatureC^4
vs=1.39799*(S-35)+1.69202e-3*(S-35)*(S-35)
vp=1.63432*P+1.06768e-3*P*P+3.73403e-6*P^3-3.6332e-8*P^4
vstp=(S-35)*(-1.1244e-2*temperatureC+7.7711e-7*temperatureC*temperatureC+7.85344e-4*P-1.3458e-5*P*P+3.2203e-7*P*temperatureC+1.6101e-8*temperatureC*temperatureC*P)+P*(-1.8974e-3*temperatureC+7.6287e-5*temperatureC*temperatureC+4.6176e-7*temperatureC^3)+P*P*(-2.6301e-5*temperatureC+1.9302e-7*temperatureC*temperatureC)-P^3*2.0831e-7*temperatureC
v=1449.14+vt+vs+vp+vstp
v=round(v*100)/100
v
}

#' Calculation of speed of sound in sea water from Frye and Pugh 1971
#' @description Returns the speed of sound in sea water from Frye and Pugh 1971
#' @param temperatureC, temperature from -3C to 30C
#' @param S, salinity from 33.1 to -36.6 per 1000
#' @param P, hydrostatic pressure from 1.033 to 984.3 kg/cm^2
#' @return the speed of sound
#' @source Frye, H.W. and Pugh, J.D. 1971
#' A new equation for the speed of sound in seawater
#' J. Acoust. Soc. Am., 50, 384-6.
#' @references Frye, H.W. and Pugh, J.D. 1971
#' A new equation for the speed of sound in seawater
#' J. Acoust. Soc. Am., 50, 384-6.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterFryeAndPugh(0, 30, 1.033)
SpeedOfSoundSeaWaterFryeAndPugh<-function(temperatureC, S, P)
{
1449.3+1.5848*10^-1*P+1.572*10^-5*P^2
-3.46*10^-12*P^4
+4.587*temperatureC-5.356*10^-2*temperatureC^2+2.604*10^-4*temperatureC^3
+1.19*(S-35)+9.6*10^-2*(S-35)^3+1.354*10^-5*temperatureC^2*P-7.19*10^-7*temperatureC*P^2-1.2*10^-2*(S-35)*temperatureC
}

#' Calculation of pressure in water (Leroy modified) from Lovett 1978
#' @description Returns the pressure in water (Leroy simplified modified)
#' from Lovett 1978
#' @param Z, depth in meters
#' @param lat, latitude n degrees
#' @return the pressure
#' @source Lovett, J.R. 1978
#' Merged seawater sound-speed equations
#' J. Acoust. Soc. Am., 63, 1713-18.
#' @author Jose Gama
#' @examples
#' PressureModifiedSimplifiedLeroy(0, 0)
PressureModifiedSimplifiedLeroy<-function(Z, lat)
{
1.0052405*(1 + 5.28 * 10^-3* sin(lat)^2)*Z + 2.36 * 10^-6*Z^2
}

#' Calculation of pressure in water simplified from Leroy 1969
#' @description Returns the pressure in water simplified from Leroy 1969
#' @param Z, depth in meters
#' @param lat, latitude n degrees
#' @return the pressure
#' @source Leroy C. C. 1969
#' Development of simple equations for accurate and more realistic 
#' calculations of the speed of sound in sea water
#' J. Acoust. Soc. Am. 46, 216-226.
#' @author Jose Gama
#' @examples
#' PressureSimplifiedLeroy(0, 0)
PressureSimplifiedLeroy<-function(Z, lat)
{
1.04+0.102506*(1+0.00528 *sin(lat)^2)*Z+2.524* 10^-7*Z^2
}

#' Calculation of pressure in the Black Sea from Leroy 1969
#' @description Returns the pressure in the Black Sea from Leroy 1969
#' @param Z, depth in meters
#' @param lat, latitude n degrees
#' @return the pressure
#' @source Leroy C. C. 1969
#' Development of simple equations for accurate and more realistic 
#' calculations of the speed of sound in sea water
#' J. Acoust. Soc. Am. 46, 216-226.
#' @author Jose Gama
#' @examples
#' PressureBlackSeaSimplifiedLeroy(0, 0)
PressureBlackSeaSimplifiedLeroy<-function(Z, lat)
{
1.03+0.10168*Z+2.6*10^-7*Z^2
}

#' Calculation of pressure in the Baltic from Leroy 1969
#' @description Returns the pressure in the Baltic from Leroy 1969
#' @param Z, depth in meters
#' @param lat, latitude n degrees
#' @return the pressure
#' @source Leroy C. C. 1969
#' Development of simple equations for accurate and more realistic 
#' calculations of the speed of sound in sea water
#' J. Acoust. Soc. Am. 46, 216-226.
#' @author Jose Gama
#' @examples
#' PressureBalticSimplifiedLeroy(0, 0)
PressureBalticSimplifiedLeroy<-function(Z, lat)
{
1.03+0.1008*Z+1.4*10^-6*Z^2
}

#' Calculation of speed of sound in sea water from Lovett 1978
#' @description Returns the speed of sound in sea water from Lovett 1978
#' Check value: at T=2C, S=34.7; P=6000 dbar; C = 1559.462 m/s.
#' @param temperatureC, temperature in degrees C T48
#' @param S, salinity in \%
#' @param P, pressure in decibars (0 at surface)
#' @return the speed of sound (m/s)
#' @source Lovett, J.R. 1978
#' Merged seawater sound-speed equations
#' J. Acoust. Soc. Am., 63, 1713-18.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterLovett1(2, 34.7, 6000)
SpeedOfSoundSeaWaterLovett1<-function(temperatureC,S,P)
{
C1= 1402.392
CT=5.011094*temperatureC - 5.509468 *10^-2*temperatureC^2+2.21536*10^-4*temperatureC^3
Cs=1.329523*S+1.289558*10^-4*S^2
Cp= 1.598938*10^-2*P + 2.478901*10^-7*P^2 - 8.485727*10^-12*P^3
CTsp=-1.275628*10^-2*temperatureC*S+6.477152*10^-4*temperatureC*P
+ 2.760566* 10^-2* temperatureC^2*P^2 - 1.65695* 10^-8*temperatureC*P^2 + 5.536118* 10^-13*temperatureC*P^3 - 4.466674 * 10^-8*temperatureC^3*P - 1.681126 * 10^-11*S^2*P^2
+ 9.684032* 10^-5*temperatureC^2*S + 4.952146 * 10^-7*temperatureC*S^2* P - 3.473123*10^-5*temperatureC*S*P
C1+CT+Cs+Cp+CTsp
}

#' Calculation of speed of sound in sea water from Lovett 1978b
#' @description Returns the speed of sound in sea water from Lovett 1978b
#' Check value: at T=2C, S=34.7; P=6000 dbar; C = 1559.393 m/s.
#' @param temperatureC, temperature in degrees C T48
#' @param S, salinity in \%
#' @param P, pressure in decibars (0 at surface)
#' @return the speed of sound (m/s)
#' @source Lovett, J.R. 1978
#' Merged seawater sound-speed equations
#' J. Acoust. Soc. Am., 63, 1713-18.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterLovett2(2, 34.7, 6000)
SpeedOfSoundSeaWaterLovett2<-function(temperatureC,S,P)
{
C2= 1402.394
CT= 5.028849*temperatureC - 5.723758* 10^-2*temperatureC^2
+ 2.858485 * 10^-4*temperatureC^3- 1.404216* 10^-8*temperatureC^5
Cs=1.280746*S+2.830167*10^-3*S^2- 3.787896*10^-5*S^3
Cp = 1.594777*10^-2*P+ 2.778778*10^-7*P^2+ 7.069489*10^-21*P^5
CTsp= - 1.280898*10^-2*temperatureC*S+ 1.040187*10^-4*temperatureC^2*S
- 9.301259*10^-11*temperatureC^3*S^3 + 9.466535*10^-5*temperatureC*P
- 1.23743*10^-8*temperatureC*P^2 - 7.100174*10^-6*temperatureC^2*P
+8.592724*10^-14*temperatureC^2*P^3
- 9.02519* 10^-8*temperatureC^3*P
- 2.70148*10^-11*temperatureC^3*P^2 - 7.816551*10^-13*S*P^3
+ 1.303142*10^-14*S^2*P^2
- 6.265617*10^-13*S^3*P^2
- 2.238383*10^-6*temperatureC*S*P+ 2.85346*10^-7*temperatureC^2*S*P
C2+CT+Cs+Cp+CTsp
}

#' Calculation of speed of sound in sea water from Lovett 1978c
#' @description Returns the speed of sound in sea water from Lovett 1978c
#' Check value: at T=2C, S=34.7; P=6000 dbar; C = 1559.499 m/s.
#' @param temperatureC, temperature in degrees C T48
#' @param S, salinity in \%
#' @param P, pressure in decibars (0 at surface)
#' @return the speed of sound (m/s)
#' @source Lovett, J.R. 1978
#' Merged seawater sound-speed equations
#' J. Acoust. Soc. Am., 63, 1713-18.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterLovett3(2, 34.7, 6000)
SpeedOfSoundSeaWaterLovett3<-function(temperatureC,S,P)
{
C3= 1402.394
CT=5.01132*temperatureC - 5.513036*10^-2*temperatureC^2+2.221008*10^-4*temperatureC^3
Cs=1.332947*S
Cp =1.605336*10^-2+ 2.12448*10^-7*P^2
CTsp=-1.266383*10^-2*temperatureC*S+ 9.543664* 10^-5*temperatureC^2*S - 1.052396 * 10^-8*temperatureC*P^2 + 2.183988*10^-13*temperatureC*P^3
- 2.253828 * 10^-13*S*P^3 + 2.062107*10^-8*temperatureC*S^2*P
C3+CT+Cs+Cp+CTsp
}

#' Calculation of speed of sound in sea water from Leroy et Al 2008
#' @description Returns the speed of sound in sea water from Leroy et Al 2008
#' @param temperatureC, temperature in degrees C 1990 universal temperature scale
#' @param S, salinity in \%
#' @param D, depth in meters
#' @param L, latitude in degrees
#' @return the speed of sound (m/s)
#' @source Leroy, C.C., Robinson, S.P., and Goldsmith, M.J. 2008
#' A new equation for the accurate calculation of sound speed in all oceans
#' J. Acoust. Soc. Am., 124, 2774-82.
#' @author Jose Gama
#' @examples
#' SpeedOfSoundSeaWaterLeroyEtAl2008(0, 30, 0, 0)
SpeedOfSoundSeaWaterLeroyEtAl2008<-function(temperatureC,S,D,L)
{
1402.5 + 5*temperatureC - 5.44 * 10^-2*temperatureC^2 + 2.1 * 10^-4*temperatureC^3
+ 1.33*S - 1.23 * 10^-2*S*temperatureC + 8.7 * 10^-5*S*temperatureC^2
+ 1.56 * 10^-2*D + 2.55 * 10^-7*D^2 - 7.3 * 10^-12*D^3
+ 1.2 * 10^-6*D*(L-45) - 9.5 * 10^-13*T*D^3
+ 3 * 10^-7*temperatureC^2*D + 1.43 * 10^-5*S*D
}

#' Calculation of cutoff frequency in water from Jensen et Al 2011
#' @description Returns the cutoff frequency in water from Jensen et Al 2011
#' @param Cw, velocity of sound in water
#' @param D, depth in meters of isothermal surface layer
#' @return the cutoff frequency (Hz)
#' @source Finn B. Jensen, William A. Kuperman, Michael B. Porter, Henrik Schmidt, 2011
#' Computational Ocean Acoustics, 2nd Edition. Springer. pp. 26
#' @author Jose Gama
#' @examples
#' CutoffFrequencyWater(3000, 1)
CutoffFrequencyWater<-function(Cw, D) Cw / (0.008*D^(3/2))

#' Calculation of cutoff frequency in shallow water from Jensen et Al 2011
#' @description Returns the cutoff frequency in shallow water from Jensen et Al 2011
#' @param Cw, velocity of sound in water
#' @param Cb, velocity of sound in  homogeneous bottom
#' @param D, depth in meters
#' @return the cutoff frequency (Hz)
#' @source Finn B. Jensen, William A. Kuperman, Michael B. Porter, Henrik Schmidt, 2011
#' Computational Ocean Acoustics, 2nd Edition. Springer. pp. 29
#' @author Jose Gama
#' @examples
#' CutoffFrequencyShallowWater(3000, 2500, 1)
CutoffFrequencyShallowWater<-function(Cw, Cb, D) Cw/(D*sqrt(1-(Cw/Cb)^2))

#' Calculation of absorption in sea water from Fisher and Simmons 1977
#' @description Returns the absorption in sea water from Fisher and Simmons 1977
#' @param f, frequency (kHz)
#' @param temperatureC, temperature in degrees C
#' @param D, depth in meters
#' @return the absorption
#' @source Fisher and Simmons, 1977
#' J. Acoust. Soc. Am., Vol. 62, No. 3, September 1977
#' @author Jose Gama
#' @examples
#' AbsorptionAlphaFisherSimmons(20, 0, 1)
AbsorptionAlphaFisherSimmons<-function(f,temperatureC,D)
{
# Total absorption = Boric Acid Contrib. + Magnesium Sulphate Contrib. + Pure Water Contrib.
# Boric	boric acid contribution
# MgSO4	magnesium sulphate contribution
# H2O	pure water contribution
# Alpha	total absorption (dB/km)
# T_kel	 ambient temperature (Kelvin)
# A1 (dB/km/kHz)
# A2 (dB/km/kHz)
# A3 (dB/km/kHz)
# P1, P2, P3 pressure correction factors
# f1 (kHz)
# f2 (kHz)
Kelvin = 273.15 # for converting to Kelvin (273.15)
# Measured ambient temp
	T_kel = Kelvin + temperatureC
# Convert Depth back to pressure (assuming P = D/10)
	P = D / 10.0
# Convert f into Hz
	f = f * 1000
# Boric acid contribution
	A1 = 1.03 * exp(-8) + 2.36 * exp(-10) * temperatureC - 5.22 * exp(-12) * sqrt(temperatureC)
	P1 = 1
	f1 = 1.32 * exp(3) * T_kel * exp(-1700 / T_kel)
	Boric = (A1 * P1 * f1 * sqrt(f))/(sqrt(f) + sqrt(f1))
# MgSO4 contribution
	A2 = 5.62 * exp(-8) + 7.52 * exp(-10) * temperatureC
	P2 = 1 - 10.3 * exp(-4) * P + 3.7 * exp(-7) * sqrt(P)
	f2 = 1.55 * exp(7) * T_kel * exp(-3052 / T_kel)
	MgSO4 = (A2 * P2 * f2 * sqrt(f))/(sqrt(f) + sqrt(f2))
# Pure water contribution
	A3 = (55.9 - 2.37 * T + 4.77 * exp(-2) * sqrt(temperatureC) - 3.48 * exp(-4) * (temperatureC^3) ) * exp(-15)
	P3 = 1 - 3.84 * exp(-4) * P + 7.57 * exp(-8) * sqrt(P)
	H2O = A3 * P3 * sqrt(f)
# Total absorption (dB/km) (8686 converts to dB/km)
	Alpha = (Boric + MgSO4 + H2O) * 8686
	Alpha
	}

#' Calculation of absorption in sea water from Ainslie and McColm 1998
#' @description Returns the absorption in sea water from Ainslie and McColm 1998
#' @param f, frequency (kHz)
#' @param temperatureC, temperature in degrees C
#' @param S, salinity in \%
#' @param D, depth in meters
#' @param pH, pH
#' @return the absorption
#' @source National Physical Laboratory, 2015
#' Calculation of absorption of sound in seawater
#' \url{http://resource.npl.co.uk/acoustics/techguides/seaabsorption/}
#' @references Ainslie and McColm 1998
#' J. Acoust. Soc. Am., Vol. 103, No. 3
#' @author Jose Gama
#' @examples
#' AbsorptionAlphaAinslieMcColm(20, 0, 30, 0, 7)
AbsorptionAlphaAinslieMcColm<-function(f,temperatureC,S,D,pH)
{
# Total absorption = Boric Acid Contrib. + Magnesium Sulphate Contrib. + Pure Water Contrib.
# Boric	boric acid contribution
# MgSO4	magnesium sulphate contribution
# H2O	pure water contribution
# Alpha	total absorption (dB/km)
# T_kel	 ambient temperature (Kelvin)
# A1 (dB/km/kHz)
# A2 (dB/km/kHz)
# A3 (dB/km/kHz)
# P1, P2, P3 pressure correction factors
# f1 (kHz)
# f2 (kHz)
Kelvin = 273.15 # for converting to Kelvin (273.15)
# Measured ambient temp
	T_kel = Kelvin + temperatureC
# Boric acid contribution
	A1 = 0.106 * exp((pH - 8)/0.56)
	P1 = 1
	f1 = 0.78 * sqrt(S / 35) * exp(temperatureC/26)
	Boric = (A1 * P1 * f1 * sqrt(f))/(sqrt(f) + sqrt(f1))
# MgSO4 contribution
	A2 = 0.52 * (S / 35) * (1 + temperatureC/43)
	P2 = exp(-D/6)
	f2 = 42 * exp(temperatureC/17)
	MgSO4 = (A2 * P2 * f2 * sqrt(f))/(sqrt(f) + sqrt(f2))
# Pure water contribution
	A3 = 0.00049* exp(-(temperatureC/27 + D/17))
	P3 = 1
	H2O = A3 * P3 * sqrt(f)
# Total absorption (dB/km)
	Alpha = Boric + MgSO4 + H2O
	Alpha
	}

#' Speed of sound
#' @description Returns the speed of sound from wavelength and frequency
#' @param lambda numeric, wavelength (meters)
#' @param f numeric, frequency (Hz)
#' @return the speed of sound (m/s)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 1.
#' @author Jose Gama
#' @examples
#' SpeedOfSound( 5,  70)
SpeedOfSound <- function( lambda, f)  lambda * f

#' Plane wave pressure
#' @description Returns the pressure
#' @param rho, fluid density = 10^3kg/m^3 for sea water
#' @param C, velocity of sound wave propagation = 1.5 x 10^3m/s in sea water
#' @param u particle velocity (m/s)
#' @return pressure (Pa or N/m2)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 2.
#' @author Jose Gama
#' @examples
#' PlaneWavePressure( 1e3, 1.5e3,  1)
PlaneWavePressure<- function( rho, C, u) rho * C * u

#' Plane wave intensity
#' @description Returns the intensity
#' @param p, pressure (Pa or N/m2)
#' @param rho, fluid density = 10^3kg/m^3 for sea water
#' @param C, velocity of sound wave propagation = 1.5 x 10^3m/s in sea water
#' @return intensity of the wave (power / unit area) (Watt / m^2)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 3.
#' @author Jose Gama
#' @examples
#' PlaneWaveIntensity( 1e3, 1.5e3,  1)
PlaneWaveIntensity <- function( p, rho, C) p^2 / (rho * C)

#' source level (SL)
#' @description Returns the source level (SL)
#' @param I1, intensity of source at standard range
#' @param Ir, reference intensity
#' @return source level (SL)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 4.
#' @author Jose Gama
#' @examples
#' SourceLevel( 1000, 1100)
SourceLevel<- function( I1, Ir) 10 * log(I1/Ir)

#' SL of an omnidirectional projector
#' @description Returns the SL of an omnidirectional projector
#' @param P, omnidirectional power output (watts)
#' @return source level (SL)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 4.
#' @author Jose Gama
#' @examples
#' SLomnidirectionalProjector( 1000 )
SLomnidirectionalProjector<- function( P ) 10 * log(P) + 170.8

#' transmit directivity index
#' @description Returns the transmit directivity index (DIt)
#' @param Idir, intensity along the axis of the beam pattern
#' @param Iomni, intensity of the equivalent non-directional projector
#' @return transmit directivity index (DIt)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 4.
#' @author Jose Gama
#' @examples
#' TransmitDirectivityIndex( 700, 1000 )
TransmitDirectivityIndex <- function( Idir, Iomni ) 10 * log( Idir / Iomni )

#' SL of a directional projector
#' @description Returns the SL of a directional projector
#' @param P, power output (watts)
#' @param DIt, transmit directivity index (dB)
#' @return SL of a directional projector
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 4.
#' @author Jose Gama
#' @examples
#' SLdirectionalProjector( 700, 0.7 )
SLdirectionalProjector <- function( P, DIt ) 10 * log(P) + 170.8 + DIt

#' Cavitation threshold estimate as a function of depth
#' @description Returns the Cavitation threshold estimate as a function of depth
#' line passing by (5, 2) and (50, 50)
#' @param d, depth (meters)
#' @return Cavitation threshold
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 6.
#' @author Jose Gama
#' @examples
#' CavitationThresholdEstimateFunctionOfDepth( 1 )
CavitationThresholdEstimateFunctionOfDepth<- function( d ) 16/15 * d - 10/3

#' Cavitation threshold estimate as a function of radiated acoustic power intensity
#' @description Returns the Cavitation threshold estimate as a function of radiated acoustic power intensity
#' line passing by (2, 5) and (50, 50)
#' @param Ir, radiated acoustic power intensity
#' @return Cavitation threshold
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 6.
#' @author Jose Gama
#' @examples
#' CavitationThresholdEstimateFunctionOfRadiatedAcousticPowerIntensity ( 1000 )
CavitationThresholdEstimateFunctionOfRadiatedAcousticPowerIntensity <- function( Ir ) 15/16 * Ir + 25/8

#' Maximum radiated power to avoid cavitation
#' @description Returns the Maximum radiated power to avoid cavitation
#' @param radiatingSurfaceArea, Radiating surface area
#' @param cavitationThreshold, Cavitation threshold
#' @return Maximum radiated power
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 5.
#' @author Jose Gama
#' @examples
#' MaximumRadiatedPowerToAvoidCavitation( 50, 0.7 )
MaximumRadiatedPowerToAvoidCavitation <- function( radiatingSurfaceArea, cavitationThreshold ) radiatingSurfaceArea * cavitationThreshold

#' source level to avoid cavitation
#' @description Returns the source level to avoid cavitation
#' @param f, frequency (Hz)
#' @param DIt, transmit directivity index (dB)
#' @return source level SL (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 5.
#' @author Jose Gama
#' @examples
#' SourceLevelToAvoidCavitation( 20000, 0.7 )
SourceLevelToAvoidCavitation <- function( f, DIt ) 10 * log(f)

#' Projector Sensitivity Voltage
#' @description Returns the Projector Sensitivity Voltage
#' @param I1 intensity of source at standard range
#' @param Ir reference intensity
#' @param v Voltage
#' @return response Sv (dB/V)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 9.
#' @author Jose Gama
#' @examples
#' ProjectorSensitivityVoltage( 10000, 15000, 0.7 )
ProjectorSensitivityVoltage <- function( I1, Ir, v ) 10 * log(I1/Ir * 1/v^2)

#' Projector Sensitivity Power
#' @description Returns the Projector Sensitivity Power
#' @param I1 intensity of source at standard range
#' @param Ir reference intensity
#' @param P power (Watt)
#' @return response Sv (dB/V)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 9.
#' @author Jose Gama
#' @examples
#' ProjectorSensitivityPower( 10000, 15000, 0.7 )
ProjectorSensitivityPower <- function( I1, Ir, P ) 10 * log(I1/Ir * 1/P)

#' Hydrophone Sensitivity
#' @description Returns the Hydrophone Sensitivity
#' @param p sound pressure in micropascals at the hydrophone
#' @param v voltage at the open circuit terminals
#' @return Hydrophone Sensitivity (dB/V)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 9.
#' @author Jose Gama
#' @examples
#' HydrophoneSensitivity( 1000, 2 )
HydrophoneSensitivity <- function( p, v ) 20 * log (v) - 20 * log (p)

#' band level (BL) for flat spectrum
#' @description Returns the total intensity of the sound in a band for flat spectrum
#' @param SpL spectrum level
#' @param deltaf band frequency
#' @return band level (BL)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 10.
#' @author Jose Gama
#' @examples
#' BandLevelFlatSpectrum( 3, 2 )
BandLevelFlatSpectrum <- function( SpL, deltaf ) SpL + 10 * log(deltaf)

#' band level (BL) from complete band
#' @description Returns the band level from integrating the intensity over the complete band
#' @param I0 spectrum level
#' @param f1 lower frequency
#' @param f2 upper frequency
#' @return band level (BL)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 10.
#' @author Jose Gama
#' @examples
#' BandLevelFromCompleteBand( 10000, 40000, 50000 )
BandLevelFromCompleteBand <- function( I0, f1, f2 ) I0 + 10 * log10(f2/f1)

#' Propagation loss (PL)
#' @description Returns the Propagation loss (PL)
#' @param I0 intensity of the source to a point one metre from its acoustic centre
#' @param Ir is the intensity at the receiver
#' @return Propagation loss (PL) (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 43.
#' @author Jose Gama
#' @examples
#' PropagationLoss( 1000, 500 )
PropagationLoss <- function( I0, Ir ) 10 * log10(I0 / Ir)

#' Power spherical spreading law
#' @description Returns the Power spherical spreading law
#' @param r radius (meters)
#' @param Ir intensity at radius r
#' @return total power (Watts)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 44.
#' @author Jose Gama
#' @examples
#' PowerSphericalSpreadingLaw( 1000, 500 )
PowerSphericalSpreadingLaw <- function( r, Ir ) 4 * pi * r^2 * Ir

#' PL to range r spherical spreading law in logarithmic form
#' @description Returns the PL to range r spherical spreading law in logarithmic form
#' @param r radius (meters)
#' @return Propagation loss (PL) (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 44.
#' @author Jose Gama
#' @examples
#' PLsphericalSpreadingLaw( 1000 )
PLsphericalSpreadingLaw <- function( r ) 20 * log10(r)

#' Power cylindrical spreading law
#' @description Returns the Power cylindrical spreading law
#' @param r radius (meters)
#' @param h distance between 2 planes (meters)
#' @param Ir intensity at radius r
#' @return total power (Watts)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 45.
#' @author Jose Gama
#' @examples
#' PowerCylindricalSpreadingLaw( 1000, 100, 500 )
PowerCylindricalSpreadingLaw <- function( r, h, Ir ) 2 * pi * r * h * Ir

#' PL to range r cylindrical spreading law in logarithmic form
#' @description Returns the PL to range r cylindrical spreading law in logarithmic form
#' @param r radius (meters)
#' @return Propagation loss (PL) (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 45.
#' @author Jose Gama
#' @examples
#' PLcylindricalSpreadingLaw( 1000 )
PLcylindricalSpreadingLaw <- function( r ) 10 * log10(r)

#' Molecular relaxation attenuation coeficient approximation
#' @description Returns the Molecular relaxation attenuation coeficient approximation
#' @param f, frequency (Hz)
#' @return alpha Molecular relaxation attenuation coeficient
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 47.
#' @author Jose Gama
#' @examples
#' MolecularRelaxationAttenuationCoeficientApproximation( 1000 )
MolecularRelaxationAttenuationCoeficientApproximation  <- function( f ) 0.05 * f ^1.4

#' PL Spherical Spreading and Absorption
#' @description Returns the PL Spherical Spreading and Absorption
#' @param r radius (meters)
#' @param alpha Molecular relaxation attenuation coeficient
#' @return Propagation loss (PL) (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 48.
#' @author Jose Gama
#' @examples
#' PLSphericalSpreadingAndAbsorption( 1000, 0.9 )
PLSphericalSpreadingAndAbsorption <- function( r, alpha ) 20 * log10(r) + alpha * r * 1e-3

#' Target Strength (TS)
#' @description Returns the Target Strength (TS), the echo returned by an underwater target
#' @param Ir reflected intensity referred to 1 m from the acoustic centre of the target
#' @param Ii incident intensity
#' @return Target Strength (TS)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 67.
#' @author Jose Gama
#' @examples
#' TargetStrength( 900, 1000 )
TargetStrength <- function( Ir, Ii ) 10 * log10(Ir / Ii)

#' peak pressure of the incident and reflected pulses
#' @description Returns the peak pressure of the incident and reflected pulses
#' @param Pr pressure of the reflected pulse
#' @param Pi pressure of the incident pulse
#' @return Target Strength (TS)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 68.
#' @author Jose Gama
#' @examples
#' PeakTS( 900, 1000 )
PeakTS <- function( Pr, Pi ) 20 * log10(Pr / Pi)

#' target strength sphere
#' @description Returns the target strength sphere
#' @param r radius (meters)
#' @return Target Strength (TS) (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 69.
#' @author Jose Gama
#' @examples
#' PeakTS( 900, 1000 )
TargetStrengthSphere <- function( r ) 10 * log10(r^2 / 4)

#' target strength Convex surface
#' @description Returns the target strength Convex surface
#' @param r1 principal radii  (meters)
#' @param r2 principal radii  (meters)
#' @return Target Strength (TS) (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 70.
#' @author Jose Gama
#' @examples
#' TargetStrengthConvexSurface( 100, 50 )
TargetStrengthConvexSurface <- function( r1, r2 ) 10 * log10(r1 * r2 / 4)

#' target strength Plate of any shape
#' @description Returns the target strength Plate of any shape
#' @param A area  (meters)
#' @param lambda wavelength
#' @return Target Strength (TS) (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 70.
#' @author Jose Gama
#' @examples
#' TargetStrengthPlateAnyShape( 10, 500 )
TargetStrengthPlateAnyShape <- function( A, lambda ) 10 * log10(A / lambda)^2

#' target strength Rectangular Plate normal
#' @description Returns the target strength Rectangular Plate normal
#' @param A side, A>=B  (meters)
#' @param B side (meters)
#' @param lambda wavelength
#' @return Target Strength (TS) (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 70.
#' @author Jose Gama
#' @examples
#' TargetStrengthRectangularPlateNormal( 10, 500, 500 )
TargetStrengthRectangularPlateNormal <- function( A, B, lambda ) 10 * log10(A * B / lambda)^2

#' target strength Rectangular Plate, theta to normal
#' @description Returns the target strength Rectangular Plate, theta to normal
#' @param A side, A>=B  (meters)
#' @param B side (meters)
#' @param lambda wavelength
#' @param theta angle to normal
#' @return Target Strength (TS) (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 70.
#' @author Jose Gama
#' @examples
#' TargetStrengthRectangularPlateThetaToNormal( 10, 500, 500, 45 )
TargetStrengthRectangularPlateThetaToNormal <- function( A, B, lambda, theta ) 
{
x <- (2 * pi * A / lambda) * sin(theta)
10 * log10(A * B / lambda)^2 + 20 * log10(sin(x) / x) + 20 * log10(cos(theta))
}

#' target strength Circular Plate normal
#' @description Returns the target strength Circular Plate normal
#' @param r radius (meters)
#' @param lambda wavelength
#' @return Target Strength (TS) (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 70.
#' @author Jose Gama
#' @examples
#' TargetStrengthCircularPlateNormal( 10, 500 )
TargetStrengthCircularPlateNormal <- function( r, lambda ) 10 * log10(pi * r^2 / lambda)^2

#' target strength Cylinder normal
#' @description Returns the target strength Cylinder normal
#' @param r radius (meters)
#' @param L length (meters)
#' @param lambda wavelength
#' @return Target Strength (TS) (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 70.
#' @author Jose Gama
#' @examples
#' TargetStrengthCylinderNormal( 10, 5, 500 )
TargetStrengthCylinderNormal <- function( r, L, lambda ) 10 * log10(r * L^2 / (2*lambda))^2

#' target strength Cylinder, theta to normal
#' @description Returns the target strength Cylinder, theta to normal
#' @param r radius (meters)
#' @param L length (meters)
#' @param lambda wavelength
#' @param theta angle to normal
#' @return Target Strength (TS) (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 70.
#' @author Jose Gama
#' @examples
#' TargetStrengthCylinderThetaToNormal( 10, 5, 500, 45 )
TargetStrengthCylinderThetaToNormal <- function( r, L, lambda, theta ) 
{
x <- (2 * pi * L / lambda) * sin(theta)
10 * log10(r * L^2 / (2*lambda))^2 + 20 * log10(sin(x) / x) + 20 * log10(cos(theta))
}

#' sonar equation 
#' @description Returns the sonar equation EL = SL - 2PL + TS
#' @param SL source level
#' @param PL propagation loss
#' @param TS target strength
#' @return EL echo level
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 68.
#' @author Jose Gama
SonarEquation  <- function( SL, PL, TS ) SL - 2 * PL + TS

#' basic sonar equation 
#' @description Returns the basic sonar equation SE = S - N + DT
#' @param S signal
#' @param N noise
#' @param DT detection threshold
#' @return SE signal excess (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 120.
#' @author Jose Gama
BasicSonarEquation  <- function( S, N, DT ) S - N + DT

#' basic passive sonar equation 
#' @description Returns the basic passive sonar equation SE = (SL - PL) - N = DT
#' @param SL is the source level of the target
#' @param PL propagation loss
#' @param N noise
#' @return SE signal excess (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 120.
#' @author Jose Gama
BasicPassiveSonarEquation <- function( SL, PL, N ) (SL - PL) - N

#' basic active sonar equation 
#' @description Returns the basic active sonar equation SE = (SL + TS - 2 * PL) - N - DT
#' @param SL is the source level of the target
#' @param TS target strength
#' @param PL propagation loss
#' @param N noise
#' @param DT detection threshold
#' @return SE signal excess (dB)
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 120.
#' @author Jose Gama
BasicActiveSonarEquation  <- function( SL, TS, PL, N, DT ) (SL + TS - 2 * PL) - N - DT

#' Detection index
#' @description Returns the Detection index
#' @param S signal
#' @param N noise
#' @return Detection index
#' @references Waite A. D., 2002
#' Sonar for Practising Engineers, 3rd Edition
#' Chichester: Wiley. pp. 120.
#' @author Jose Gama
DetectionIndex <- function( S, N ) ((mean(S + N) - mean(N)) / (sd(N)))^2


