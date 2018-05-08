---
title: "Assets"
author: "Jiang Li"
date: "4/24/2018"
output: 
  html_document:
    toc: true
    keep_md: yes
    toc_float:
      collapsed: false
      smooth_scroll: false
---



## Inputs

**Data**

- Downloaded from https://www.kaggle.com/datasets

### Input file
~/GDM/data/diabetes.csv

### **As munged for usage in project:**
~/GDM/munge/01-A.R

It loads the input file (**~/GDM/data/diabetes.csv**) and split the dataset into training (70%) and testing (30%) with R vaiable names are:
- trainDat
- testDat

## Output

###  Linear model performance
- ~/GDM/reports/model-performance-linear.html

### Tree model performance
- ~/GDM/reports/model-performance-rpart.html

### Multiple models performance
implements serveral models which are glmnet,rpart,nnet,rf,svmRadial,xgbTree
- ~/GDM/reports/multiple-model.html
- **Model result in R object**: 
    - ~/GDM/result/models-list.RData
    
### Model packages
- ~/GDM/pkgs/GDM.Models
- A script to build the package is avaiable at ~/GDM/src/build-GDM-model-pkgs.R

    



