#'Summarize the counts of occurence
#'
#'Create dataframe to summarize the counts of occurence of
#'fatal injuries suffered in motor vehicle traffic crashes.
#'
#'
#'@param years integer or integer vectors specifying year
#' of the dataset ready to be read in
#'
#'@return Tibble summarizing the counts of occurence by
#'month for the year
#'
#'@examples
#'\dontrun{years <- c(2013,2014,2015)
#'fars_summarize_years(years)}
#'@details
#' \itemize{
#'  \item{}{Valid years are exclusively 2013, 2014 and 2015, an error
#'  message will be post and program will be stopped if invalid years
#'  are inputted}
#'  \item{}{User is required to install prerequisted package \code{\link{dplyr}}
#'  and \code{\link{tidyr}}, an error message will be post and program will be stopped}
#'  }
#'
#'@export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
