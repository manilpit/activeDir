test_that("set_wd_to_above works", {
  # Save the current working directory to revert after the test
  original_wd <- getwd()
  
  # Simulate an environment where the file is in a subfolder
  tmp_dir <- tempdir()
  sub_dir <- file.path(tmp_dir, "subfolder")
  dir.create(sub_dir)
  setwd(sub_dir)
  
  # Use the package function to go one directory up
  set_wd_to_above()
  
  # Check if the working directory is now set to tmp_dir
  expect_equal(getwd(), tmp_dir)
  
  # Revert back to original working directory after the test
  setwd(original_wd)
})
