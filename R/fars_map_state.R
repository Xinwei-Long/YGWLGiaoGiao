#'Plot the spot of crashes
#'
#'Plot the spot of fatal injuries suffered in motor vehicle
#'traffic crashes on the map of the state specified by state
#'number.
#'
#'
#' @param state.num string or integer specifying the state number
#' corresponing to an existing state in US
#'
#' @param year integer specifying year of the dataset ready to be
#' read in
#'
#' @return Plot of crashes on the map by latitude and longitude
#'
#'@examples
#' \dontrun{year <- 2013
#' state.num <- "31"
#' fars_map_state(state.num,year)}
#'
#'@details
#' \itemize{
#'  \item{}{Valid years are exclusively 2013, 2014 and 2015, an error
#'  message will be post and program will be stopped if invalid years
#'  are inputted}
#'  \item{}{User is required to install prerequisted package \code{\link{dplyr}}
#'  and \code{\link{maps}}, an error message will be post and program will be stopped}
#'  }
#'
#'@export
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
