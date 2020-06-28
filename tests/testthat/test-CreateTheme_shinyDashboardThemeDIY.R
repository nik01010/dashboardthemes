context("CreateTheme_shinyDashboardThemeDIY")

test_that("shinyDashboardThemeDIY_ShouldReturnCorrectHtml_IfCalledWithValidSettings", {
  # Arrange
  themeSettings <- list(
    ### general
    appFontFamily = "Arial"
    ,appFontColor = "rgb(42,102,98)"
    ,primaryFontColor = "rgb(0,0,0)"
    ,infoFontColor = "rgb(0,0,0)"
    ,successFontColor = "rgb(0,0,0)"
    ,warningFontColor = "rgb(0,0,0)"
    ,dangerFontColor = "rgb(0,0,0)"
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
    ,boxInfoColor = "rgb(225,225,225)"
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

  expectedCssFilePath <- "./test-assets/CreateTheme_shinyDashboardThemeDIY/ExpectedOutput.css"
  expectedCss <- readLines(expectedCssFilePath)

  # Act
  result <- do.call(
    what = dashboardthemes::shinyDashboardThemeDIY,
    args = themeSettings
  )

  # Assert
  actualCss <- as.character(result$children[[1]])
  expect_equal(expectedCss, actualCss)
  expect_s3_class(result, "shiny.tag")
})

test_that("shinyDashboardThemes_ShouldReturnCorrectHtml_IfCalledForValidTheme", {
  validThemeNames <- c(
    "blue_gradient", "flat_red", "grey_light", "grey_dark",
    "onenote", "poor_mans_flatly", "purple_gradient"
  )

  for (i in seq_along(validThemeNames)) {
    # Arrange
    validThemeName <- validThemeNames[i]

    # Act
    result <- dashboardthemes::shinyDashboardThemes(theme = validThemeName)

    # Assert
    expect_s3_class(result, "shiny.tag")
    expect_silent(result)

    cssCode <- result$children[[1]]
    expect_s3_class(cssCode, "shiny.tag")
  }
})

test_that("shinyDashboardThemes_ShouldThrowError_IfCalledForDiscontinuedTheme", {
  discontinuedThemeNames <- c(
    "boe_website"
  )

  for (i in seq_along(discontinuedThemeNames)) {
    # Arrange
    discontinuedThemeName <- discontinuedThemeNames[i]
    expectedErrorMessage <- glue::glue("The {discontinuedThemeName} theme has been discontinued*")

    # Act
    result <- expect_error(
      dashboardthemes::shinyDashboardThemes(theme = discontinuedThemeName)
    )

    # Assert
    expect_s3_class(result, "error")
    expect_true(grepl(pattern = expectedErrorMessage, x = result$message))
  }
})

test_that("shinyDashboardThemes_ShouldThrowError_IfCalledForInvalidTheme", {
  invalidThemeNames <- c(
    "", " ", "invalid_theme",
    "BLUE_GRADIENT", "blue_gradient ", "blue gradient"
  )

  for (i in seq_along(invalidThemeNames)) {
    # Arrange
    invalidThemeName <- invalidThemeNames[i]
    expectedErrorMessage <- "The chosen theme isn't supported."

    # Act
    result <- expect_error(
      dashboardthemes::shinyDashboardThemes(theme = invalidThemeName)
    )

    # Assert
    expect_s3_class(result, "error")
    expect_true(grepl(pattern = expectedErrorMessage, x = result$message))
  }
})
