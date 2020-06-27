# Function: shinyDashboardLogo --------------------------------------------------------------------------
#' @title shinyDashboardLogo
#' @description Calls a custom logo object created using shinyDashboardLogoDIY
#'
#' @param theme String. Name of theme to be used
#'
#' @return HTML code. Logo for shinydashboard's sidebar.
#' @examples
#' ...
#' ### ui
#' ui <- dashboardPage(
#'
#'   ### ui header
#'   dashboardHeader(
#'
#'     ### changing logo
#'     title = shinyDashboardLogo(
#'       theme = "blue_gradient",
#'       boldText = "Shiny",
#'       mainText = "App",
#'       badgeText = "v1.1"
#'     )
#'     ...
#' @seealso \code{\link{shinyDashboardLogoDIY}, \link{shinyDashboardThemes}}
#' @note This logo design was inspired from \url{http://www.dataseries.org/}.
#' @export
shinyDashboardLogo <- function(theme, boldText, mainText, badgeText) {

  if (theme == "blue_gradient") {

    return(logo_blue_gradient(boldText = boldText, mainText = mainText, badgeText = badgeText))

  } else if (theme == "grey_light") {

    return(logo_grey_light(boldText = boldText, mainText = mainText, badgeText = badgeText))

  } else if (theme == "grey_dark") {

    return(logo_grey_dark(boldText = boldText, mainText = mainText, badgeText = badgeText))

  } else if (theme == "onenote") {

    return(logo_onenote(boldText = boldText, mainText = mainText, badgeText = badgeText))

  } else if (theme == "poor_mans_flatly") {

    return(logo_poor_mans_flatly(boldText = boldText, mainText = mainText, badgeText = badgeText))

  } else if (theme == "purple_gradient") {

    return(logo_purple_gradient(boldText = boldText, mainText = mainText, badgeText = badgeText))

  } else if (theme == "boe_website") {

    stop("dashboardthemes: boe_website has been discontinued after v1.1.0, please use flat_red instead.")

  } else {

    stop("dashboardthemes: the chosen theme isn't supported.")

  }

}
