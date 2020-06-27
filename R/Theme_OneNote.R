#' @include dashboardthemes.R
NULL


# Logo: OneNote -----------------------------------------------------------------------------------------
#' @title logo_onenote
#' @description OneNote logo for a shinydashboard application
#'
#' @return Object produced by shinyDashboardLogoDIY
#' @seealso \code{\link{shinyDashboardLogoDIY}}
#' @export
logo_onenote <- function(boldText = "Shiny", mainText = "App", badgeText = "v1.1") {
  shinyDashboardLogoDIY(
    boldText = boldText
    ,mainText = mainText
    ,textSize = 16
    ,badgeText = badgeText
    ,badgeTextColor = "purple"
    ,badgeTextSize = 2
    ,badgeBackColor = "rgb(255,255,255)"
    ,badgeBorderRadius = 3
  )
}


# Theme: OneNote ----------------------------------------------------------------------------------------
#' @title theme_onenote
#' @description OneNote theme for a shinydashboard application
#'
#' @return Object produced by shinyDashboardThemeDIY
#' @seealso \code{\link{shinyDashboardThemeDIY}}
#' @export
theme_onenote <- shinyDashboardThemeDIY(

  ### general
  appFontFamily = "Arial"
  ,appFontColor = "rgb(0,0,0)"
  ,primaryFontColor = "rgb(0,0,0)"
  ,infoFontColor = "rgb(0,0,0)"
  ,successFontColor = "rgb(0,0,0)"
  ,warningFontColor = "rgb(0,0,0)"
  ,dangerFontColor = "rgb(0,0,0)"
  ,bodyBackColor = "rgb(255,255,255)"

  ### header
  ,logoBackColor = "rgb(133,47,180)"

  ,headerButtonBackColor = "rgb(133,47,180)"
  ,headerButtonIconColor = "rgb(255,255,255)"
  ,headerButtonBackColorHover = "rgb(110,30,160)"
  ,headerButtonIconColorHover = "rgb(0,0,0)"

  ,headerBackColor = "rgb(133,47,180)"
  ,headerBoxShadowColor = "rgb(220,220,220)"
  ,headerBoxShadowSize = "2px 3px 2px"

  ### sidebar
  ,sidebarBackColor = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "rgb(241,241,241)"
    ,colorMiddle = "rgb(237,237,237)"
    ,colorEnd = "rgb(210,210,210)"
    ,colorStartPos = 0
    ,colorMiddlePos = 97
    ,colorEndPos = 100
  )
  ,sidebarPadding = 0

  ,sidebarMenuBackColor = "transparent"
  ,sidebarMenuPadding = 0
  ,sidebarMenuBorderRadius = 0

  ,sidebarShadowRadius = "0px 0px 0px"
  ,sidebarShadowColor = ""

  ,sidebarUserTextColor = "rgb(0,0,0)"

  ,sidebarSearchBackColor = "rgb(255,255,255)"
  ,sidebarSearchIconColor = "rgb(133,47,180)"
  ,sidebarSearchBorderColor = "rgb(210,210,210)"

  ,sidebarTabTextColor = "rgb(0,0,0)"
  ,sidebarTabTextSize = 13
  ,sidebarTabBorderStyle = "none"
  ,sidebarTabBorderColor = ""
  ,sidebarTabBorderWidth = 0

  ,sidebarTabBackColorSelected = cssGradientThreeColors(
    direction = "down"
    ,colorStart = "rgb(193,193,193)"
    ,colorMiddle = "rgb(216,216,216)"
    ,colorEnd = "rgb(218,218,218)"
    ,colorStartPos = 0
    ,colorMiddlePos = 5
    ,colorEndPos = 100
  )
  ,sidebarTabTextColorSelected = "rgb(133,47,180)"
  ,sidebarTabRadiusSelected = "0px"

  ,sidebarTabBackColorHover = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "rgb(230,230,230)"
    ,colorMiddle = "rgb(225,225,225)"
    ,colorEnd = "rgb(210,210,210)"
    ,colorStartPos = 0
    ,colorMiddlePos = 97
    ,colorEndPos = 100
  )
  ,sidebarTabTextColorHover = "rgb(0,0,0)"
  ,sidebarTabBorderStyleHover = "none"
  ,sidebarTabBorderColorHover = ""
  ,sidebarTabBorderWidthHover = 0
  ,sidebarTabRadiusHover = "0px"

  ### boxes
  ,boxBackColor = "rgb(255,255,255)"
  ,boxBorderRadius = 0
  ,boxShadowSize = "none"
  ,boxShadowColor = ""
  ,boxTitleSize = 18
  ,boxDefaultColor = "rgb(225,225,225)"
  ,boxPrimaryColor = "rgb(95,155,213)"
  ,boxInfoColor = "rgb(235,235,235)"
  ,boxSuccessColor = "rgb(112,173,71)"
  ,boxWarningColor = "rgb(237,125,49)"
  ,boxDangerColor = "rgb(232,76,34)"

  ,tabBoxTabColor = "rgb(255,255,255)"
  ,tabBoxTabTextSize = 14
  ,tabBoxTabTextColor = "rgb(0,0,0)"
  ,tabBoxTabTextColorSelected = "rgb(133,47,180)"
  ,tabBoxBackColor = "rgb(255,255,255)"
  ,tabBoxHighlightColor = "rgb(210,210,210)"
  ,tabBoxBorderRadius = 0

  ### inputs
  ,buttonBackColor = "rgb(240,240,240)"
  ,buttonTextColor = "rgb(80,80,80)"
  ,buttonBorderColor = "rgb(185,185,185)"
  ,buttonBorderRadius = 5

  ,buttonBackColorHover = "rgb(227,227,227)"
  ,buttonTextColorHover = "rgb(80,80,80)"
  ,buttonBorderColorHover = "rgb(210,210,210)"

  ,textboxBackColor = "rgb(255,255,255)"
  ,textboxBorderColor = "rgb(210,210,210)"
  ,textboxBorderRadius = 0
  ,textboxBackColorSelect = "rgb(255,255,255)"
  ,textboxBorderColorSelect = "rgb(210,210,210)"

  ### tables
  ,tableBackColor = "rgb(255,255,255)"
  ,tableBorderColor = "rgb(235,235,235)"
  ,tableBorderTopSize = 1
  ,tableBorderRowSize = 1

)
