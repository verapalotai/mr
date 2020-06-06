context("Forint")
library(mr)

test_that("forint() function with 42 as input parameter returns 42 Ft", {
  expect_equal(forint(42), '42 Ft')
})
