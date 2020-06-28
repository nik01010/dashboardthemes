# Function: shinyDashboardLogoDIY -----------------------------------------------------------------------
#' @title shinyDashboardLogoDIY
#' @description Creates a custom logo object for a shinydashboard application
#'
#' @param boldText String. Bold text for the logo.
#' @param mainText String. Main text for the logo.
#' @param textSize Numeric. Text size for the logo. Defaults to 15.
#' @param badgeText String. Text for the logo badge.
#' @param badgeTextColor String. Text color of the logo badge.
#' @param badgeTextSize Numeric. Text color of the logo badge. Defaults to 2.
#' @param badgeBackColor String. Background color of the logo badge.
#' @param badgeBorderRadius Numeric. Border radius of the logo badge. Defaults to 3.
#'
#' @return HTML code. Logo for shinydashboard's sidebar.
#' @examples
#' \dontrun{
#' customLogo <- shinyDashboardLogoDIY(
#'   boldText = "SD"
#'   ,mainText = "Themes"
#'   ,textSize = 16
#'   ,badgeText = "v1.1"
#'   ,badgeTextColor = "white"
#'   ,badgeTextSize = 2
#'   ,badgeBackColor = "#40E0D0"
#'   ,badgeBorderRadius = 3
#' )
#' }
#' @seealso \code{\link{shinyDashboardLogo}, \link{cssGradientThreeColors}}
#' @note This logo design was inspired from \url{http://www.dataseries.org/}.
#' @export
shinyDashboardLogoDIY <- function(
  boldText, mainText, textSize = 15, badgeText, badgeTextColor,
  badgeTextSize = 2, badgeBackColor, badgeBorderRadius = 3
) {

  htmlCode <- htmltools::HTML(
    text = paste0(
      "<p style=\"font-size:", textSize, "px\">
      <b> ", boldText, " </b>",
      mainText, "<span> &nbsp; </span>
      <span style=\"background-color: ", badgeBackColor, ";
      border-radius: ", badgeBorderRadius, "px; \"> &nbsp;
      <font color=\"", badgeTextColor, "\" size=\"", badgeTextSize, "\">",
      badgeText, "  </font> &nbsp; </span> </p>"
    )
  )

  # removing new line symbols and formatting spacing
  htmlCode <- gsub(pattern = "\n", replacement = "", x = htmlCode)
  htmlCode <- gsub(pattern = "[[:space:]]{2,3}", replacement = "", x = htmlCode)

  return(htmlCode)
}
