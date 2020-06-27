# Function: cssGradientThreeColors ----------------------------------------------------------------------
#' @title cssGradientThreeColors
#' @description Generates CSS code for a gradient with three colors
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
#' \dontrun{
#' cssGradientThreeColors(
#'   direction = "right"
#'   ,colorStart = "rgba(44,222,235,1)"
#'   ,colorMiddle = "rgba(44,222,235,1)"
#'   ,colorEnd = "rgba(0,255,213,1)"
#'   ,colorStartPos = 0
#'   ,colorMiddlePos = 30
#'   ,colorEndPos = 100
#' )
#' }
#' @seealso \code{\link{shinyDashboardThemeDIY}, \link{shinyDashboardLogoDIY}},
#' @export
cssGradientThreeColors <- function(
  direction = "down", colorStart, colorMiddle, colorEnd, colorStartPos = 0,
  colorMiddlePos = 50, colorEndPos = 100
) {

  # handling direction types
  if (direction == "down") {
    colorStartSide <- "top"
    colorStartSideCorner <- "left top"
    colorEndSideCorner <- "left bottom"
    colorDirection <- "to bottom"
  } else if (direction == "right") {
    colorStartSide <- "left"
    colorStartSideCorner <- "left top"
    colorEndSideCorner <- "right top"
    colorDirection <- "to right"
  } else {
    stop("The chosen direction isn't supported.")
  }

  # building up css code
  cssCode <- paste0(
    colorStart, ';
  background: -moz-linear-gradient(',
    colorStartSide, ', ', colorStart, " ", colorStartPos, '%, ', colorMiddle,
    " ", colorMiddlePos, '%,', colorEnd, " ", colorEndPos, '%);
  background: -webkit-gradient(',
    colorStartSideCorner, ',', colorEndSideCorner, ',
    color-stop(', colorStartPos, '%, ', " ", colorStart, '),
    color-stop(', colorMiddlePos, '%, ', colorMiddle, '),
    color-stop(', colorEndPos, '%,', colorEnd, '));
  background: -webkit-linear-gradient(',
    colorStartSide, ', ', " ", colorStart, " ", colorStartPos, '%, ', colorMiddle, " ",
    colorMiddlePos, '%, ', colorEnd, " ", colorEndPos, '%);
  background: -o-linear-gradient(',
    colorStartSide, ', ', " ", colorStart, " ", colorStartPos, '%, ', colorMiddle, " ",
    colorMiddlePos, '%, ', colorEnd, " ", colorEndPos, '%);
  background: -ms-linear-gradient(',
    colorStartSide, ', ', " ", colorStart, " ", colorStartPos, '%, ', colorMiddle, " ",
    colorMiddlePos, '%, ', colorEnd, " ", colorEndPos, '%);
  background: linear-gradient(',
    colorDirection, ', ', " ", colorStart, " ", colorStartPos, '%, ', colorMiddle, " ",
    colorMiddlePos, '%, ', colorEnd, " ", colorEndPos, '%)'
  )

  # removing new line symbols
  newLinePattern <- "\n"
  cssCode <- gsub(pattern = newLinePattern, replacement = "", x = cssCode)

  return(cssCode)
}
