testthat::context("LintRules")

test_that("LintRules_ShouldPass_WhenRun", {
  # Act / Assert
  lintr::expect_lint_free()
})
