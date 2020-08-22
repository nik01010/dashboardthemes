context("LintRules")

test_that("LintRules_ShouldPass_WhenRun", {
  testthat::skip_on_cran()

  # Arrange
  linterPath <- getwd()

  # Act / Assert
  lintr::expect_lint_free(path = linterPath, relative_path = FALSE)
})
