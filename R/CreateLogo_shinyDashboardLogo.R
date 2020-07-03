# Function: shinyDashboardLogo --------------------------------------------------------------------------
#' @title shinyDashboardLogo
#' @description Calls a custom logo object created using shinyDashboardLogoDIY
#'
#' @param theme String. Name of theme to be used
#' @param boldText String. Bold text for the logo.
#' @param mainText String. Main text for the logo.
#' @param badgeText String. Text for the logo badge.
#'
#' @return HTML code. Logo for shinydashboard's sidebar.
#' @examples
#' \donttest{
#' #...
#' ### ui
#' #ui <- dashboardPage(
#'
#'   ### ui header
#'   #dashboardHeader(
#'
#'     ### changing logo
#'     title = shinyDashboardLogo(
#'       theme = "blue_gradient",
#'       boldText = "Shiny",
#'       mainText = "App",
#'       badgeText = "v1.1"
#'     )
#'     #...
#' }
#' @seealso \code{\link{shinyDashboardLogoDIY}, \link{shinyDashboardThemes}}
#' @note This logo design was inspired from \url{http://www.dataseries.org/}.
#' @export
shinyDashboardLogo <- function(theme, boldText = "Shiny", mainText = "App", badgeText = "v1.1") {

  if (theme == "blue_gradient") {
    return(
      dashboardthemes::logo_blue_gradient(boldText = boldText, mainText = mainText, badgeText = badgeText)
    )

  } else if (theme == "flat_red") {
    return(
      dashboardthemes::logo_flat_red(boldText = boldText, mainText = mainText, badgeText = badgeText)
    )

  } else if (theme == "grey_light") {
    return(
      dashboardthemes::logo_grey_light(boldText = boldText, mainText = mainText, badgeText = badgeText)
    )

  } else if (theme == "grey_dark") {
    return(
      dashboardthemes::logo_grey_dark(boldText = boldText, mainText = mainText, badgeText = badgeText)
    )

  } else if (theme == "onenote") {
    return(
      dashboardthemes::logo_onenote(boldText = boldText, mainText = mainText, badgeText = badgeText)
    )

  } else if (theme == "poor_mans_flatly") {
    return(
      dashboardthemes::logo_poor_mans_flatly(boldText = boldText, mainText = mainText, badgeText = badgeText)
    )

  } else if (theme == "purple_gradient") {
    return(
      dashboardthemes::logo_purple_gradient(boldText = boldText, mainText = mainText, badgeText = badgeText)
    )

  } else if (theme == "boe_website") {

    stop("The boe_website theme has been discontinued after v1.1.0, please use flat_red instead.")

  } else {

    stop("The chosen theme isn't supported.")

  }

}
