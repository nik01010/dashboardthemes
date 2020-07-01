context("LintRules")

test_that("LintRules_ShouldPass_WhenRun", {
  skip(message = "Skipping linting rules")
  # Act / Assert
  lintr::expect_lint_free()
})
