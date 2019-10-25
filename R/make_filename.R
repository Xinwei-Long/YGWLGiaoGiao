#'Make name for read-in dataset of specific year
#'
#'Make name for the CSV file containing Americam public
#'yearly data regarding fatal injuries suffered in motor
#'vehicle traffic crashes.
#'
#' @param year integer or string specifying
#' year of the dataset ready to be read in.
#'
#' @return string or a vector of strings specifying the CSV file name.
#'
#' @examples
#' \dontrun{make_filename <- function(2013)}
#'
#' @export
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
