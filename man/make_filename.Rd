% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make_filename.R
\name{make_filename}
\alias{make_filename}
\title{Make name for read-in dataset of specific year}
\usage{
make_filename(year)
}
\arguments{
\item{year}{integer or string specifying
year of the dataset ready to be read in.}
}
\value{
string or a vector of strings specifying the CSV file name.
}
\description{
Make name for the CSV file containing Americam public
yearly data regarding fatal injuries suffered in motor
vehicle traffic crashes.
}
\examples{
\dontrun{make_filename <- function(2013)}

}
