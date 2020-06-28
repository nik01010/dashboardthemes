context("CreateLogo_shinyDashboardLogo")

test_that("shinyDashboardLogo_ShouldReturnCorrectHtml_IfCalledForValidTheme", {
  validThemeNames <- c(
    "blue_gradient", "flat_red", "grey_light", "grey_dark",
    "onenote", "poor_mans_flatly", "purple_gradient"
  )

  for (i in seq_along(validThemeNames)) {
    # Arrange
    boldText <- "testBoldText"
    mainText <- "testMainText"
    badgeText <- "testBadgeText"

    validThemeName <- validThemeNames[i]
    boldAndMainTextPattern <- glue::glue("<b> {boldText} </b>{mainText}<span>")
    badgeTextPattern <- glue::glue(">{badgeText}</font>")

    # Act
    result <- dashboardthemes::shinyDashboardLogo(
      theme = validThemeName, boldText = boldText, mainText = mainText, badgeText = badgeText
    )

    # Assert
    expect_true(grepl(pattern = boldAndMainTextPattern, x = result))
    expect_true(grepl(pattern = badgeTextPattern, x = result))
  }
})

test_that("shinyDashboardLogo_ShouldThrowError_IfCalledForDiscontinuedTheme", {
  discontinuedThemeNames <- c(
    "boe_website"
  )

  for (i in seq_along(discontinuedThemeNames)) {
    # Arrange
    boldText <- "testBoldText"
    mainText <- "testMainText"
    badgeText <- "testBadgeText"

    discontinuedThemeName <- discontinuedThemeNames[i]
    expectedErrorMessage <- glue::glue("The {discontinuedThemeName} theme has been discontinued*")

    # Act
    result <- expect_error(
      dashboardthemes::shinyDashboardLogo(
        theme = discontinuedThemeName, boldText = boldText, mainText = mainText, badgeText = badgeText
      )
    )

    # Assert
    expect_s3_class(result, "error")
    expect_true(grepl(pattern = expectedErrorMessage, x = result$message))
  }
})

test_that("shinyDashboardLogo_ShouldThrowError_IfCalledForInvalidTheme", {
  invalidThemeNames <- c(
    "", " ", "invalid_theme",
    "BLUE_GRADIENT", "blue_gradient ", "blue gradient"
  )

  for (i in seq_along(invalidThemeNames)) {
    # Arrange
    boldText <- "testBoldText"
    mainText <- "testMainText"
    badgeText <- "testBadgeText"

    invalidThemeName <- invalidThemeNames[i]
    expectedErrorMessage <- "The chosen theme isn't supported."

    # Act
    result <- expect_error(
      dashboardthemes::shinyDashboardLogo(
        theme = invalidThemeName, boldText = boldText, mainText = mainText, badgeText = badgeText
      )
    )

    # Assert
    expect_s3_class(result, "error")
    expect_equal(expectedErrorMessage, result$message)
  }
})
