## Build GDM-model pacakges
setwd("../pkgs")
library(devtools)

## Create the skeleton of the package
devtools::create("GDM.Score")

## Modify DESCRIPTION accordingly


## create data folder
dir.create("GDM.Score/data")

## Copy models-list.RData to the data folder and rename it
file.copy("../result/fit.rda",to = "GDM.Score//data/fit.rda")

## Create load_models.R into GDM.Score/R

## create .Rd document for the data
document("GDM.Score/")

## Use the testthat package to create a small test for the model to ensure that it works
devtools::use_testthat("GDM.Score/")

devtools::test("GDM.Score/")

## Copy a knitted model performance report into the package. 
## For ease, place it in the inst/ directory.
dir.create('GDM.Score/inst')
file.copy("../reports/multiple-model.html",to = "GDM.Score/inst/")
file.copy("../reports/multiple-model.md",to = "GDM.Score/inst/")



## build the models
build("GDM.Score/")

## Install
install("GDM.Score/")

