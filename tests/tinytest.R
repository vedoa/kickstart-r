if (requireNamespace("tinytest", quietly = TRUE)) {
  test_package("{{ package_name }}")
} else {
  warning("tinytest is not installed; tests not run.")
}
