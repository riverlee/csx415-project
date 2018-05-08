
test_that("Model loaded", {
  load_models()
  expect_is(models.list,"list")
  expect_equal(names(models.list),c("glmnet","rpart","nnet","rf","svmRadial","xgbTree"))
})