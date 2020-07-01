# Logo: Grey Dark ---------------------------------------------------------------------------------------
#' @title logo_grey_dark
#' @description Grey Dark logo for a shinydashboard application
#'
#' @param boldText String. Bold text for the logo.
#' @param mainText String. Main text for the logo.
#' @param badgeText String. Text for the logo badge.
#'
#' @return Object produced by shinyDashboardLogoDIY
#' @seealso \code{\link{shinyDashboardLogoDIY}}
#' @export
logo_grey_dark <- function(boldText = "Shiny", mainText = "App", badgeText = "v1.1") {
  logo <- dashboardthemes::shinyDashboardLogoDIY(
    boldText = boldText,
    mainText = mainText,
    textSize = 16,
    badgeText = badgeText,
    badgeTextColor = "black",
    badgeTextSize = 2,
    badgeBackColor = "rgb(255,255,255)",
    badgeBorderRadius = 3
  )

  return(logo)
}


# Begin Exclude Linting

# Theme: Grey Dark --------------------------------------------------------------------------------------
#' @title theme_grey_dark
#' @description Grey Dark theme for a shinydashboard application
#'
#' @return Object produced by shinyDashboardThemeDIY
#' @seealso \code{\link{shinyDashboardThemeDIY}}
#' @export
theme_grey_dark <- shinyDashboardThemeDIY(

  ### general
  appFontFamily = "Arial"
  ,appFontColor = "rgb(205,205,205)"
  ,primaryFontColor = "rgb(255,255,255)"
  ,infoFontColor = "rgb(255,255,255)"
  ,successFontColor = "rgb(255,255,255)"
  ,warningFontColor = "rgb(255,255,255)"
  ,dangerFontColor = "rgb(255,255,255)"
  ,bodyBackColor = "rgb(45,55,65)"

  ### header
  ,logoBackColor = "rgb(70,80,90)"

  ,headerButtonBackColor = "rgb(70,80,90)"
  ,headerButtonIconColor = "rgb(25,35,45)"
  ,headerButtonBackColorHover = "rgb(40,50,60)"
  ,headerButtonIconColorHover = "rgb(0,0,0)"

  ,headerBackColor = "rgb(70,80,90)"
  ,headerBoxShadowColor = ""
  ,headerBoxShadowSize = "0px 0px 0px"

  ### sidebar
  ,sidebarBackColor = "rgb(52,62,72)"
  ,sidebarPadding = 0

  ,sidebarMenuBackColor = "transparent"
  ,sidebarMenuPadding = 0
  ,sidebarMenuBorderRadius = 0

  ,sidebarShadowRadius = ""
  ,sidebarShadowColor = "0px 0px 0px"

  ,sidebarUserTextColor = "rgb(205,205,205)"

  ,sidebarSearchBackColor = "rgb(45,55,65)"
  ,sidebarSearchIconColor = "rgb(153,153,153)"
  ,sidebarSearchBorderColor = "rgb(45,55,65)"

  ,sidebarTabTextColor = "rgb(205,205,205)"
  ,sidebarTabTextSize = 14
  ,sidebarTabBorderStyle = "none"
  ,sidebarTabBorderColor = "none"
  ,sidebarTabBorderWidth = 0

  ,sidebarTabBackColorSelected = "rgb(70,80,90)"
  ,sidebarTabTextColorSelected = "rgb(255,255,255)"
  ,sidebarTabRadiusSelected = "5px"

  ,sidebarTabBackColorHover = "rgb(55,65,75)"
  ,sidebarTabTextColorHover = "rgb(255,255,255)"
  ,sidebarTabBorderStyleHover = "none"
  ,sidebarTabBorderColorHover = "none"
  ,sidebarTabBorderWidthHover = 0
  ,sidebarTabRadiusHover = "5px"

  ### boxes
  ,boxBackColor = "rgb(52,62,72)"
  ,boxBorderRadius = 5
  ,boxShadowSize = "0px 0px 0px"
  ,boxShadowColor = ""
  ,boxTitleSize = 16
  ,boxDefaultColor = "rgb(52,62,72)"
  ,boxPrimaryColor = "rgb(200,200,200)"
  ,boxInfoColor = "rgb(80,95,105)"
  ,boxSuccessColor = "rgb(155,240,80)"
  ,boxWarningColor = "rgb(240,80,210)"
  ,boxDangerColor = "rgb(240,80,80)"

  ,tabBoxTabColor = "rgb(52,62,72)"
  ,tabBoxTabTextSize = 14
  ,tabBoxTabTextColor = "rgb(205,205,205)"
  ,tabBoxTabTextColorSelected = "rgb(205,205,205)"
  ,tabBoxBackColor = "rgb(52,62,72)"
  ,tabBoxHighlightColor = "rgb(70,80,90)"
  ,tabBoxBorderRadius = 5

  ### inputs
  ,buttonBackColor = "rgb(230,230,230)"
  ,buttonTextColor = "rgb(0,0,0)"
  ,buttonBorderColor = "rgb(50,50,50)"
  ,buttonBorderRadius = 5

  ,buttonBackColorHover = "rgb(180,180,180)"
  ,buttonTextColorHover = "rgb(50,50,50)"
  ,buttonBorderColorHover = "rgb(50,50,50)"

  ,textboxBackColor = "rgb(68,80,90)"
  ,textboxBorderColor = "rgb(76,90,103)"
  ,textboxBorderRadius = 5
  ,textboxBackColorSelect = "rgb(80,90,100)"
  ,textboxBorderColorSelect = "rgb(255,255,255)"

  ### tables
  ,tableBackColor = "rgb(52,62,72)"
  ,tableBorderColor = "rgb(70,80,90)"
  ,tableBorderTopSize = 1
  ,tableBorderRowSize = 1

)

# End Exclude Linting
