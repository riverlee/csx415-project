## Depolyment

- The project is depolyed through Shiny App, the source code is avaiable at [GDM/app/GDM_Shiny/app.R](GDM/app/GDM_Shiny/app.R).

- It's also deployed at [https://riverlee2008.shinyapps.io/GDM_Shiny/](https://riverlee2008.shinyapps.io/GDM_Shiny/)


## Packages built for the project

#### GDM.Models Package

- This package implements the **xgbtree** model which has the best performance on the data.

- To install it:

```r
devtools::install_github("riverlee/CSX415-project/GDM/pkgs/GDM.Models")
```

- Example:

```r
library(GDM.Models)
fit
```


#### GDM.Score

- This package implements the prediction based on the **xgbtree** model

- To install it:

```r
devtools::install_github("riverlee/CSX415-project/GDM/pkgs/GDM.Score")
```

- Example:

```r
library(GDM.Score)
score(8, 85,80,20,0,28,0.5,30)
```


