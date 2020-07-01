context("CreateLogo_shinyDashboardLogoDIY")

test_that("shinyDashboardLogoDIY_ShouldReturnCorrectHtml_IfCalledWithValidSettings", {
  # Arrange
  boldText <- "testBoldText"
  mainText <- "testMainText"
  textSize <- 15
  badgeText <- "testBadgeText"
  badgeTextColor <- "rgb(0,0,0)"
  badgeTextSize <- 2
  badgeBackColor <- "rgb(255,255,255)"
  badgeBorderRadius <- 3

  newLinePattern <- "\n"
  expectedHtmlText <- glue::glue(
    '<p style="font-size:{textSize}px">
    <b> {boldText} </b>{mainText}<span> &nbsp; </span>
    <span style="background-color: {badgeBackColor};
    border-radius: {badgeBorderRadius}px; "> &nbsp;
    <font color="{badgeTextColor}" size="{badgeTextSize}">{badgeText}</font> &nbsp; </span> </p>'
  )
  expectedHtmlText <- gsub(pattern = newLinePattern, replacement = "", x = expectedHtmlText)
  expectedHtml <- htmltools::HTML(text = expectedHtmlText)

  # Act
  result <- dashboardthemes::shinyDashboardLogoDIY(
    boldText = boldText, mainText = mainText, textSize = textSize,
    badgeText = badgeText, badgeTextColor = badgeTextColor, badgeTextSize = badgeTextSize,
    badgeBackColor = badgeBackColor, badgeBorderRadius = badgeBorderRadius
  )

  # Assert
  expect_equal(expectedHtml, result)
  expect_s3_class(result, "html")
  expect_s3_class(result, "character")

  htmlIncludesNewLineSymbols <- grepl(pattern = newLinePattern, x = result)
  expect_false(htmlIncludesNewLineSymbols)
})
