test_that("the stash gets cleared", {
  target_dir <- ".mustashe"
  if (!dir.exists(target_dir)) {
    dir.create(target_dir)
    on.exit(unlink(target_dir))
  }

  qs2_file <- file.path(target_dir, "stash1.qs2")
  hash_file <- file.path(target_dir, "stash1.hash")
  other_file <- file.path(target_dir, "other_file.txt")

  file.create(c(qs2_file, hash_file, other_file))

  expect_true(all(file.exists(c(qs2_file, hash_file, other_file))))
  expect_message(clear_stash(), "Clearing stash")
  expect_false(any(file.exists(c(qs2_file, hash_file))))
  expect_true(file.exists(other_file))

  if (dir.exists(target_dir)) unlink(target_dir, recursive = TRUE)
})
