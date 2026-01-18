test_that("hello() prints the expected message", {
  output <- capture.output(result <- hello())
  expect_true(any(grepl("Hello from", output)))
  expect_null(result)
})
