context("CreateCss_cssGradientThreeColors")

test_that("CssGradientThreeColors_ShouldReturnCorrectCss_IfCalledWithValidParameters", {
  # Arrange
  direction <- "down"
  colorStart <- "rgb(155,0,0)"
  colorMiddle <- "rgb(0,155,0)"
  colorEnd <- "rgb(0,0,155)"
  colorStartPos <- 0
  colorMiddlePos <- 50
  colorEndPos <- 100

  newLinePattern <- "\n"

  expectedCss <- glue::glue(
    "rgb(155,0,0);
    background: -moz-linear-gradient(top, rgb(155,0,0) 0%, rgb(0,155,0) 50%, rgb(0,0,155) 100%);
    background: -webkit-gradient(left top,left bottom,
     color-stop(0%, rgb(155,0,0)), color-stop(50%, rgb(0,155,0)), color-stop(100%, rgb(0,0,155)));
    background: -webkit-linear-gradient(top, rgb(155,0,0) 0%, rgb(0,155,0) 50%, rgb(0,0,155) 100%);
    background: -o-linear-gradient(top, rgb(155,0,0) 0%, rgb(0,155,0) 50%, rgb(0,0,155) 100%);
    background: -ms-linear-gradient(top, rgb(155,0,0) 0%, rgb(0,155,0) 50%, rgb(0,0,155) 100%);
    background: linear-gradient(to bottom, rgb(155,0,0) 0%, rgb(0,155,0) 50%, rgb(0,0,155) 100%)",
  )
  expectedCss <- gsub(pattern = newLinePattern, replacement = "", x = expectedCss)

  # Act
  result <- dashboardthemes::cssGradientThreeColors(
    direction = direction, colorStart = colorStart, colorMiddle = colorMiddle, colorEnd = colorEnd,
    colorStartPos = colorStartPos, colorMiddlePos = colorMiddlePos, colorEndPos = colorEndPos
  )

  # Assert
  expect_equal(expectedCss, result)

  cssIncludesNewLineSymbols <- grepl(pattern = newLinePattern, x = result)
  expect_false(cssIncludesNewLineSymbols)
})

test_that("cssGradientThreeColors_ShouldUseCorrectCss_IfDirectionIsSetToDown", {
  # Arrange
  direction <- "down"
  colorStart <- "rgb(155,0,0)"
  colorMiddle <- "rgb(0,155,0)"
  colorEnd <- "rgb(0,0,155)"
  colorStartPos <- 0
  colorMiddlePos <- 50
  colorEndPos <- 100

  colorStartSide <- "top"
  colorStartSideCorner <- "left top"
  colorEndSideCorner <- "left bottom"
  colorDirection <- "to bottom"

  mozLinearGradientPattern <- glue::glue("\\-moz\\-linear\\-gradient\\({colorStartSide}")
  webkitGradientPattern <- glue::glue("\\-webkit\\-gradient\\({colorStartSideCorner}\\,{colorEndSideCorner}")
  webkitLinearGradientPattern <- glue::glue("\\-webkit\\-linear\\-gradient\\({colorStartSide}")
  oLinearGradientPattern <- glue::glue("\\-o\\-linear\\-gradient\\({colorStartSide}")
  msLinearGradientPattern <- glue::glue("\\-ms\\-linear\\-gradient\\({colorStartSide}")
  linearGradientPattern <- glue::glue("linear\\-gradient\\({colorDirection}")


  # Act
  result <- dashboardthemes::cssGradientThreeColors(
    direction = direction, colorStart = colorStart, colorMiddle = colorMiddle, colorEnd = colorEnd,
    colorStartPos = colorStartPos, colorMiddlePos = colorMiddlePos, colorEndPos = colorEndPos
  )

  # Assert
  expect_true(grepl(pattern = mozLinearGradientPattern, x = result))
  expect_true(grepl(pattern = webkitGradientPattern, x = result))
  expect_true(grepl(pattern = webkitLinearGradientPattern, x = result))
  expect_true(grepl(pattern = oLinearGradientPattern, x = result))
  expect_true(grepl(pattern = msLinearGradientPattern, x = result))
  expect_true(grepl(pattern = linearGradientPattern, x = result))
})

test_that("cssGradientThreeColors_ShouldUseCorrectCss_IfDirectionIsSetToRight", {
  # Arrange
  direction <- "right"
  colorStart <- "rgb(155,0,0)"
  colorMiddle <- "rgb(0,155,0)"
  colorEnd <- "rgb(0,0,155)"
  colorStartPos <- 0
  colorMiddlePos <- 50
  colorEndPos <- 100

  colorStartSide <- "left"
  colorStartSideCorner <- "left top"
  colorEndSideCorner <- "right top"
  colorDirection <- "to right"

  mozLinearGradientPattern <- glue::glue("\\-moz\\-linear\\-gradient\\({colorStartSide}")
  webkitGradientPattern <- glue::glue("\\-webkit\\-gradient\\({colorStartSideCorner}\\,{colorEndSideCorner}")
  webkitLinearGradientPattern <- glue::glue("\\-webkit\\-linear\\-gradient\\({colorStartSide}")
  oLinearGradientPattern <- glue::glue("\\-o\\-linear\\-gradient\\({colorStartSide}")
  msLinearGradientPattern <- glue::glue("\\-ms\\-linear\\-gradient\\({colorStartSide}")
  linearGradientPattern <- glue::glue("linear\\-gradient\\({colorDirection}")


  # Act
  result <- dashboardthemes::cssGradientThreeColors(
    direction = direction, colorStart = colorStart, colorMiddle = colorMiddle, colorEnd = colorEnd,
    colorStartPos = colorStartPos, colorMiddlePos = colorMiddlePos, colorEndPos = colorEndPos
  )

  # Assert
  expect_true(grepl(pattern = mozLinearGradientPattern, x = result))
  expect_true(grepl(pattern = webkitGradientPattern, x = result))
  expect_true(grepl(pattern = webkitLinearGradientPattern, x = result))
  expect_true(grepl(pattern = oLinearGradientPattern, x = result))
  expect_true(grepl(pattern = msLinearGradientPattern, x = result))
  expect_true(grepl(pattern = linearGradientPattern, x = result))
})

test_that("cssGradientThreeColors_ShouldThrowError_IfDirectionIsInvalid", {
  # Arrange
  direction <- "invalidDirection"
  colorStart <- "rgb(155,0,0)"
  colorMiddle <- "rgb(0,155,0)"
  colorEnd <- "rgb(0,0,155)"
  colorStartPos <- 0
  colorMiddlePos <- 50
  colorEndPos <- 100

  expectedErrorMessage <- "The chosen direction isn't supported."

  # Act
  result <- expect_error(
    dashboardthemes::cssGradientThreeColors(
      direction = direction, colorStart = colorStart, colorMiddle = colorMiddle, colorEnd = colorEnd,
      colorStartPos = colorStartPos, colorMiddlePos = colorMiddlePos, colorEndPos = colorEndPos
    )
  )

  # Assert
  expect_s3_class(result, "error")
  expect_equal(expectedErrorMessage, result$message)
})
