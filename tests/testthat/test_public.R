context("Test Public Advisory Scraping.")

# 1998, Tropical Storm Alex
al.1998.alex <- get_storms(1998, basin = "AL") %>%
  dplyr::filter(Name == "Tropical Storm Alex")
al.1998.alex.products <- get_products(al.1998.alex %>%
                                        dplyr::select(Link) %>%
                                        dplyr::first())

test_that("Filter Public Advisories.", {
  expect_equal(length(filter_public(al.1998.alex.products)), 25)
})

al.1998.alex.products.public <- filter_public(al.1998.alex.products)

test_that("1998, Tropical Storm Alex, Advisory 1", {
  # Status
  expect_identical(public(al.1998.alex.products.public[1]) %>%
                     dplyr::select(Status) %>%
                     dplyr::first(), "Tropical Depression")
  # Name
  expect_identical(public(al.1998.alex.products.public[1]) %>%
                     dplyr::select(Name) %>%
                     dplyr::first(), "One")
  # Advisory number
  expect_equal(public(al.1998.alex.products.public[1]) %>%
                 dplyr::select(Adv) %>%
                 dplyr::first(), "1")
  # Date
  expect_equal(public(al.1998.alex.products.public[1]) %>%
                   dplyr::select(Date) %>%
                   dplyr::first(),
               as.POSIXct("1998-07-27 15:00:00", tz = "UTC"))
})

test_that("1998, Tropical Storm Alex, Advisory 26", {
  # Status
  expect_identical(public(al.1998.alex.products.public[25]) %>%
                     dplyr::select(Status) %>%
                     dplyr::first(), "Tropical Disturbance")
  # Name
  expect_identical(public(al.1998.alex.products.public[25]) %>%
                     dplyr::select(Name) %>%
                     dplyr::first(), "Alex")
  # Advisory number
  expect_equal(public(al.1998.alex.products.public[25]) %>%
                 dplyr::select(Adv) %>%
                 dplyr::first(), "26")
  # Date
  expect_equal(public(al.1998.alex.products.public[25]) %>%
                 dplyr::select(Date) %>%
                 dplyr::first(),
               as.POSIXct("1998-08-02 21:00:00", tz = "UTC"))
})