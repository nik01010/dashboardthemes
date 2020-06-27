### ReadMe ------------------------------------------------------------------
### Purpose:        This script provides functions required for customising themes
###                 in shinydashboard applications.
###
### Contact:        Nik Lilovski (nik.lilovski@outlook.com)
###
#' dashboardthemes: a package for custom themes in shinydashboard applications
#'
#' The dashboardthemes package provides two main important features:
#' \itemize{
#'   \item Using new pre-defined themes and logos for dashboards.
#'   \item Creating custom themes and logos for dashboards.
#' }
#'
#' @section Available functions:
#' The available functions are:
#' \itemize{
#'   \item \code{\link{shinyDashboardThemes}}: Calls a custom theme created using shinyDashboardThemeDIY.
#'   \item \code{\link{shinyDashboardLogo}}: Calls a custom logo created using shinyDashboardLogoDIY.
#'   \item \code{\link{shinyDashboardThemeDIY}}: Creates a custom theme object.
#'   \item \code{\link{shinyDashboardLogoDIY}}: Creates a custom logo object. Inspired from \href{http://www.dataseries.org/}{here}.
#'   \item \code{\link{cssGradientThreeColors}}: Creates a three colour gradient to be used in themes.
#' }
#'
#' @docType package
#' @name dashboardthemes
NULL


### Function: cssGradientThreeColors ----------------------------------------
#' Generates CSS code for a gradient with three colors
#'
#' @param direction String. Direction of the gradient (down/right). Defaults to down.
#' @param colorStart String. Start (top/left) colour of the gradient.
#' @param colorMiddle String. Middle colour of the gradient.
#' @param colorEnd String. End (bottom/right) colour of the gradient.
#' @param colorStartPos Numeric. Position of the start colour. Defaults to 0.
#' @param colorMiddlePos Numeric. Position of the middle colour. Defaults to 50.
#' @param colorEndPos Numeric. Position of the end colour; defaults to 100.
#'
#' @return CSS code. Gradient with three colors.
#' @examples
#' cssGradientThreeColors(
#'   direction = "right"
#'   ,colorStart = "rgba(44,222,235,1)"
#'   ,colorMiddle = "rgba(44,222,235,1)"
#'   ,colorEnd = "rgba(0,255,213,1)"
#'   ,colorStartPos = 0
#'   ,colorMiddlePos = 30
#'   ,colorEndPos = 100
#' )
#' @seealso \code{\link{shinyDashboardThemeDIY}, \link{shinyDashboardLogoDIY}},
#' @export
cssGradientThreeColors <- function(direction = "down", colorStart, colorMiddle, colorEnd, colorStartPos = 0,
                                   colorMiddlePos = 50, colorEndPos = 100) {

  ### handling direction types
  if(direction == "down"){
    colorStartSide = "top"
    colorStartSideCorner = "left top"
    colorEndSideCorner = "left bottom"
    colorDirection = "to bottom"

  } else if(direction == "right"){
    colorStartSide = "left"
    colorStartSideCorner = "left top"
    colorEndSideCorner = "right top"
    colorDirection = "to right"

  }


  ### building up css code
  cssCode <- paste0(
    # '
    #   background: ',
    colorStart, ';

    background: -moz-linear-gradient(
    '
    ,colorStartSide
    ,', '
    ,colorStart
    ," "
    ,colorStartPos
    ,'%, '
    ,colorMiddle
    ," ", colorMiddlePos
    ,'%,'
    ,colorEnd
    ," "
    ,colorEndPos
    ,'%
    );

    background: -webkit-gradient(
    '
    ,colorStartSideCorner
    ,'
    ,'
    ,colorEndSideCorner
    ,'
    ,color-stop(
    '
    ,colorStartPos
    ,'%, '
    ," "
    ,colorStart
    ,'
    )
    ,color-stop(
    '
    ,colorMiddlePos
    ,'%, '
    ,colorMiddle
    ,'
    )
    ,color-stop(
    '
    ,colorEndPos
    ,'%
    ,'
    ,colorEnd
    ,'
    )
    );

    background: -webkit-linear-gradient(
    '
    ,colorStartSide
    ,', '
    ," "
    ,colorStart
    ,colorStartPos
    ,'%, '
    ,colorMiddle
    ," "
    ,colorMiddlePos
    ,'%, '
    ,colorEnd
    ," "
    ,colorEndPos
    , '%
    );

    background: -o-linear-gradient(
    '
    ,colorStartSide
    ,', '
    , " "
    ,colorStart
    ,colorStartPos
    ,'%, '
    ,colorMiddle
    ," "
    ,colorMiddlePos
    ,'%, '
    ,colorEnd
    ," "
    ,colorEndPos
    ,'%
    );

    background: -ms-linear-gradient(
    '
    ,colorStartSide
    ,', '
    , " "
    ,colorStart
    ,colorStartPos
    ,'%, '
    ,colorMiddle
    ," "
    ,colorMiddlePos
    ,'%, '
    ,colorEnd
    ," "
    ,colorEndPos
    ,'%
    );

    background: linear-gradient(
    '
    ,colorDirection
    ,', '
    , " "
    ,colorStart
    ,colorStartPos
    ,'%, '
    ,colorMiddle
    ," "
    ,colorMiddlePos
    ,'%, '
    ,colorEnd
    ," "
    ,colorEndPos
    ,'%
    )
    '
    )

  ### output
  return(cssCode)

}


### Function: shinyDashboardLogoDIY -----------------------------------------
#' Creates a custom logo object for a shinydashboard application
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
#' logo_blue_gradient <- shinyDashboardLogoDIY(
#'   boldText = "SD"
#'   ,mainText = "Themes"
#'   ,textSize = 16
#'   ,badgeText = "BETA"
#'   ,badgeTextColor = "white"
#'   ,badgeTextSize = 2
#'   ,badgeBackColor = "#40E0D0"
#'   ,badgeBorderRadius = 3
#' )
#' @seealso \code{\link{shinyDashboardLogo}, \link{cssGradientThreeColors}}
#' @note This logo design was inspired from \url{http://www.dataseries.org/}.
#' @export
shinyDashboardLogoDIY <- function(boldText, mainText, textSize = 15, badgeText, badgeTextColor,
                               badgeTextSize = 2, badgeBackColor, badgeBorderRadius = 3) {

  htmltools::HTML(

    paste0(

      "<p style=\"font-size:", textSize, "px\">

      <b> ", boldText, " </b>",

      mainText ,"<span> &nbsp; </span>

      <span style=\"background-color: ", badgeBackColor, ";

      border-radius: ", badgeBorderRadius ,"px; \"> &nbsp;

      <font color=\"", badgeTextColor, "\" size=\"", badgeTextSize, "\">",

      badgeText ,"  </font> &nbsp; </span> </p>"

    )

  )

}


