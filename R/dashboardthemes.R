### ReadMe ------------------------------------------------------------------
### Purpose:        This script provides functions required for customising themes
###                 in shinydashboard applications.
###
### Contact:        Nik Lilovski (nik.lilovski@outlook.com)
###
### Last updated:   04 March 2018
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


### Loading packages --------------------------------------------------------
### n/a: not required


### Sourcing functions ------------------------------------------------------
### n/a: not required


### Setting options ---------------------------------------------------------
### n/a: not required


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

      badgeText ,"  </font> &nbsp; </span> <body> </p>"

    )

  )

}


### Function: shinyDashboardLogo --------------------------------------------
#' Calls a custom logo object created using shinyDashboardLogoDIY
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
#'       theme = "blue_gradient"
#'     )
#'     ...
#' @seealso \code{\link{shinyDashboardLogoDIY}, \link{shinyDashboardThemes}}
#' @note This logo design was inspired from \url{http://www.dataseries.org/}.
#' @export
shinyDashboardLogo <- function(theme){

  if(theme == "blue_gradient"){

    return(logo_blue_gradient)

  } else if(theme == "boe_website"){

    return(logo_boe_website)

  } else if(theme == "grey_light"){

    return(logo_grey_light)

  } else if(theme == "grey_dark"){

    return(logo_grey_dark)

  } else if(theme == "onenote"){

    return(logo_onenote)

  } else if(theme == "poor_mans_flatly"){

    return(logo_poor_mans_flatly)

  } else if(theme == "purple_gradient"){

    return(logo_purple_gradient)

  } else{

    return("")

  }

}


### Function: shinyDashboardThemeDIY ----------------------------------------
#' Creates a custom theme object for a shinydashboard application
#'
#' @param appFontFamily String. Application font.
#' @param appFontColor String. Application font colour.
#' @param bodyBackColor String. Main page background colour.
#' @param logoBackColor String. Logo background colour.
#' @param headerButtonBackColor String. Sidebar toggle button background colour.
#' @param headerButtonIconColor String. Sidebar toggle button icon colour.
#' @param headerButtonBackColorHover String. Sidebar toggle button background colour: hovered.
#' @param headerButtonIconColorHover String. Sidebar toggle button icon colour: hovered.
#' @param headerBackColor String. Top header background colour.
#' @param headerBoxShadowColor String. Top header shadow colour.
#' @param headerBoxShadowSize String. Top header shadow size.
#' @param sidebarBackColor String. Sidebar background colour.
#' @param sidebarPadding Numeric. Sidebar inner padding.
#' @param sidebarMenuBackColor String. Sidebar menu background colour.
#' @param sidebarMenuPadding Numeric. Sidebar menu inner padding.
#' @param sidebarMenuBorderRadius Numeric. Sidebar menu shape radius.
#' @param sidebarShadowRadius String. Sidebar shadow radius.
#' @param sidebarShadowColor String. Sidebar shadow colour.
#' @param sidebarUserTextColor String. Sidebar userbox text colour.
#' @param sidebarSearchBackColor String. Sidebar searchbox background colour.
#' @param sidebarSearchIconColor String. Sidebar searchbox icon colour.
#' @param sidebarSearchBorderColor String. Sidebar searchbox border line colour.
#' @param sidebarTabTextColor String. Sidebar tab font colour.
#' @param sidebarTabTextSize Numeric. Sidebar tab font size.
#' @param sidebarTabBorderStyle String. Sidebar tab border line style.
#' @param sidebarTabBorderColor String. Sidebar tab border line colour.
#' @param sidebarTabBorderWidth Numeric. Sidebar tab border line width.
#' @param sidebarTabBackColorSelected String. Sidebar tab background colour: selected.
#' @param sidebarTabTextColorSelected String. Sidebar tab font colour: selected.
#' @param sidebarTabRadiusSelected String. Sidebar tab shape radius: selected.
#' @param sidebarTabBackColorHover String. Sidebar tab background colour: hovered.
#' @param sidebarTabTextColorHover String. Sidebar tab font colour: hovered.
#' @param sidebarTabBorderStyleHover String. Sidebar tab border line style: hovered.
#' @param sidebarTabBorderColorHover String. Sidebar tab border line colour: hovered.
#' @param sidebarTabBorderWidthHover Numeric. Sidebar tab border line width: hovered.
#' @param sidebarTabRadiusHover String. Sidebar tab shape radius: hovered.
#' @param boxBackColor String. Box background colour.
#' @param boxBorderRadius Numeric. Box shape radius.
#' @param boxShadowSize String. Box shadow size.
#' @param boxShadowColor String. Box shadow colour.
#' @param boxTitleSize Numeric. Box title font size.
#' @param boxDefaultColor String. Box default highlight colour.
#' @param boxPrimaryColor String. Box primary highlight colour.
#' @param boxSuccessColor String. Box success highlight colour.
#' @param boxWarningColor String. Box warning highlight colour.
#' @param boxDangerColor String. Box danger highlight colour.
#' @param tabBoxTabColor String. Tab box tab background colour.
#' @param tabBoxTabTextSize Numeric. Tab box tab font size.
#' @param tabBoxTabTextColor String. Tab box tab font colour.
#' @param tabBoxTabTextColorSelected String. Tab box tab font colour: selected.
#' @param tabBoxBackColor String. Tab box body background colour.
#' @param tabBoxHighlightColor String. Tab box highlight colour.
#' @param tabBoxBorderRadius Numeric. Tab box shape radius.
#' @param buttonBackColor String. Button background colour.
#' @param buttonTextColor String. Button font colour.
#' @param buttonBorderColor String. Button border line colour.
#' @param buttonBorderRadius Numeric. Button shape radius.
#' @param buttonBackColorHover String. Button background colour: hovered.
#' @param buttonTextColorHover String. Button font colour: hovered.
#' @param buttonBorderColorHover String. Button border line colour: hovered.
#' @param buttonHeight Numeric. Button shape height. Defaults to 34.
#' @param buttonPadding String. Button label padding. Defaults to "6px 12px".
#' @param textboxBackColor String. Textbox background colour.
#' @param textboxBorderColor String. Textbox border line colour.
#' @param textboxBorderRadius Numeric. Textbox shape radius.
#' @param textboxBackColorSelect String. Textbox background colour: selected.
#' @param textboxBorderColorSelect String. Textbox border line colour: selected.
#' @param textboxHeight Numeric. Textbox shape height. Defaults to 34.
#' @param textboxPadding String. Textbox text padding. Defaults to "6px 12px".
#' @param tableBackColor String. Table background colour.
#' @param tableBorderColor String. Table border line colour.
#' @param tableBorderTopSize Numeric. Table header line size.
#' @param tableBorderRowSize Numeric. Table row separator line size.
#'
#' @return HTML code. Theme for a shinydashboard application.
#' @examples
#' theme_blue_gradient <- shinyDashboardThemeDIY(
#'
#'   ### general
#'   appFontFamily = "Arial"
#'   ,appFontColor = "rgb(0,0,0)"
#'   ,bodyBackColor = "rgb(248,248,248)"
#'
#'   ### header
#'   ,logoBackColor = "rgb(23,103,124)"
#'
#'   ,headerButtonBackColor = "rgb(238,238,238)"
#'   ,headerButtonIconColor = "rgb(75,75,75)"
#'   ,headerButtonBackColorHover = "rgb(210,210,210)"
#'   ,headerButtonIconColorHover = "rgb(0,0,0)"
#'
#'   ,headerBackColor = "rgb(238,238,238)"
#'   ,headerBoxShadowColor = "#aaaaaa"
#'   ,headerBoxShadowSize = "2px 2px 2px"
#'
#'   ### sidebar
#'   ,sidebarBackColor = cssGradientThreeColors(
#'     direction = "down"
#'     ,colorStart = "rgb(20,97,117)"
#'     ,colorMiddle = "rgb(56,161,187)"
#'     ,colorEnd = "rgb(3,22,56)"
#'     ,colorStartPos = 0
#'     ,colorMiddlePos = 50
#'     ,colorEndPos = 100
#'   )
#'   ,sidebarPadding = 0
#'
#'   ,sidebarMenuBackColor = "transparent"
#'   ,sidebarMenuPadding = 0
#'   ,sidebarMenuBorderRadius = 0
#'
#'   ,sidebarShadowRadius = "3px 5px 5px"
#'   ,sidebarShadowColor = "#aaaaaa"
#'
#'   ,sidebarUserTextColor = "rgb(255,255,255)"
#'
#'   ,sidebarSearchBackColor = "rgb(55,72,80)"
#'   ,sidebarSearchIconColor = "rgb(153,153,153)"
#'   ,sidebarSearchBorderColor = "rgb(55,72,80)"
#'
#'   ,sidebarTabTextColor = "rgb(255,255,255)"
#'   ,sidebarTabTextSize = 13
#'   ,sidebarTabBorderStyle = "none none solid none"
#'   ,sidebarTabBorderColor = "rgb(35,106,135)"
#'   ,sidebarTabBorderWidth = 1
#'
#'   ,sidebarTabBackColorSelected = cssGradientThreeColors(
#'     direction = "right"
#'     ,colorStart = "rgba(44,222,235,1)"
#'     ,colorMiddle = "rgba(44,222,235,1)"
#'     ,colorEnd = "rgba(0,255,213,1)"
#'     ,colorStartPos = 0
#'     ,colorMiddlePos = 30
#'     ,colorEndPos = 100
#'   )
#'   ,sidebarTabTextColorSelected = "rgb(0,0,0)"
#'   ,sidebarTabRadiusSelected = "0px 20px 20px 0px"
#'
#'   ,sidebarTabBackColorHover = cssGradientThreeColors(
#'     direction = "right"
#'     ,colorStart = "rgba(44,222,235,1)"
#'     ,colorMiddle = "rgba(44,222,235,1)"
#'     ,colorEnd = "rgba(0,255,213,1)"
#'     ,colorStartPos = 0
#'     ,colorMiddlePos = 30
#'     ,colorEndPos = 100
#'   )
#'   ,sidebarTabTextColorHover = "rgb(50,50,50)"
#'   ,sidebarTabBorderStyleHover = "none none solid none"
#'   ,sidebarTabBorderColorHover = "rgb(75,126,151)"
#'   ,sidebarTabBorderWidthHover = 1
#'   ,sidebarTabRadiusHover = "0px 20px 20px 0px"
#'
#'   ### boxes
#'   ,boxBackColor = "rgb(255,255,255)"
#'   ,boxBorderRadius = 5
#'   ,boxShadowSize = "0px 1px 1px"
#'   ,boxShadowColor = "rgba(0,0,0,.1)"
#'   ,boxTitleSize = 16
#'   ,boxDefaultColor = "rgb(210,214,220)"
#'   ,boxPrimaryColor = "rgba(44,222,235,1)"
#'   ,boxSuccessColor = "rgba(0,255,213,1)"
#'   ,boxWarningColor = "rgb(244,156,104)"
#'   ,boxDangerColor = "rgb(255,88,55)"
#'
#'   ,tabBoxTabColor = "rgb(255,255,255)"
#'   ,tabBoxTabTextSize = 14
#'   ,tabBoxTabTextColor = "rgb(0,0,0)"
#'   ,tabBoxTabTextColorSelected = "rgb(0,0,0)"
#'   ,tabBoxBackColor = "rgb(255,255,255)"
#'   ,tabBoxHighlightColor = "rgba(44,222,235,1)"
#'   ,tabBoxBorderRadius = 5
#'
#'   ### inputs
#'   ,buttonBackColor = "rgb(245,245,245)"
#'   ,buttonTextColor = "rgb(0,0,0)"
#'   ,buttonBorderColor = "rgb(200,200,200)"
#'   ,buttonBorderRadius = 5
#'
#'   ,buttonBackColorHover = "rgb(235,235,235)"
#'   ,buttonTextColorHover = "rgb(100,100,100)"
#'   ,buttonBorderColorHover = "rgb(200,200,200)"
#'
#'   ,textboxBackColor = "rgb(255,255,255)"
#'   ,textboxBorderColor = "rgb(200,200,200)"
#'   ,textboxBorderRadius = 5
#'   ,textboxBackColorSelect = "rgb(245,245,245)"
#'   ,textboxBorderColorSelect = "rgb(200,200,200)"
#'
#'   ### tables
#'   ,tableBackColor = "rgb(255,255,255)"
#'   ,tableBorderColor = "rgb(240,240,240)"
#'   ,tableBorderTopSize = 1
#'   ,tableBorderRowSize = 1
#'
#' )
#' @seealso \code{\link{shinyDashboardThemes}, \link{shinyDashboardLogoDIY}, \link{cssGradientThreeColors}}
#' @export
shinyDashboardThemeDIY <- function(appFontFamily, appFontColor, logoBackColor, bodyBackColor, headerButtonBackColor, headerButtonIconColor,
                                   headerButtonBackColorHover, headerButtonIconColorHover, headerBackColor, headerBoxShadowColor,
                                   headerBoxShadowSize, sidebarBackColor, sidebarPadding, sidebarShadowRadius, sidebarShadowColor,
                                   sidebarMenuBackColor, sidebarMenuPadding, sidebarMenuBorderRadius, sidebarUserTextColor, sidebarSearchBackColor,
                                   sidebarSearchIconColor, sidebarSearchBorderColor,  sidebarTabTextColor, sidebarTabTextSize, sidebarTabBorderStyle,
                                   sidebarTabBorderColor, sidebarTabBorderWidth, sidebarTabBackColorSelected, sidebarTabTextColorSelected,
                                   sidebarTabRadiusSelected, sidebarTabTextColorHover, sidebarTabBackColorHover, sidebarTabBorderStyleHover,
                                   sidebarTabBorderColorHover, sidebarTabBorderWidthHover, sidebarTabRadiusHover, boxBackColor, boxBorderRadius,
                                   boxShadowSize, boxShadowColor, boxTitleSize, boxDefaultColor, boxPrimaryColor, boxSuccessColor, boxWarningColor,
                                   boxDangerColor, tabBoxTabColor, tabBoxTabTextSize, tabBoxTabTextColor, tabBoxTabTextColorSelected, tabBoxBackColor,
                                   tabBoxHighlightColor, tabBoxBorderRadius, buttonBackColor, buttonTextColor, buttonBorderColor, buttonBorderRadius,
                                   buttonBackColorHover, buttonTextColorHover, buttonBorderColorHover, buttonHeight = 34, buttonPadding = "6px 12px",
                                   textboxBackColor, textboxBorderColor, textboxBorderRadius, textboxBackColorSelect, textboxBorderColorSelect,
                                   textboxHeight = 34, textboxPadding = "6px 12px", tableBackColor, tableBorderColor,
                                   tableBorderTopSize, tableBorderRowSize) {


  htmltools::tags$head(

    htmltools::tags$style(

      htmltools::HTML(

        paste0(

          '
          /* font: google import [OPTIONAL] */
          /* @import url("//fonts.googleapis.com/css?family=',"Roboto",'"); */

          /* font */
          body, label, input, button, select, box,
          .h1, .h2, .h3, .h4, .h5, h1, h2, h3, h4, h5 {
            font-family: "',appFontFamily,'";
            color: ', appFontColor, ';
          }

          /* font: fix for h6 */
          /* messes up sidebar user section if included above */
          .h6, h6 {
            font-family: "',appFontFamily,'";
          }

          /* sidebar: logo */
          .skin-blue .main-header .logo {
            background: ', logoBackColor, ';
          }

          /* sidebar: logo hover */
          .skin-blue .main-header .logo:hover {
            background: ', logoBackColor, ';
          }

          /* sidebar: collapse button  */
          .skin-blue .main-header .navbar .sidebar-toggle {
            background: ', headerButtonBackColor, ';
            color:', headerButtonIconColor, ';
          }

          /* sidebar: collapse button hover */
          .skin-blue .main-header .navbar .sidebar-toggle:hover {
            background: ', headerButtonBackColorHover, ';
            color:', headerButtonIconColorHover, ';
          }

          /* header */
          .skin-blue .main-header .navbar {
            background: ', headerBackColor, ';
            box-shadow: ', headerBoxShadowSize, ' ', headerBoxShadowColor ,';
          }

          /* sidebar*/
          .skin-blue .main-sidebar {
            background: ', sidebarBackColor, ';
            box-shadow: ', sidebarShadowRadius, " ", sidebarShadowColor, ';
            padding-left: ', sidebarPadding, 'px;
            padding-right: ', sidebarPadding, 'px;
            padding-top: 60px;
          }

          /* sidebar menu */
          .main-sidebar .user-panel, .sidebar-menu, .sidebar-menu>li.header {
            white-space: nowrap;
            background: ', sidebarMenuBackColor, ';
            padding: ', sidebarMenuPadding, 'px;
            border-radius: ', sidebarMenuBorderRadius, 'px;
          }

          /* fix for user panel */
          .user-panel>.info>p, .skin-blue .user-panel>.info {
            color: ', sidebarUserTextColor, ';
            font-size: 12px;
            font-weight: normal;
          }
          section.sidebar .user-panel {
            padding: 10px;
          }

          /* sidebar: tabs */
          .skin-blue .main-sidebar .sidebar .sidebar-menu a {
            color: ', sidebarTabTextColor, ';
            font-size: ', sidebarTabTextSize ,'px;
            border-style: ', sidebarTabBorderStyle, ';
            border-color: ', sidebarTabBorderColor, ';
            border-width: ', sidebarTabBorderWidth, 'px;
          }

          /* sidebar: tab selected */
          .skin-blue .main-sidebar .sidebar .sidebar-menu .active a {
            color: ', sidebarTabTextColorSelected, ';
            font-size: ', sidebarTabTextSize, 'px;
            border-radius: ', sidebarTabRadiusSelected, ';
            border-style: ', sidebarTabBorderStyleHover, ';
            border-color: ', sidebarTabBorderColorHover, ';
            border-width: ', sidebarTabBorderWidthHover, 'px;
          }
          .skin-blue .sidebar-menu > li:hover > a,
          .skin-blue .sidebar-menu > li.active > a {
            color: ', sidebarTabTextColorSelected, ';
            background: ', sidebarTabBackColorSelected, ';
            border-radius: ', sidebarTabRadiusHover, ';
          }

          /* sidebar: tab hovered */
          .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover {
            background: '
            ,sidebarTabBackColorHover, ';'
            ,'color: ', sidebarTabTextColorHover, ';
            font-size: ', sidebarTabTextSize ,'px;
            border-style: ', sidebarTabBorderStyleHover, ';
            border-color: ', sidebarTabBorderColorHover, ';
            border-width: ', sidebarTabBorderWidthHover, 'px;
            border-radius: ', sidebarTabRadiusHover, ';
          }

          /* sidebar: subtab */
          .skin-blue .sidebar-menu > li > .treeview-menu {
          	margin: 0px;
            background: ', sidebarMenuBackColor, ';
          }
          .skin-blue .treeview-menu > li > a {
            background: ', sidebarMenuBackColor, ';
          }
          /* sidebar: subtab selected */
          .skin-blue .treeview-menu > li.active > a,
          .skin-blue .treeview-menu > li > a:hover {
            background: ', sidebarTabBackColorSelected, ';
          }

          /* sidebar: search text area */
          .skin-blue .sidebar-form input[type=text] {
            background: ', sidebarSearchBackColor, ';
            color: ', appFontColor, ';
            border-radius: ', textboxBorderRadius, 'px 0px 0px ', textboxBorderRadius, 'px;
            border-color: ', sidebarSearchBorderColor, ';
            border-style: solid none solid solid;
          }

          /* sidebar: search button */
          .skin-blue .input-group-btn > .btn {
            background: ', sidebarSearchBackColor, ';
            color: ', sidebarSearchIconColor, ';
            border-radius: 0px ', textboxBorderRadius, 'px ', textboxBorderRadius, 'px 0px;
            border-style: solid solid solid none;
            border-color: ', sidebarSearchBorderColor, ';
          }

          /* sidebar form */
          .skin-blue .sidebar-form {
            border-radius: 0px;
            border: 0px none rgb(255,255,255);
            margin: 10px;
          }

          /* body */
          .content-wrapper, .right-side {
            background: ', bodyBackColor, ';
          }

          /* box */
          .box {
            background: ', boxBackColor, ';
            border-radius: ', boxBorderRadius, 'px;
            box-shadow: ', boxShadowSize, ' ', boxShadowColor, ';
          }

          /* box: title */
          .box-header .box-title {
            font-size: ', boxTitleSize, 'px;
          }

          /* tabbox: title */
          .nav-tabs-custom>.nav-tabs>li.header {
            color: ', appFontColor, ';
            font-size: ', boxTitleSize, 'px;
          }

          /* tabbox: tab color */
          .nav-tabs-custom, .nav-tabs-custom .nav-tabs li.active:hover a, .nav-tabs-custom .nav-tabs li.active a {
            background: ', tabBoxTabColor, ';
            color: ', appFontColor, ';
            border-radius: ', boxBorderRadius, 'px;
          }

          .nav-tabs-custom {
            box-shadow: ', boxShadowSize, ' ', boxShadowColor, ';
          }

          /* tabbox: active tab bg */
          .nav-tabs-custom>.nav-tabs>li.active {
            border-radius: ', tabBoxBorderRadius, 'px;
            border-top-color: ', tabBoxHighlightColor, ';
            # box-shadow: ', boxShadowSize, ' ', boxShadowColor, ';
          }

          /* tabbox: font color */
          .nav-tabs-custom>.nav-tabs>li.active:hover>a, .nav-tabs-custom>.nav-tabs>li.active>a {
            border-bottom-color: ', tabBoxTabColor, ';
            border-top-color: ', tabBoxHighlightColor, ';
            border-right-color: ', tabBoxHighlightColor, ';
            border-left-color: ', tabBoxHighlightColor, ';
            color: ', tabBoxTabTextColorSelected, ';
            font-size: ', tabBoxTabTextSize, 'px;
            border-radius: ', tabBoxBorderRadius, 'px;
          }

          /* tabbox: inactive tabs background */
          .nav-tabs-custom>.nav-tabs>li>a {
            color: ', tabBoxTabTextColor, ';
            font-size: ', tabBoxTabTextSize, 'px;
          }

          /* tabbox: top area back color */
          .nav-tabs-custom, .nav-tabs-custom>.tab-content, .nav-tabs-custom>.nav-tabs {
            border-bottom-color: ', tabBoxHighlightColor, ';
            background: ', tabBoxBackColor, ';
          }

          /* tabbox: top area rounded corners */
          .nav-tabs-custom>.nav-tabs {
            margin: 0;
            border-radius: ', tabBoxBorderRadius, 'px;
          }

          /* infobox */
          .info-box {
            background: ', boxBackColor, ';
            border-radius: ', boxBorderRadius, 'px;
            box-shadow: ', boxShadowSize, ' ', boxShadowColor, ';
          }

          /* valuebox */
          .small-box {
            border-radius: ', boxBorderRadius, 'px;
            box-shadow: ', boxShadowSize, ' ', boxShadowColor, ';
          }

          /* valuebox: main font color */
          .small-box h3, .small-box p {
            color: rgb(255,255,255)
          }

          /* box: default color */
          .box.box-solid>.box-header, .box>.box-header {
            color: ', appFontColor, ';
          }
          .box.box-solid>.box-header {
            border-radius: ', boxBorderRadius, 'px;
          }
          .box.box-solid, .box {
            border-radius: ', boxBorderRadius, 'px;
            border-top-color: ', boxDefaultColor, ';
          }

          /* box: primary color */
          .box.box-solid.box-primary>.box-header, .box.box-primary>.box-header {
            color: ', appFontColor, ';
          }
          .box.box-solid.box-primary>.box-header {
            background: ', boxPrimaryColor, ';
            border-radius: ', boxBorderRadius, 'px;
          }
          .box.box-solid.box-primary, .box.box-primary {
            border-color: ', boxPrimaryColor, ';
            border-left-color: ', boxPrimaryColor, ';
            border-right-color: ', boxPrimaryColor, ';
            border-top-color: ', boxPrimaryColor, ';
            border-radius: ', boxBorderRadius, 'px;
          }

          /* box: success color */
          .box.box-solid.box-success>.box-header, .box.box-success>.box-header {
            color: ', appFontColor, ';
          }
          .box.box-solid.box-success>.box-header {
            background: ', boxSuccessColor, ';
            border-radius: ', boxBorderRadius, 'px;
          }
          .box.box-solid.box-success, .box.box-success {
            border-color: ', boxSuccessColor, ';
            border-left-color: ', boxSuccessColor, ';
            border-right-color: ', boxSuccessColor, ';
            border-top-color: ', boxSuccessColor, ';
            border-radius: ', boxBorderRadius, 'px;
          }

          /* box: warning color */
          .box.box-solid.box-warning>.box-header, .box.box-warning>.box-header {
            color: ', appFontColor, ';
          }
          .box.box-solid.box-warning>.box-header {
            background: ', boxWarningColor, ';
            border-radius: ', boxBorderRadius, 'px;
          }
          .box.box-solid.box-warning, .box.box-warning {
            border-color: ', boxWarningColor, ';
            border-left-color: ', boxWarningColor, ';
            border-right-color: ', boxWarningColor, ';
            border-top-color: ', boxWarningColor, ';
            border-radius: ', boxBorderRadius, 'px;
          }

          /* box: danger color */
          .box.box-solid.box-danger>.box-header, .box.box-danger>.box-header {
            color: ', appFontColor, ';
          }
          .box.box-solid.box-danger>.box-header {
            background: ', boxDangerColor, ';
            border-radius: ', boxBorderRadius, 'px;
          }
          .box.box-solid.box-danger, .box.box-danger {
            border-color: ', boxDangerColor, ';
            border-left-color: ', boxDangerColor, ';
            border-right-color: ', boxDangerColor, ';
            border-top-color: ', boxDangerColor, ';
            border-radius: ', boxBorderRadius, 'px;
          }

          /* button */
          .btn-default {
            background: ', buttonBackColor, ';
            color: ', buttonTextColor, ';
            border-color: ', buttonBorderColor, ';
            border-radius: ', buttonBorderRadius, 'px;
            height: ', buttonHeight, 'px;
            padding: ', buttonPadding, ';
          }

          /* button: hover */
          .btn-default:hover {
            background: ', buttonBackColorHover, ';
            color: ', buttonTextColorHover, ';
            border-color: ', buttonBorderColorHover, ';
          }

          /* button: focus */
          .btn-default:focus, .action-button:focus {
            background: ', buttonBackColor, ';
            color: ', buttonTextColor, ';
            border-color: ', buttonBorderColor, ';
          }

          /* button: active */
          .btn-default:active, .action-button:active {
            background: ', buttonBackColor, ';
            color: ', buttonTextColor, ';
            border-color: ', buttonBorderColor, ';
          }

          /* button: visited */
          .btn-default:visited {
            background: ', buttonBackColor, ';
            color: ', buttonTextColor, ';
            border-color: ', buttonBorderColor, ';
          }

          /* textbox */
          .form-control, .selectize-input, .selectize-control.single .selectize-input {
            background: ', textboxBackColor, ';
            color: ', appFontColor, ';
            border-color: ', textboxBorderColor, ';
            border-radius: ', textboxBorderRadius, 'px;
            height: ', textboxHeight, 'px;
            min-height: ', textboxHeight, 'px;
            padding: ', textboxPadding, ';
          }

          /* textbox: selected */
          .form-control:focus, .selectize-input.focus {
            color: ', appFontColor, ';
            background: ', textboxBackColorSelect, ';
            border-color: ', textboxBorderColorSelect, ';
            -webkit-box-shadow: inset 0px 0px 0px, 0px 0px 0px;
            box-shadow: inset 0px 0px 0px, 0px 0px 0px;
          }

          /* verbatim text output */
          .qt pre, .qt code {
            font-family: ', appFontFamily, ' !important;
          }
          pre {
            color: ', appFontColor, ';
            background-color: ', textboxBackColor, ';
            border: 1px solid ', textboxBorderColor, ';
            border-radius: ', textboxBorderRadius, 'px;
          }

          /* drop-down menu */
          .selectize-dropdown, .selectize-dropdown.form-control {
            background: ', textboxBackColor, ';
            border-radius: 4px;
          }

          /* table */
          .table {
            background: ', tableBackColor, ';
            border-radius: ', textboxBorderRadius, 'px;
          }

          /* table: row border color*/
          .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
            border-top: ', tableBorderRowSize, 'px solid ', tableBorderColor, ';
          }

          /* table: top border color*/
          .table>thead>tr>th {
            border-bottom: ', tableBorderTopSize, 'px solid ', tableBorderColor, ';
          }

          /* table: hover row */
          .table-hover>tbody>tr:hover {
          background-color: ', tableBorderColor, ';
          }

          /* table: stripe row */
          .table-striped>tbody>tr:nth-of-type(odd) {
            background-color: ', tableBorderColor, ';
          }

          /* table: body colour */
          table.dataTable tbody tr {
            background-color: ', tableBackColor, ' !important;
          }

          /* table: footer border colour */
          table.dataTable {
            border: 0px !important;
          }

          /* datatable: selected row */
          table.dataTable tr.selected td, table.dataTable td.selected {
            background-color: ', boxSuccessColor, ' !important;
                    color: rgb(0,0,0) !important;
          }

          /* datatable: hover row */
          table.dataTable tr.hover td, table.dataTable td.hover {
            background-color: ', tableBorderColor, ' !important;
          }
          table.dataTable.hover tbody tr:hover, table.dataTable.display tbody tr:hover {
            background-color: ', tableBorderColor, ' !important;
          }
          table.dataTable.row-border tbody th, table.dataTable.row-border tbody td,
          table.dataTable.display tbody th, table.dataTable.display tbody td {
            border-top: 1px solid ', tableBorderColor, ' !important;
          }

          /* datatable: stripe row */
          table.dataTable.stripe tbody tr.odd, table.dataTable.display tbody tr.odd {
            background-color: ', tableBorderColor, ' !important;
          }

          /* datatable: page control */
          .dataTables_wrapper .dataTables_paginate .paginate_button {
            color: ', appFontColor, ' !important;
          }

          /* datatable: table info */
          .dataTables_wrapper .dataTables_paginate .paginate_button.disabled,
          .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover,
          .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active {
            color: ', appFontColor, ' !important;
          }
          .dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter,
          .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing,
          .dataTables_wrapper .dataTables_paginate {
            color: ', appFontColor, ' !important;
          }
          .dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter,
          .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing,
          .dataTables_wrapper .dataTables_paginate {
            color: ', appFontColor, ' !important;
          }

          /* datatable search box */
          .dataTables_wrapper .dataTables_filter input {
            background-color: ', textboxBackColor, ';
            border: 1px solid ', textboxBorderColor, ';
            border-radius: ', textboxBorderRadius, 'px;
          }

          /* notification and progress bar */
          .progress-bar {
            background-color: ', boxSuccessColor, ';
          }
          .shiny-notification {
            height: 80px;
            font-family: ', appFontFamily, ';
            font-size: 15px;
            color: rgb(0,0,0);
            background-color: rgb(225,225,225);
            border-color: rgb(205,205,205);
            border-radius: 10px;
            margin-left: -450px !important;
          }

          /* horizontal divider line */
          hr {
            border-top: 1px solid rgb(215,215,215);
          }

          /* modal */
          .modal-body {
            background-color: ', boxBackColor, ';
          }

          .modal-footer {
            background-color: ', boxBackColor, ';
          }

          .modal-header {
            background-color: ', boxBackColor, ';
          }

          '

        )

      )

    )

  )

}


### Function: shinyDashboardThemes ------------------------------------------
#' Calls a custom theme object created using shinyDashboardThemeDIY
#'
#' @section Available themes:
#' \itemize{
#'   \item \strong{blue_gradient}: Demonstrates use of gradients, shadows and rounded corners.
#'   \item \strong{boe_website}: Styled similarly to the new BoE website.
#'   \item \strong{grey_light}: Lightweight grey theme.
#'   \item \strong{grey_dark}: Demonstrates use of inverted dark colour schemes.
#'   \item \strong{onenote}: Styled similarly to the OneNote application.
#'   \item \strong{poor_mans_flatly}: Poor man`s version of the \href{https://bootswatch.com/flatly/}{Flatly} theme.
#'   \item \strong{purple_gradient}: Demonstrates use of dark gradients and rounded corners.
#' }
#' @param theme String. Name of theme to be used
#'
#' @return HTML code. Theme for shinydashboard.
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
shinyDashboardThemes <- function(theme){

  if(theme == "blue_gradient"){

    return(theme_blue_gradient)

  } else if(theme == "boe_website"){

    return(theme_boe_website)

  } else if(theme == "grey_light"){

    return(theme_grey_light)

  } else if(theme == "grey_dark"){

    return(theme_grey_dark)

  } else if(theme == "onenote"){

    return(theme_onenote)

  } else if(theme == "poor_mans_flatly"){

    return(theme_poor_mans_flatly)

  } else if(theme == "purple_gradient"){

    return(theme_purple_gradient)

  } else{

    return("")

  }

}


### Logos -------------------------------------------------------------------

### logo_blue_gradient ------------------------------------------------------
#' @export
logo_blue_gradient <- shinyDashboardLogoDIY(

  boldText = "SD"
  ,mainText = "Themes"
  ,textSize = 16
  ,badgeText = "BETA"
  ,badgeTextColor = "white"
  ,badgeTextSize = 2
  ,badgeBackColor = "#40E0D0"
  ,badgeBorderRadius = 3

)


### logo_boe_website --------------------------------------------------------
#' @export
logo_boe_website <- shinyDashboardLogoDIY(

  boldText = "SD"
  ,mainText = "Themes"
  ,textSize = 16
  ,badgeText = "BETA"
  ,badgeTextColor = "white"
  ,badgeTextSize = 2
  ,badgeBackColor = "rgb(207,57,92)"
  ,badgeBorderRadius = 3

)


### logo_grey_light ---------------------------------------------------------
#' @export
logo_grey_light <- shinyDashboardLogoDIY(

  boldText = "SD"
  ,mainText = "Themes"
  ,textSize = 16
  ,badgeText = "BETA"
  ,badgeTextColor = "white"
  ,badgeTextSize = 2
  ,badgeBackColor = "rgb(150,150,150)"
  ,badgeBorderRadius = 3

)


### logo_grey_dark ----------------------------------------------------------
#' @export
logo_grey_dark <- shinyDashboardLogoDIY(

  boldText = "SD"
  ,mainText = "Themes"
  ,textSize = 16
  ,badgeText = "BETA"
  ,badgeTextColor = "black"
  ,badgeTextSize = 2
  ,badgeBackColor = "rgb(255,255,255)"
  ,badgeBorderRadius = 3

)


### logo_onenote ------------------------------------------------------------
#' @export
logo_onenote <- shinyDashboardLogoDIY(

  boldText = "SD"
  ,mainText = "Themes"
  ,textSize = 16
  ,badgeText = "BETA"
  ,badgeTextColor = "purple"
  ,badgeTextSize = 2
  ,badgeBackColor = "rgb(255,255,255)"
  ,badgeBorderRadius = 3

)


### logo_poor_mans_flatly ---------------------------------------------------
#' @export
logo_poor_mans_flatly <- shinyDashboardLogoDIY(

  boldText = "SD"
  ,mainText = "Themes"
  ,textSize = 16
  ,badgeText = "BETA"
  ,badgeTextColor = "white"
  ,badgeTextSize = 2
  ,badgeBackColor = "rgb(44,62,80)"
  ,badgeBorderRadius = 3

)


### logo_purple_gradient ----------------------------------------------------
#' @export
logo_purple_gradient <- shinyDashboardLogoDIY(

  boldText = "SD"
  ,mainText = "Themes"
  ,textSize = 16
  ,badgeText = "BETA"
  ,badgeTextColor = "#31386b"
  ,badgeTextSize = 2
  ,badgeBackColor = "rgb(255,255,255)"
  ,badgeBorderRadius = 3

)


### Themes ------------------------------------------------------------------

### theme_blue_gradient -----------------------------------------------------
#' @export
theme_blue_gradient <- shinyDashboardThemeDIY(

  ### general
  appFontFamily = "Arial"
  ,appFontColor = "rgb(0,0,0)"
  ,bodyBackColor = "rgb(248,248,248)"

  ### header
  ,logoBackColor = "rgb(23,103,124)"

  ,headerButtonBackColor = "rgb(238,238,238)"
  ,headerButtonIconColor = "rgb(75,75,75)"
  ,headerButtonBackColorHover = "rgb(210,210,210)"
  ,headerButtonIconColorHover = "rgb(0,0,0)"

  ,headerBackColor = "rgb(238,238,238)"
  ,headerBoxShadowColor = "#aaaaaa"
  ,headerBoxShadowSize = "2px 2px 2px"

  ### sidebar
  ,sidebarBackColor = cssGradientThreeColors(
    direction = "down"
    ,colorStart = "rgb(20,97,117)"
    ,colorMiddle = "rgb(56,161,187)"
    ,colorEnd = "rgb(3,22,56)"
    ,colorStartPos = 0
    ,colorMiddlePos = 50
    ,colorEndPos = 100
  )
  ,sidebarPadding = 0

  ,sidebarMenuBackColor = "transparent"
  ,sidebarMenuPadding = 0
  ,sidebarMenuBorderRadius = 0

  ,sidebarShadowRadius = "3px 5px 5px"
  ,sidebarShadowColor = "#aaaaaa"

  ,sidebarUserTextColor = "rgb(255,255,255)"

  ,sidebarSearchBackColor = "rgb(55,72,80)"
  ,sidebarSearchIconColor = "rgb(153,153,153)"
  ,sidebarSearchBorderColor = "rgb(55,72,80)"

  ,sidebarTabTextColor = "rgb(255,255,255)"
  ,sidebarTabTextSize = 13
  ,sidebarTabBorderStyle = "none none solid none"
  ,sidebarTabBorderColor = "rgb(35,106,135)"
  ,sidebarTabBorderWidth = 1

  ,sidebarTabBackColorSelected = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "rgba(44,222,235,1)"
    ,colorMiddle = "rgba(44,222,235,1)"
    ,colorEnd = "rgba(0,255,213,1)"
    ,colorStartPos = 0
    ,colorMiddlePos = 30
    ,colorEndPos = 100
  )
  ,sidebarTabTextColorSelected = "rgb(0,0,0)"
  ,sidebarTabRadiusSelected = "0px 20px 20px 0px"

  ,sidebarTabBackColorHover = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "rgba(44,222,235,1)"
    ,colorMiddle = "rgba(44,222,235,1)"
    ,colorEnd = "rgba(0,255,213,1)"
    ,colorStartPos = 0
    ,colorMiddlePos = 30
    ,colorEndPos = 100
  )
  ,sidebarTabTextColorHover = "rgb(50,50,50)"
  ,sidebarTabBorderStyleHover = "none none solid none"
  ,sidebarTabBorderColorHover = "rgb(75,126,151)"
  ,sidebarTabBorderWidthHover = 1
  ,sidebarTabRadiusHover = "0px 20px 20px 0px"

  ### boxes
  ,boxBackColor = "rgb(255,255,255)"
  ,boxBorderRadius = 5
  ,boxShadowSize = "0px 1px 1px"
  ,boxShadowColor = "rgba(0,0,0,.1)"
  ,boxTitleSize = 16
  ,boxDefaultColor = "rgb(210,214,220)"
  ,boxPrimaryColor = "rgba(44,222,235,1)"
  ,boxSuccessColor = "rgba(0,255,213,1)"
  ,boxWarningColor = "rgb(244,156,104)"
  ,boxDangerColor = "rgb(255,88,55)"

  ,tabBoxTabColor = "rgb(255,255,255)"
  ,tabBoxTabTextSize = 14
  ,tabBoxTabTextColor = "rgb(0,0,0)"
  ,tabBoxTabTextColorSelected = "rgb(0,0,0)"
  ,tabBoxBackColor = "rgb(255,255,255)"
  ,tabBoxHighlightColor = "rgba(44,222,235,1)"
  ,tabBoxBorderRadius = 5

  ### inputs
  ,buttonBackColor = "rgb(245,245,245)"
  ,buttonTextColor = "rgb(0,0,0)"
  ,buttonBorderColor = "rgb(200,200,200)"
  ,buttonBorderRadius = 5

  ,buttonBackColorHover = "rgb(235,235,235)"
  ,buttonTextColorHover = "rgb(100,100,100)"
  ,buttonBorderColorHover = "rgb(200,200,200)"

  ,textboxBackColor = "rgb(255,255,255)"
  ,textboxBorderColor = "rgb(200,200,200)"
  ,textboxBorderRadius = 5
  ,textboxBackColorSelect = "rgb(245,245,245)"
  ,textboxBorderColorSelect = "rgb(200,200,200)"

  ### tables
  ,tableBackColor = "rgb(255,255,255)"
  ,tableBorderColor = "rgb(240,240,240)"
  ,tableBorderTopSize = 1
  ,tableBorderRowSize = 1

)


### theme_boe_website -------------------------------------------------------
#' @export
theme_boe_website <- shinyDashboardThemeDIY(

  ### general
  appFontFamily = "Arial"
  ,appFontColor = "rgb(42,102,98)"
  ,bodyBackColor = "rgb(255,255,254)"

  ### header
  ,logoBackColor = "rgb(45,59,66)"

  ,headerButtonBackColor = "rgb(45,59,66)"
  ,headerButtonIconColor = "rgb(255,255,255)"
  ,headerButtonBackColorHover = "rgb(45,59,66)"
  ,headerButtonIconColorHover = "rgb(207,57,92)"

  ,headerBackColor = "rgb(45,59,66)"
  ,headerBoxShadowColor = ""
  ,headerBoxShadowSize = "0px 0px 0px"

  ### sidebar
  ,sidebarBackColor = "rgb(207,57,92)"
  ,sidebarPadding = 0

  ,sidebarMenuBackColor = "transparent"
  ,sidebarMenuPadding = 0
  ,sidebarMenuBorderRadius = 0

  ,sidebarShadowRadius = ""
  ,sidebarShadowColor = "0px 0px 0px"

  ,sidebarUserTextColor = "rgb(255,255,255)"

  ,sidebarSearchBackColor = "rgb(255,255,255)"
  ,sidebarSearchIconColor = "rgb(207,57,92)"
  ,sidebarSearchBorderColor = "rgb(255,255,255)"

  ,sidebarTabTextColor = "rgb(255,255,255)"
  ,sidebarTabTextSize = 14
  ,sidebarTabBorderStyle = "none"
  ,sidebarTabBorderColor = "none"
  ,sidebarTabBorderWidth = 0

  ,sidebarTabBackColorSelected = "rgb(45,59,66)"
  ,sidebarTabTextColorSelected = "rgb(255,255,255)"
  ,sidebarTabRadiusSelected = "0px"

  ,sidebarTabBackColorHover = "rgb(186,51,83)"
  ,sidebarTabTextColorHover = "rgb(255,255,255)"
  ,sidebarTabBorderStyleHover = "none"
  ,sidebarTabBorderColorHover = "none"
  ,sidebarTabBorderWidthHover = 0
  ,sidebarTabRadiusHover = "0px"

  ### boxes
  ,boxBackColor = "rgb(248,248,248)"
  ,boxBorderRadius = 0
  ,boxShadowSize = "0px 0px 0px"
  ,boxShadowColor = ""
  ,boxTitleSize = 18
  ,boxDefaultColor = "rgb(248,248,248)"
  ,boxPrimaryColor = "rgb(15,124,191)"
  ,boxSuccessColor = "rgb(59,133,95)"
  ,boxWarningColor = "rgb(178,83,149)"
  ,boxDangerColor = "rgb(207,57,92)"

  ,tabBoxTabColor = "rgb(248,248,248)"
  ,tabBoxTabTextSize = 14
  ,tabBoxTabTextColor = "rgb(42,102,98)"
  ,tabBoxTabTextColorSelected = "rgb(207,57,92)"
  ,tabBoxBackColor = "rgb(248,248,248)"
  ,tabBoxHighlightColor = "rgb(207,57,92)"
  ,tabBoxBorderRadius = 0

  ### inputs
  ,buttonBackColor = "rgb(207,57,92)"
  ,buttonTextColor = "rgb(255,255,255)"
  ,buttonBorderColor = "rgb(207,57,92)"
  ,buttonBorderRadius = 0

  ,buttonBackColorHover = "rgb(186,51,83)"
  ,buttonTextColorHover = "rgb(255,255,255)"
  ,buttonBorderColorHover = "rgb(186,51,83)"

  ,textboxBackColor = "rgb(255,255,255)"
  ,textboxBorderColor = "rgb(118,118,118)"
  ,textboxBorderRadius = 0
  ,textboxBackColorSelect = "rgb(255,255,255)"
  ,textboxBorderColorSelect = "rgb(118,118,118)"

  ### tables
  ,tableBackColor = "rgb(248,248,248)"
  ,tableBorderColor = "rgb(235,235,235)"
  ,tableBorderTopSize = 1
  ,tableBorderRowSize = 1

)


### theme_grey_light --------------------------------------------------------
#' @export
theme_grey_light <- shinyDashboardThemeDIY(

  ### general
  appFontFamily = "Arial"
  ,appFontColor = "rgb(45,45,45)"
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


### theme_grey_dark ---------------------------------------------------------
#' @export
theme_grey_dark <- shinyDashboardThemeDIY(

  ### general
  appFontFamily = "Arial"
  ,appFontColor = "rgb(205,205,205)"
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


### theme_onenote -----------------------------------------------------------
#' @export
theme_onenote <- shinyDashboardThemeDIY(

  ### general
  appFontFamily = "Arial"
  ,appFontColor = "rgb(0,0,0)"
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


### theme_poor_mans_flatly --------------------------------------------------
#' @export
theme_poor_mans_flatly <- shinyDashboardThemeDIY(

  ### general
  appFontFamily = "Arial"
  ,appFontColor = "rgb(33,37,41)"
  ,bodyBackColor = "rgb(255,255,255)"

  ### header
  ,logoBackColor = "rgb(24,188,156)"

  ,headerButtonBackColor = "rgb(24,188,156)"
  ,headerButtonIconColor = "rgb(44,62,80)"
  ,headerButtonBackColorHover = "rgb(20,154,128)"
  ,headerButtonIconColorHover = "rgb(0,0,0)"

  ,headerBackColor = "rgb(24,188,156)"
  ,headerBoxShadowColor = ""
  ,headerBoxShadowSize = "0px 0px 0px"

  ### sidebar
  ,sidebarBackColor = "rgb(44,62,80)"
  ,sidebarPadding = 0

  ,sidebarMenuBackColor = "inherit"
  ,sidebarMenuPadding = 0
  ,sidebarMenuBorderRadius = 0

  ,sidebarShadowRadius = ""
  ,sidebarShadowColor = "0px 0px 0px"

  ,sidebarUserTextColor = "rgb(255,255,255)"

  ,sidebarSearchBackColor = "rgb(255,255,255)"
  ,sidebarSearchIconColor = "rgb(44,62,80)"
  ,sidebarSearchBorderColor = "rgb(255,255,255)"

  ,sidebarTabTextColor = "rgb(255,255,255)"
  ,sidebarTabTextSize = 14
  ,sidebarTabBorderStyle = "none"
  ,sidebarTabBorderColor = "none"
  ,sidebarTabBorderWidth = 0

  ,sidebarTabBackColorSelected = "rgb(30,43,55)"
  ,sidebarTabTextColorSelected = "rgb(24,188,156)"
  ,sidebarTabRadiusSelected = "0px"

  ,sidebarTabBackColorHover = "rgb(44,62,80)"
  ,sidebarTabTextColorHover = "rgb(24,188,156)"
  ,sidebarTabBorderStyleHover = "none"
  ,sidebarTabBorderColorHover = "none"
  ,sidebarTabBorderWidthHover = 0
  ,sidebarTabRadiusHover = "0px"

  ### boxes
  ,boxBackColor = "rgb(245,245,245)"
  ,boxBorderRadius = 0
  ,boxShadowSize = "0px 0px 0px"
  ,boxShadowColor = ""
  ,boxTitleSize = 19
  ,boxDefaultColor = "rgb(52,152,219)"
  ,boxPrimaryColor = "rgb(44,62,80)"
  ,boxSuccessColor = "rgb(24, 188, 156)"
  ,boxWarningColor = "rgb(243,156,18)"
  ,boxDangerColor = "rgb(231,76,60)"

  ,tabBoxTabColor = "rgb(44,62,80)"
  ,tabBoxTabTextSize = 14
  ,tabBoxTabTextColor = "rgb(24, 188, 156)"
  ,tabBoxTabTextColorSelected = "rgb(255, 255, 255)"
  ,tabBoxBackColor = "rgb(255,255,255)"
  ,tabBoxHighlightColor = "rgb(255,255,255)"
  ,tabBoxBorderRadius = 10

  ### inputs
  ,buttonBackColor = "rgb(44,62,80)"
  ,buttonTextColor = "rgb(255,255,255)"
  ,buttonBorderColor = "rgb(44,62,80)"
  ,buttonBorderRadius = 5

  ,buttonBackColorHover = "rgb(30,43,55)"
  ,buttonTextColorHover = "rgb(255,255,255)"
  ,buttonBorderColorHover = "rgb(30,43,55)"

  ,textboxBackColor = "rgb(255,255,255)"
  ,textboxBorderColor = "rgb(206,212,218)"
  ,textboxBorderRadius = 5
  ,textboxBackColorSelect = "rgb(255,255,255)"
  ,textboxBorderColorSelect = "rgb(89,126,162)"

  ### tables
  ,tableBackColor = "rgb(255,255,255)"
  ,tableBorderColor = "rgb(236,240,241)"
  ,tableBorderTopSize = 1
  ,tableBorderRowSize = 1

)


### theme_purple_gradient ---------------------------------------------------
#' @export
theme_purple_gradient <- shinyDashboardThemeDIY(

  ### general
  appFontFamily = "Arial"
  ,appFontColor = "rgb(128,177,221)"
  ,bodyBackColor = cssGradientThreeColors(
    direction = "down"
    ,colorStart = "rgb(49,56,107)"
    ,colorMiddle = "rgb(71,59,109)"
    ,colorEnd = "rgb(78,88,149)"
    ,colorStartPos = 0
    ,colorMiddlePos = 70
    ,colorEndPos = 100
  )

  ### header
  ,logoBackColor = "rgb(49,56,107)"

  ,headerButtonBackColor = "rgb(49,56,107)"
  ,headerButtonIconColor = "rgb(62,133,179)"
  ,headerButtonBackColorHover = "rgb(49,56,107)"
  ,headerButtonIconColorHover = "rgb(255,255,255)"

  ,headerBackColor = "rgb(49,56,107)"
  ,headerBoxShadowColor = ""
  ,headerBoxShadowSize = "0px 0px 0px"

  ### sidebar
  ,sidebarBackColor = cssGradientThreeColors(
    direction = "down"
    ,colorStart = "rgb(49,56,107)"
    ,colorMiddle = "rgb(71,59,109)"
    ,colorEnd = "rgb(78,88,149)"
    ,colorStartPos = 0
    ,colorMiddlePos = 70
    ,colorEndPos = 100
  )

  ,sidebarShadowRadius = ""
  ,sidebarPadding = 10
  ,sidebarShadowColor = "0px 0px 0px"

  ,sidebarMenuBackColor = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "rgb(48,103,157)"
    ,colorMiddle = "rgb(65,79,129)"
    ,colorEnd = "rgb(55,70,120)"
    ,colorStartPos = 0
    ,colorMiddlePos = 30
    ,colorEndPos = 100
  )
  ,sidebarMenuPadding = 5
  ,sidebarMenuBorderRadius = 20

  ,sidebarUserTextColor = "rgb(128,177,221)"

  ,sidebarSearchBackColor = "rgb(40,70,115)"
  ,sidebarSearchIconColor = "rgb(50,115,145)"
  ,sidebarSearchBorderColor = "rgb(30,60,105)"

  ,sidebarTabTextColor = "rgb(128,177,221)"
  ,sidebarTabTextSize = 13
  ,sidebarTabBorderStyle = "none"
  ,sidebarTabBorderColor = "none"
  ,sidebarTabBorderWidth = 0

  ,sidebarTabBackColorSelected = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "rgb(56,137,189)"
    ,colorMiddle = "rgb(65,95,145)"
    ,colorEnd = "rgb(68,84,137)"
    ,colorStartPos = 0
    ,colorMiddlePos = 50
    ,colorEndPos = 100
  )
  ,sidebarTabTextColorSelected = "rgb(255,255,255)"
  ,sidebarTabRadiusSelected = "30px"

  ,sidebarTabBackColorHover = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "rgb(56,137,189)"
    ,colorMiddle = "rgb(65,95,145)"
    ,colorEnd = "rgb(68,84,137)"
    ,colorStartPos = 0
    ,colorMiddlePos = 50
    ,colorEndPos = 100
  )
  ,sidebarTabTextColorHover = "rgb(255,255,255)"
  ,sidebarTabBorderStyleHover = "none"
  ,sidebarTabBorderColorHover = "none"
  ,sidebarTabBorderWidthHover = 0
  ,sidebarTabRadiusHover = "30px"

  ### boxes
  ,boxBackColor = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "rgb(70,75,125)"
    ,colorMiddle = "rgb(65,79,129)"
    ,colorEnd = "rgb(55,70,120)"
    ,colorStartPos = 0
    ,colorMiddlePos = 30
    ,colorEndPos = 100
  )
  ,boxBorderRadius = 15
  ,boxShadowSize = "0px 0px 0px"
  ,boxShadowColor = ""
  ,boxTitleSize = 16
  ,boxDefaultColor = "rgb(49,56,107)"
  ,boxPrimaryColor = "rgb(141,192,241)"
  ,boxSuccessColor = "rgb(64,186,170)"
  ,boxWarningColor = "rgb(255,217,144)"
  ,boxDangerColor = "rgb(249,144,144)"

  ,tabBoxTabColor = "rgb(80,95,155)"
  ,tabBoxTabTextSize = 14
  ,tabBoxTabTextColor = "rgb(128,177,221)"
  ,tabBoxTabTextColorSelected = "rgb(255,255,255)"
  ,tabBoxBackColor = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "rgb(70,75,125)"
    ,colorMiddle = "rgb(65,79,129)"
    ,colorEnd = "rgb(55,70,120)"
    ,colorStartPos = 0
    ,colorMiddlePos = 30
    ,colorEndPos = 100
  )
  ,tabBoxHighlightColor = "rgb(80,95,155)"
  ,tabBoxBorderRadius = 15

  ### inputs
  ,buttonBackColor = "rgb(72,190,229)"
  ,buttonTextColor = "rgb(40,63,106)"
  ,buttonBorderColor = "rgb(72,190,229)"
  ,buttonBorderRadius = 20

  ,buttonBackColorHover = "rgb(115,210,240)"
  ,buttonTextColorHover = "rgb(255,255,255)"
  ,buttonBorderColorHover = "rgb(115,210,240)"

  ,textboxBackColor = "rgb(40,70,115)"
  ,textboxBorderColor = "rgb(30,60,105)"
  ,textboxBorderRadius = 20
  ,textboxBackColorSelect = "rgb(40,70,115)"
  ,textboxBorderColorSelect = "rgb(30,60,105)"

  ### tables
  ,tableBackColor = "transparent"
  ,tableBorderColor = "rgb(80,95,155)"
  ,tableBorderTopSize = 1
  ,tableBorderRowSize = 1

)

