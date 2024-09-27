library(testthat)
library(mockery)

test_that("set_wd_to_current sets the working directory correctly", {
  # Save the original working directory to revert after the test
  original_wd <- getwd()

  # Check if rstudioapi is available
  if (!rstudioapi::isAvailable()) {
    skip("rstudioapi is not available in this environment.")
  }

  # Simulate the active document path
  fake_path <- tempfile(pattern = "test-dir", tmpdir = tempdir())
  dir.create(fake_path, recursive = TRUE)  # Ensure directory creation
  fake_file <- file.path(fake_path, "test-file.R")
  file.create(fake_file)

  # Use mockery::stub to mock rstudioapi::getActiveDocumentContext
  stub(set_wd_to_current, "rstudioapi::getActiveDocumentContext", list(path = fake_file))

  # Run the function to set the working directory
  set_wd_to_current()

  # Check if the working directory is set to the directory of the fake file
  expect_equal(getwd(), dirname(fake_file))

  # Reset the working directory back to the original
  setwd(original_wd)
})
