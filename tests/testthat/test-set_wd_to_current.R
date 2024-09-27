test_that("set_wd_to_current sets the working directory correctly", {
  # Save the original working directory to revert after the test
  original_wd <- getwd()

  # Check if rstudioapi is available
  if (!rstudioapi::isAvailable()) {
    skip("rstudioapi is not available in this environment.")
  }

  # Simulate the active document path
  fake_path <- tempfile(pattern = "test-dir", tmpdir = tempdir())
  dir.create(fake_path)  # Create a temporary directory to simulate the active file path
  fake_file <- file.path(fake_path, "test-file.R")
  file.create(fake_file)  # Create a fake file inside the temp directory

  # Mock rstudioapi::getActiveDocumentContext to return the fake file path
  mock_getActiveDocumentContext <- function() {
    list(path = fake_file)
  }

  # Use with_mock to replace rstudioapi::getActiveDocumentContext with the mock
  withr::with_mock(
    `rstudioapi::getActiveDocumentContext` = mock_getActiveDocumentContext,
    {
      # Run the function to set the working directory
      set_wd_to_current()

      # Check if the working directory is set to the directory of the fake file
      expect_equal(getwd(), dirname(fake_file))
    }
  )

  # Reset the working directory back to the original
  setwd(original_wd)
})
