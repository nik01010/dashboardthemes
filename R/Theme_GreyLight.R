# Logo: Grey Light --------------------------------------------------------------------------------------
#' @title logo_grey_light
#' @description Grey Light logo for a shinydashboard application
#'
#' @param boldText String. Bold text for the logo.
#' @param mainText String. Main text for the logo.
#' @param badgeText String. Text for the logo badge.
#'
#' @return Object produced by shinyDashboardLogoDIY
#' @seealso \code{\link{shinyDashboardLogoDIY}}
#' @export
logo_grey_light <- function(boldText = "Shiny", mainText = "App", badgeText = "v1.1") {
  shinyDashboardLogoDIY(
    boldText = boldText,
    mainText = mainText,
    textSize = 16,
    badgeText = badgeText,
    badgeTextColor = "white",
    badgeTextSize = 2,
    badgeBackColor = "rgb(150,150,150)",
    badgeBorderRadius = 3
  )
}


# Begin Exclude Linting

# Theme: Grey Light -------------------------------------------------------------------------------------
#' @title theme_grey_light
#' @description Grey Light theme for a shinydashboard application
#'
#' @return Object produced by shinyDashboardThemeDIY
#' @seealso \code{\link{shinyDashboardThemeDIY}}
#' @export
theme_grey_light <- shinyDashboardThemeDIY(

  ### general
  appFontFamily = "Arial"
  ,appFontColor = "rgb(45,45,45)"
  ,primaryFontColor = "rgb(15,15,15)"
  ,infoFontColor = "rgb(15,15,15)"
  ,successFontColor = "rgb(15,15,15)"
  ,warningFontColor = "rgb(15,15,15)"
  ,dangerFontColor = "rgb(15,15,15)"
  ,bodyBackColor = "rgb(240,240,240)"

  ### header
  ,logoBackColor = "rgb(120,120,120)"

  ,headerButtonBackColor = "rgb(120,120,120)"
  ,headerButtonIconColor = "rgb(220,220,220)"
  ,headerButtonBackColorHover = "rgb(100,100,100)"
  ,headerButtonIconColorHover = "rgb(60,60,60)"

  ,headerBackColor = "rgb(120,120,120)"
  ,headerBoxShadowColor = "#dfdfdf"
  ,headerBoxShadowSize = "3px 5px 5px"

  ### sidebar
  ,sidebarBackColor = "rgb(255,255,255)"
  ,sidebarPadding = 0

  ,sidebarMenuBackColor = "transparent"
  ,sidebarMenuPadding = 0
  ,sidebarMenuBorderRadius = 0

  ,sidebarShadowRadius = "3px 5px 5px"
  ,sidebarShadowColor = "#dfdfdf"

  ,sidebarUserTextColor = "rgb(115,115,115)"

  ,sidebarSearchBackColor = "rgb(240,240,240)"
  ,sidebarSearchIconColor = "rgb(100,100,100)"
  ,sidebarSearchBorderColor = "rgb(220,220,220)"

  ,sidebarTabTextColor = "rgb(100,100,100)"
  ,sidebarTabTextSize = 14
  ,sidebarTabBorderStyle = "none"
  ,sidebarTabBorderColor = "none"
  ,sidebarTabBorderWidth = 0

  ,sidebarTabBackColorSelected = "rgb(230,230,230)"
  ,sidebarTabTextColorSelected = "rgb(0,0,0)"
  ,sidebarTabRadiusSelected = "0px"

  ,sidebarTabBackColorHover = "rgb(245,245,245)"
  ,sidebarTabTextColorHover = "rgb(0,0,0)"
  ,sidebarTabBorderStyleHover = "none solid none none"
  ,sidebarTabBorderColorHover = "rgb(200,200,200)"
  ,sidebarTabBorderWidthHover = 4
  ,sidebarTabRadiusHover = "0px"

  ,boxBackColor = "rgb(248,248,248)"
  ,boxBorderRadius = 5
  ,boxShadowSize = "none"
  ,boxShadowColor = ""
  ,boxTitleSize = 18
  ,boxDefaultColor = "rgb(225,225,225)"
  ,boxPrimaryColor = "rgb(95,155,213)"
  ,boxInfoColor = "rgb(180,180,180)"
  ,boxSuccessColor = "rgb(112,173,71)"
  ,boxWarningColor = "rgb(237,125,49)"
  ,boxDangerColor = "rgb(232,76,34)"

  ,tabBoxTabColor = "rgb(248,248,248)"
  ,tabBoxTabTextSize = 14
  ,tabBoxTabTextColor = "rgb(100,100,100)"
  ,tabBoxTabTextColorSelected = "rgb(45,45,45)"
  ,tabBoxBackColor = "rgb(248,248,248)"
  ,tabBoxHighlightColor = "rgb(200,200,200)"
  ,tabBoxBorderRadius = 5

  ### inputs
  ,buttonBackColor = "rgb(215,215,215)"
  ,buttonTextColor = "rgb(45,45,45)"
  ,buttonBorderColor = "rgb(150,150,150)"
  ,buttonBorderRadius = 5

  ,buttonBackColorHover = "rgb(190,190,190)"
  ,buttonTextColorHover = "rgb(0,0,0)"
  ,buttonBorderColorHover = "rgb(150,150,150)"

  ,textboxBackColor = "rgb(255,255,255)"
  ,textboxBorderColor = "rgb(118,118,118)"
  ,textboxBorderRadius = 5
  ,textboxBackColorSelect = "rgb(245,245,245)"
  ,textboxBorderColorSelect = "rgb(108,108,108)"

  ### tables
  ,tableBackColor = "rgb(248,248,248)"
  ,tableBorderColor = "rgb(238,238,238)"
  ,tableBorderTopSize = 1
  ,tableBorderRowSize = 1

)

# End Exclude Linting
