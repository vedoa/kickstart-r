#' Say Hello
#'
#' Prints a friendly greeting from the package.
#'
#' @return Invisibly returns `NULL`.
#'
#' @examples
#' hello()
#'
#' @export
hello <- function() {
  message("Hello from {{ package_name }}!")
  invisible(NULL)
}
