# GSODR v0.2

## NEW FEATURES
  * Output files now include fields for State (US only) and Call (International
  Civil Aviation Organization (ICAO) Airport Code)  
  * Country is specified using FIPS codes in filename and output file contents
  due to stations occurring in some locales that lack ISO 3166 3 letter country
  codes
  * R >= 3.2.0 now required   
  * Use FIPS codes in place of ISO3c for filename and in output files because
  some stations do not have an ISO country code  
  * Spatial file output is now in GeoPackage format (GPKG). This results in a single
  file and allows for long field names  
  * Long field names now used in file outputs  
  * Field names in output files use "\_" in place of "."  
  
## MINOR IMPROVEMENTS

  * `get_GSOD` function optimised for speed as best possible after FTPing files
  from NCDC server  
  * Updated `stations` list with latest version from NCDC published 28-07-2016  
  * Reduce package dependencies, remove `dplyr`, `iotools`, `raster`,
  `settings`, and `stringr`  

## BUG FIXES

## DEPRECATED AND DEFUNCT
  * The `path` parameter is now instead called `dsn` to be more inline with
  other tools like `readOGR()` and the possibility of writing directly to a
  database from `get_GSOD()`  
  * Shapefile file out is no longer supported. Use GeoPackage (GPKG)  instead  

******

# GSODR v0.1.9 (Release Date: 2016-07-15)

## Bug fixes
  * Fix bug in precipitation calculation. Documentation states that PRCP is in
  mm to hundredths. Issues with conversion and missing values meant that this
  was not the case. Thanks to Gwenael Giboire for reporting and help with fixing
  this  

## Changes
  * Users can now select to merge output for station queries across multiple
  years. Previously one year = one file per station. Now were set by user,
  `merge_station_years = TRUE` parameter, only one output file is generated  
  * Country list is now included in the package to reduce run time necessary
  when querying for a specific country. However, this means any time that the
  country-list.txt file is updated, this package needs to be updated as well  
  * Updated `stations` list with latest version from NCDC published 12-07-2016  

## Improvements
  * Country level, agroclimatology and global data query conversions and
  calculations are processed in parallel now to reduce runtime  
  * Improved documentation with spelling fixes, clarification and updates  
  * Enable `ByteCompile` option upon installation for small increase in speed  
  * Use `write.csv.raw` from `[iotools]("https://cran.r-project.org/web/packages/iotools/index.html")`
  to greatly improve runtime by decreasing time used to write CSV files to disk  
  * Use `writeOGR` from `rgdal`, in place of `raster's` `shapefile` to improve
  runtime by decreasing time used to write shapefiles to disk  

******

# GSODR v0.1.8.1 (Release Date: 2016-07-07)

  * Fix bug where no station is specified, function fails to run

******

# GSODR v0.1.8 (Release Date: 2016-07-04)
## Bug fixes
  * Fix bug with connection timing out for single station queries commit:  [a126641e00dc7acc21844ff0436e5702f8b6e04a](https://github.com/adamhsparks/GSODR/commit/a126641e00dc7acc21844ff0436e5702f8b6e04a)  
  * Somehow the previously working function that checked country names broke
  with the `toupper()` function. A new [function from juba](http://stackoverflow.com/questions/16516593/convert-from-lowercase-to-uppercase-all-values-in-all-character-variables-in-dat)
  fixes this issue and users can now select country again  

## Changes
  * User entered values for a single station are now checked against actual
  station values for validity  
  * stations.rda is compressed  
  * stations.rda now includes a field for "corrected" elevation using
  hole-filled SRTM data from Jarvis et al. 2008, see
  [https://github.com/adamhsparks/GSODR/blob/devel/data-raw/fetch_isd-history.md](https://github.com/adamhsparks/GSODR/blob/devel/data-raw/fetch_isd-history.md)  
  for a description  
  * Set NA or missing values in CSV or shapefile to -9999 from -9999.99 to align
  with other data sources such as Worldclim


## Improvements
  * Documentation is more complete and easier to use  

******

# GSODR v0.1.7 (Release Date: 2016-06-02)

## Bug fixes
  * Fix issues with MIN/MAX where MIN referred to MAX [(Issue 5)](https://github.com/adamhsparks/GSODR/issues/5)  
  * Fix bug where the `tf` item was incorrectly set as `tf <- "~/tmp/GSOD-2010.tar`, not `tf <- tempfile`, in `get_GSOD` [(Issue 6)](https://github.com/adamhsparks/GSODR/issues/6)  
  * CITATION file is updated and corrected  

## Changes
  * User now has the ability to generate a shapefile as well as CSV file output [(Issue 3)](https://github.com/adamhsparks/GSODR/issues/3)  

## Improvements
  * Documentation is more complete and easier to use  

******

# GSODR v0.1.6 (Release date: 2016-05-26)

## Bug fixes
  * Fix issue when reading .op files into R where temperature was incorrectly read causing negative values where T >= 100F, this issue caused RH values of >100% and incorrect TEMP values [(Issue 1)](https://github.com/adamhsparks/GSODR/issues/1)
  * Spelling corrections

## Changes
  * Include MIN/MAX flag column
  * Station data is now included in package rather than downloading from NCDC every time get_GSOD() is run, this data has some corrections where stations with missing LAT/LON values or elevation are omitted, this is **not** the original complete station list provided by NCDC

******

# GSODR v0.1.5 (Release date: 2016-05-16)

## Bug fixes
  * Fixed bug where YDAY not correctly calculated and reported in CSV file
  * CSV files for station only queries now are names with the Station Identifier. Previously named same as global data
  * Likesise, CSV files for agroclimatology now are names with the Station Identifier. Previously named same as global data

## Changes
  * Set values where MIN > MAX to NA
  * Set more MIN/MAX/DEWP values to NA. GSOD README indicates that 999 indicates missing values in these columns, this does not appear to always be true. There are instances where 99 is the value recorded for missing data. While 99F is possible, the vast majority of these recorded values are missing data, thus the function now converts them to NA

******

# GSODR v0.1.4 (Release date: 2016-05-09)

## Bug fixes
  * Fixed bug related to MIN/MAX columns when agroclimatology or all stations are selected where flags were not removed properly from numeric values.

## Changes
  * Add more detail to DESCRIPTION regarding flags found in original GSOD data.

******

# GSODR v0.1.3 (Release date: 2016-05-06)

## Bug fixes
  * Bug fix in MIN/MAX with flags. Some columns have differing widths, which caused a flag to be left attached to some values
  * Correct URL in README.md for CRAN to point to CRAN not GitHub

## Changes
  * Set NA to -9999.99

******

# GSODR v0.1.2 (Release date: 2016-05-05)

## Bug fixes
  * Bug fix in importing isd-history.csv file. Previous issues caused all lat/lon/elev values to be >0.
  * Bug fix where WDSP was mistyped as WDPS causing the creation of a new column, rather than the conversion of the existing
  * Bug fix if Agroclimatology selected. Previously this resulted in no records.
  * Set the default encoding to UTF8.
  * Bug fix for country selection. Some countries did not return proper ISO code.

## Changes
* Use write.csv, not readr::write_csv due to issue converting double to string: https://github.com/hadley/readr/issues/387

******

# GSODR v0.1.1 (Release date: 2016-04-21)

## Changes
  * Now available on CRAN

## Changes
  * Add single quotes around possibly misspelled words and spell out comma-separated values and geographic information system rather than just using "CSV" or "GIS" in DESCRIPTION.
  * Add full name of GSOD (Global Surface Summary of the Day) and URL for GSOD, https://data.noaa.gov/dataset/global-surface-summary-of-the-day-gsod to DESCRIPTION as requested by CRAN.
  * Require user to specify directory for resulting .csv file output so that any files written to disk are interactive and with user's permission

******

# GSODR v0.1 (Release date: 2016-04-18)

## Changes
  * Initial submission to cran
