library(testthat)
library(jsonlite)

#' We will chain the tests here; get the token
#' and fetch details of a request
#'
context("Place extraction request")
test_that('request was placed',{

  api_token = getToken('07d4d584c04941a25e291feb8881c685','9ef6bbb24a855fbb765f3890e05592f4','localhost:3000/')
  expect_that(nchar(api_token),
              equals(167))
  ma <- MicroclimAPI$new(token = api_token,url_mc='http://localhost:3000/')
  #expect_that(typeof(ma), equals("S4"))

  requestId = '589ce9a4b2df447c910f7d59'
  # check the status of the request
  # If request is in status 'EMAILED', the files can be retrieved


  # place a request to fetch the files
  ftch_req= ma$fetch(requestId)

  #At least one file will be generated
  expect_gte(length(ftch_req$files),1)

})



