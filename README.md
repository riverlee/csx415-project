# Project - Predict gestational diabetes

- This is the project of **["CSX415.1 Data Science Principles and Practice"](https://extension.berkeley.edu/search/publicCourseSearchDetails.do;jsessionid=8DC36570C866182DA02E66C491A44036?method=load&courseId=27251189)**. The goal is to predict gestational diabetes.

- Please refer to **[Assets.md](Assets.md)** for the list of files for the project.

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


#### GDM.Score

- This package implements the prediction based on the **xgbtree** model

- To install it:

```r
devtools::install_github("riverlee/CSX415-project/GDM/pkgs/GDM.Score")
```




