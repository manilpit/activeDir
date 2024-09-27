test_that("set_wd_to_above sets the working directory one level up", {
  # Save the original working directory to revert after the test
  original_wd <- getwd()

  # Check if rstudioapi is available
  if (!rstudioapi::isAvailable()) {
    skip("rstudioapi is not available in this environment.")
  }

  # Simulate the active document path
  fake_path <- tempfile(pattern = "test-dir", tmpdir = tempdir())
  subdir <- file.path(fake_path, "subdir")
  dir.create(subdir)  # Create a subdirectory inside the fake directory
  fake_file <- file.path(subdir, "test-file.R")
  file.create(fake_file)  # Create a fake file inside the subdirectory

  # Mock rstudioapi::getActiveDocumentContext to return the fake file path
  mock_getActiveDocumentContext <- function() {
    list(path = fake_file)
  }

  # Use with_mock to replace rstudioapi::getActiveDocumentContext with the mock
  withr::with_mock(
    `rstudioapi::getActiveDocumentContext` = mock_getActiveDocumentContext,
    {
      # Run the function to set the working directory one level up
      set_wd_to_above()

      # Check if the working directory is set to the parent of the fake file's directory
      expect_equal(getwd(), dirname(dirname(fake_file)))
    }
  )

  # Reset the working directory back to the original
  setwd(original_wd)
})
