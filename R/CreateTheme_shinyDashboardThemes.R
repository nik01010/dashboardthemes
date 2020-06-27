# Function: shinyDashboardThemes ------------------------------------------------------------------------
#' @title shinyDashboardThemes
#' @description Calls a custom theme object created using shinyDashboardThemeDIY
#'
#' @section Available themes:
#' \itemize{
#'   \item \strong{blue_gradient}: Demonstrates use of gradients, shadows and rounded corners.
#'   \item \strong{flat_red}: Flat colour theme with red highlights.
#'   \item \strong{grey_light}: Lightweight grey theme.
#'   \item \strong{grey_dark}: Demonstrates use of inverted dark colour schemes.
#'   \item \strong{onenote}: Styled similarly to the OneNote application.
#'   \item \strong{poor_mans_flatly}: Poor man`s version of the \href{https://bootswatch.com/flatly/}{Flatly} theme.
#'   \item \strong{purple_gradient}: Demonstrates use of dark gradients and rounded corners.
#' }
#' @param theme String. Name of theme to be used
#'
#' @return CSS code. Theme for shinydashboard.
#' @examples
#' ...
#' ### ui body
#' dashboardBody(
#'
#'   ### changing theme
#'   shinyDashboardThemes(
#'     theme = "blue_gradient"
#'   )
#'
#'   ### ui tabs
#'   ,tabItems(
#'     tabItem(
#'       ...
#' @seealso \code{\link{shinyDashboardThemeDIY}, \link{shinyDashboardLogo}}
#' @export
shinyDashboardThemes <- function(theme) {

  if (theme == "blue_gradient") {

    return(theme_blue_gradient)

  } else if (theme == "flat_red") {

    return(theme_flat_red)

  } else if (theme == "grey_light") {

    return(theme_grey_light)

  } else if (theme == "grey_dark") {

    return(theme_grey_dark)

  } else if (theme == "onenote") {

    return(theme_onenote)

  } else if (theme == "poor_mans_flatly") {

    return(theme_poor_mans_flatly)

  } else if (theme == "purple_gradient") {

    return(theme_purple_gradient)

  } else if (theme == "boe_website") {

    stop("dashboardthemes: boe_website has been discontinued after v1.1.0, please use flat_red instead.")

  } else {

    stop("dashboardthemes: the chosen theme isn't supported.")

  }

}
