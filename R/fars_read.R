#' Read in CSV file.
#'
#' Read the CSV file containing American public yearly data
#' regarding fatal injuries suffered in motor vehicle traffic crashes, then
#' convert the default dataframe format to tibble.
#'
#' @param filename name of CSV file
#'
#' @return Tibble of read-in dataset
#'
#'
#' @examples
#' \dontrun{fars_read("accident_2013.csv")}
#'
#' @details
#' \itemize{
#'  \item{}{If the \code{filename} does not exist in the current dictionary, R
#' will be stopped and pose a warning massage}
#'  \item{}{User is recommended to initially install package \code{\link{readr}}
#' and \code{\link{dplyr}}}
#' }
#'
#' @export
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}


