#' Extract top 20 programming languages from TIOBE index
#'
#' This function returns a dataframe containing top 20 programming languages
#' from TIOBE index.
#'
#' @return A data frame with the folowing columns: Position this month,
#'    Position the same month but previous year, Programming language, Ratings,
#'    Change.
#' @export
#' @examples
#' top_20()
top_20 <- function() {
  # Drop the 3rd column because it contains no data
  df("#top20")[-3]
}

#' Extract top programming languages from TIOBE index with positions from 21 to 50
#'
#' This function returns a dataframe containing top programming languages
#' from TIOBE index with positions from 21 to 50.
#'
#' @return A data frame with the folowing columns: Position, Programming
#'    language, Ratings.
#' @export
#' @examples
#' top_50()
top_50 <- function() {
  df("#otherPL")
}

#' Extract programming languages hall of fame from TIOBE index
#'
#' This function returns a dataframe containing programming languages hall of
#' fame from TIOBE index.
#'
#' @return A data frame with the folowing columns: Year, Winner.
#' @export
#' @examples
#' hall_of_fame()
hall_of_fame <- function() {
  df("#PLHoF")
}

#' Extract data frame from the HTML table
#'
#' This function returns a dataframe from the HTML table specified with the
#' selector.
#'
#' @param selector An [rvest::html_node()] compatible selector.
#' @return A data frame with [rvest::html_table()]
#' @noRd
#'
df <- function(selector) {
  url <- "https://www.tiobe.com/tiobe-index/"
  html <- xml2::read_html(url)
  table <- rvest::html_node(html, selector)
  rvest::html_table(table)
}
