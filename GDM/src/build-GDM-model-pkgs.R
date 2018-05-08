## Build GDM-model pacakges
setwd("../pkgs")
library(devtools)

## Create the skeleton of the package
devtools::create("GDM.Models")

## Modify DESCRIPTION accordingly


## create data folder
dir.create("GDM.Models/data")

## Copy models-list.RData to the data folder and rename it
file.copy("../result/models-list.RData",to = "GDM.Models/data/models.Rda")

## Create load_models.R into GDM.Models/R

## create .Rd document for the data
document("GDM.Models/")

## Use the testthat package to create a small test for the model to ensure that it works
devtools::use_testthat("GDM.Models/")

devtools::test("GDM.Models/")

## Copy a knitted model performance report into the package. 
## For ease, place it in the inst/ directory.
dir.create('GDM.Models/inst')
file.copy("../reports/multiple-model.html",to = "GDM.Models/inst/")
file.copy("../reports/multiple-model.md",to = "GDM.Models/inst/")



## build the models
build("GDM.Models/")

## Install
install("GDM.Models/")
