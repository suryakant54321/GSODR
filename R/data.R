#' Station information for the US National Climatic Data Centre (NCDC)
#' Global Surface Summary of the Day (GSOD) weather data. The original file has
#' missing and incorrect information. This is a clean version of this dataset,
#' provided by this package. The following changes were made.
#'
#' 1. Stations with both a latitude and longitude of 0 degrees were removed.
#' 2. Stations with longitude values that are beyond -180/180 degrees were
#' removed.
#' 3. Stations with latitude values that are beyond -90/90 degrees were
#' removed.
#' 4. For convenience elevation is converted from decimetres to metres.
#' 5. STNID is added as a column, a concatenation of USAF and WBAN.
#'
#' Users of these data should take into account the following (from the NCDC
#' website): "The following data and products may have conditions placed on
#' their international commercial use. They can be used within the U.S. or for
#' non-commercial international activities without restriction. The non-U.S.
#' data cannot be redistributed for commercial purposes. Re-distribution of
#' these data by others must provide this same notification."
#'
#' To access this data frame of station information, use data(stations) to load
#' it into the global environment.
#'
#' @format A data frame with 27699 observations of 12 variables:
#' \describe{
#'   \item{USAF}{Air Force Datsav3 station number}
#'   \item{WBAN}{Weather Bureau Army Navy (5 digit identifier)}
#'   \item{STN.NAME}{Unique station name}
#'   \item{CTRY}{FIPS country ID}
#'   \item{STATE}{If applicable, US states only (2 letter code)}
#'   \item{CALL}{ICAO Identifier, identifiers approved for use under the
#'   International Civil Aviation Administration plan of identifiers
#'   (4 letter identifier)}
#'   \item{LAT}{Latitude in thousandths of decimal degrees}
#'   \item{LON}{Longitude in thousandths of decimal degrees}
#'   \item{ELEV.M}{Elevation to tenthts in metres}
#'   \item{BEGIN}{First available date of data for station, YYYYMMDD format}
#'   \item{END}{Last available date of data for station, YYYYMMDD format}
#'   \item{STNID}{Unique station ID, a concatenation of USAF and WBAN number,
#'   used for merging with station data weather files}
#' }
#' @source \url{ftp://ftp.ncdc.noaa.gov/pub/data/noaa/isd-history.csv}
"stations"