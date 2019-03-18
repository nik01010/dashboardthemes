# dashboardthemes

<a href="https://nik01010.wordpress.com/" target="_blank">Blog</a> | <a href="https://nik01010.wordpress.com/contact/" target="_blank">Contact</a>
<br>

An experimental R package to provide custom theme options for Shinydashboard applications. Released as BETA.

<br>
<a href="https://ibb.co/dbMBHn" target="_blank"><img src="https://thumb.ibb.co/dbMBHn/blue_gradient.png" alt="blue_gradient" border="0"></a> <a href="https://ibb.co/bvGNOS" target="_blank"><img src="https://thumb.ibb.co/bvGNOS/boe_website.png" alt="boe_website" border="0"></a> <a href="https://ibb.co/cNgYV7" target="_blank"><img src="https://thumb.ibb.co/cNgYV7/grey_dark.png" alt="grey_dark" border="0"></a> <a href="https://ibb.co/iuFGiS" target="_blank"><img src="https://thumb.ibb.co/iuFGiS/grey_light.png" alt="grey_light" border="0"></a> <a href="https://ibb.co/mW4WHn" target="_blank"><img src="https://thumb.ibb.co/mW4WHn/onenote.png" alt="onenote" border="0"></a> <a href="https://ibb.co/mYhkcn" target="_blank"><img src="https://thumb.ibb.co/mYhkcn/poor_mans_flatly.png" alt="poor_mans_flatly" border="0"></a> <a href="https://ibb.co/ea4LA7" target="_blank"><img src="https://thumb.ibb.co/ea4LA7/purple_gradient.png" alt="purple_gradient" border="0"></a>
<br>

## Features
- Straightforward use of a new set of themes and logos.

- Easy creation of new themes and logos, without knowledge of CSS code.

- Use of live theme switchers in apps (<a href="https://github.com/nik01010/dashboardThemeSwitcher" target="_blank">Guide available here</a>).
  
  
## Disclaimer
This is not part of the official Shinydashboard package and is released as a separate set of functionality.  Efforts will be made to ensure compatibility with future versions of Shinydashboard but there could be delays in doing so. As such, dashboardthemes should be treated as an experimental package and used at your own risk.


## Installation

```R
library(devtools)
install_github("nik01010/dashboardthemes")
```


## Functions

| Function       | Description                | Input | Output             |
| ------------- |----------------------|----------------------|-------------------|
| shinyDashboardThemes | Calls a custom theme created using shinyDashboardThemeDIY | Theme name | Theme settings object |
| shinyDashboardLogo | Calls a custom logo created using shinyDashboardLogoDIY | Theme name | Logo settings object |
| shinyDashboardThemeDIY | Creates a custom theme object | Size, colour and other settings for each UI element. See function documentation for input options | Theme settings object |
| shinyDashboardLogoDIY | Creates a custom logo object. Inspired from <a href="http://www.dataseries.org/" target="_blank">here</a> | Size and colour for the logo. See function documentation for input options | Logo settings object |
| cssGradientThreeColors | Creates a three colour gradient to be used in themes | Gradient direction, colours, position of middle colour | CSS gradient |

## Using logos
Use by inserting into the title parameter within the dashboardHeader part of an application.
```R

  ...
  ### ui
  ui <- dashboardPage(
    
    ### ui header
    dashboardHeader(
  
      ### changing logo
      title = shinyDashboardLogo(
        theme = "blue_gradient"
      )
      ...

```

## Using themes
Use by inserting into the dashboardBody part of an application.
```R

  ...
  ### ui body
  dashboardBody(
    
    ### changing theme
    shinyDashboardThemes(
      theme = "blue_gradient"
    )
    
    ### ui tabs
    ,tabItems(
      tabItem(
        ...

```

## Creating new logos
Example of creating a custom logo object. Each parameter can be changed as required.
```R

  ### creating custom logo object
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
  
  ### calling custom logo object in shinydashboard
    ...
    ### ui
    ui <- dashboardPage(
      
      ### ui header
      dashboardHeader(
    
        ### changing logo
        title = logo_blue_gradient
        ...
        

```

## Creating new themes
Example of creating a custom theme object. Each parameter can be changed as required.
```R

  ### creating custom theme object
  theme_blue_gradient <- shinyDashboardThemeDIY(

    ### general
    appFontFamily = "Arial"
    ,appFontColor = "rgb(0,0,0)"
    ,primaryFontColor = "rgb(0,0,0)"
    ,successFontColor = "rgb(0,0,0)"
    ,warningFontColor = "rgb(0,0,0)"
    ,dangerFontColor = "rgb(0,0,0)"
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
  
  ### calling custom theme object in shinydashboard
    ...
    ### ui body
    dashboardBody(
      
      ### changing theme
      theme_blue_gradient
      
      ### ui tabs
      ,tabItems(
        tabItem(
          ...

```

## New themes

| Theme          | Code | Description                        |
| ------------------ |------------|-----------------------------------------------|
| Blue gradient | blue_gradient | Demonstrates use of gradients, shadows and rounded corners |
| BoE website | boe_website | Styled similarly to the new BoE website |
| Grey light | grey_light | Simple, light theme using a grey colour schemes |
| Grey dark | grey_dark | Demonstrates use of inverted dark colour schemes |
| OneNote | onenote | Styled similarly to the OneNote application |
| Poor man's Flatly | poor_mans_flatly | Poor man's version of the <a href="https://bootswatch.com/flatly/" target="_blank">Flatly</a> theme
| Purple gradient | purple_gradient | Demonstrates high use of gradients and a smaller sidebar |


### Blue gradient
<a href="https://ibb.co/dbMBHn" target="_blank"><img src="https://preview.ibb.co/ik0hOS/blue_gradient.png" alt="blue_gradient" border="0"></a>
<br>

### BoE website
<a href="https://ibb.co/bvGNOS" target="_blank"><img src="https://preview.ibb.co/mx7U3S/boe_website.png" alt="boe_website" border="0"></a>
<br>

### Grey light
<a href="https://ibb.co/iuFGiS" target="_blank"><img src="https://preview.ibb.co/cVBp3S/grey_light.png" alt="grey_light" border="0"></a>
<br>

### Grey dark
<a href="https://ibb.co/cNgYV7" target="_blank"><img src="https://preview.ibb.co/bTgp3S/grey_dark.png" alt="grey_dark" border="0"></a>
<br>

### OneNote
<a href="https://ibb.co/mW4WHn" target="_blank"><img src="https://preview.ibb.co/fxYQcn/onenote.png" alt="onenote" border="0"></a>
<br>

### Poor man's Flatly
<a href="https://ibb.co/mYhkcn" target="_blank"><img src="https://preview.ibb.co/hRnwiS/poor_mans_flatly.png" alt="poor_mans_flatly" border="0"></a>
<br>

### Purple gradient
<a href="https://ibb.co/ea4LA7" target="_blank"><img src="https://preview.ibb.co/mAK93S/purple_gradient.png" alt="purple_gradient" border="0"></a>

## Known issues
  
Some application components have not been fully customised:

- Action button when pressed

- Dropdown menu background

- Popup menu and placeholder font colour in date inputs

- Checkbox and radio buttons
