# Project Performance
Jiang Li  
`r Sys.Date()`  



## Load Data

We will use [ProjectTemplate](http://projecttemplate.net/) to layout my project. When load the project, we will split the **diabetes** dataset into train and test dataset, namely **trainDat** (70%) and **testDat**(remaining 30%).


```r
library(ProjectTemplate)
load.project()
ls()
```

```
## [1] "config"          "diabetes"        "helper.function" "project.info"   
## [5] "testDat"         "trainDat"
```

## Explore data

In this analysis, we will look at each feature to test whether the average (median) value is different between diabetes patients and normal people. We would apply both t-test(**t.test**) and Wilcoxon Rank Sum (**wilcox.test**).


```r
head(diabetes)
```

```
##   Pregnancies Glucose BloodPressure SkinThickness Insulin  BMI
## 1           6     148            72            35       0 33.6
## 2           1      85            66            29       0 26.6
## 3           8     183            64             0       0 23.3
## 4           1      89            66            23      94 28.1
## 5           0     137            40            35     168 43.1
## 6           5     116            74             0       0 25.6
##   DiabetesPedigreeFunction Age Outcome
## 1                    0.627  50       1
## 2                    0.351  31       0
## 3                    0.672  32       1
## 4                    0.167  21       0
## 5                    2.288  33       1
## 6                    0.201  30       0
```

```r
source("src/explore.R")
```

![](project-performance_files/figure-html/explore-1.png)<!-- -->![](project-performance_files/figure-html/explore-2.png)<!-- -->![](project-performance_files/figure-html/explore-3.png)<!-- -->![](project-performance_files/figure-html/explore-4.png)<!-- -->![](project-performance_files/figure-html/explore-5.png)<!-- -->![](project-performance_files/figure-html/explore-6.png)<!-- -->![](project-performance_files/figure-html/explore-7.png)<!-- -->![](project-performance_files/figure-html/explore-8.png)<!-- -->




## Naive Bayes

We only get **78%** and **73%** accuracy on the tain and test dataset.


```r
source("src/funs.R")
get.performance(trainDat,trainDat,algo = "nb")
```

```
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction   0   1
##          0 298  66
##          1  52 122
##                                           
##                Accuracy : 0.7807          
##                  95% CI : (0.7433, 0.8149)
##     No Information Rate : 0.6506          
##     P-Value [Acc > NIR] : 3.515e-11       
##                                           
##                   Kappa : 0.5091          
##  Mcnemar's Test P-Value : 0.2314          
##                                           
##             Sensitivity : 0.8514          
##             Specificity : 0.6489          
##          Pos Pred Value : 0.8187          
##          Neg Pred Value : 0.7011          
##              Prevalence : 0.6506          
##          Detection Rate : 0.5539          
##    Detection Prevalence : 0.6766          
##       Balanced Accuracy : 0.7502          
##                                           
##        'Positive' Class : 0               
## 
```

```r
get.performance(trainDat,testDat,algo = "nb")
```

```
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction   0   1
##          0 123  35
##          1  27  45
##                                           
##                Accuracy : 0.7304          
##                  95% CI : (0.6682, 0.7866)
##     No Information Rate : 0.6522          
##     P-Value [Acc > NIR] : 0.006878        
##                                           
##                   Kappa : 0.3916          
##  Mcnemar's Test P-Value : 0.374003        
##                                           
##             Sensitivity : 0.8200          
##             Specificity : 0.5625          
##          Pos Pred Value : 0.7785          
##          Neg Pred Value : 0.6250          
##              Prevalence : 0.6522          
##          Detection Rate : 0.5348          
##    Detection Prevalence : 0.6870          
##       Balanced Accuracy : 0.6912          
##                                           
##        'Positive' Class : 0               
## 
```





