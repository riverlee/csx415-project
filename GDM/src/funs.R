
get.performance<-function(trainDat,testDat,algo){
  set.seed(1)
  
  model = train(Outcome~., data=trainDat,method=algo)
  
  ## 1ox applificaion and train on 70% test on 30%
  r = confusionMatrix(predict(model,testDat),testDat$Outcome)
  r
}