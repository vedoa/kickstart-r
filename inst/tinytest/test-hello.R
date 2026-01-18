if (requireNamespace("tinytest", quietly = TRUE)) {
  expect_invisible(hello())
  expect_true(is.null(hello()))
}