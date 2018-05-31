---
title: "Formal Problem Statement (FPS)"
subtitle: "Predict gestational diabetes"
author: "Jiang Li"
date: "2018-05-30"
output: 
  html_document:
    toc: true
    keep_md: yes
    toc_float:
      collapsed: false
      smooth_scroll: false
---



## Introduction

Gestational diabetes develops during pregnancy (gestation). Gestational diabetes generally results in few symptoms which mean the pregant women ususally don't notice that already they have it, however, it causes high blood sugar that can affect your pregnancy and your baby's health. Babies born to mothers with poorly treated gestational diabetes are at increased risk of being too large, having low blood sugar after birth, and jaundice. If untreated, it can also result in a stillbirth. Long term, children are at higher risk of being overweight and developing type 2 diabetes.

Usually expectant women can help control gestational diabetes with diet and exercise at the early stage of pragnacy. However, most of the pregant women don't realize they have gestational diabetes until very late stage of pragnacy and controling it through diet and excercise is risky and not practical. They usually have to take medication like taking insulin which makes the pragnacy frustration. 


So we are developping a prediction system which takes blood pressure, BMI etc. to predict the possibility of having gestational diabetes, it will give opportunites of those expectant women to try to control it with diet and excercise without taking medication.

## Key Stakeholders

We have idenfied data scientist, software engineer and marketing team as the key stakeholders for the project. Data scientist team will collect data and develop the prediction models. Software engineer team will help develop mobile Apps which implements the prediction model. Marketing team will doing advertising to target the potential users for the App. 

## Success criteria

  - Predict whether a pregnacy women will develop gestational diabetes with 75% accuracy. 
  - We are expecting to have >1000 user within the first month of the inital release of the App. 

## Risks

There might be some gestational diabetes women being predicted as non diabetes by the system. 

## Project timeline

- Data collection (3 weeks)
- Model training/evaluation (2 weeks)
- Application development (3 weeks)
- Advertisement (1 week)
