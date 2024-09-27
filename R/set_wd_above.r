#' Set working directory to one level above the current file's directory
#'
#' This function sets the working directory to the parent directory of the directory 
#' where the currently active RStudio file is located.
#' 
#' @return Sets the working directory
#' @import rstudioapi
#' @export
set_wd_to_above <- function() {
  if (rstudioapi::isAvailable()) {
    current_path <- rstudioapi::getActiveDocumentContext()$path
    if (!is.null(current_path)) {
      # Set working directory to one level above the current file's directory
      setwd(dirname(dirname(current_path)))
      message("Working directory set to: ", getwd())
    } else {
      stop("No active file found.")
    }
  } else {
    stop("rstudioapi is not available.")
  }
}
