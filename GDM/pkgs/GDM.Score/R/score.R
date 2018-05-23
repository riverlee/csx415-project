#' @param Pregnancies weeks of Pregnancies (integer)
#' @param Glucose glucose level (integer)
#' @param BloodPressure (integer)
#' @param SkinThickness (integer)
#' @param  Insulin (integer)
#' @param BMI (integer)
#' @param DiabetesPedigreeFunction a float number
#' @param  Age 
#'
#' @examples
#'   score(8, 85,80,20,0,28,0.5,30)
#' @import caret
#' @import magrittr
#' @export

score <- function(Pregnancies,Glucose,BloodPressure,
                  SkinThickness,Insulin,BMI,
                  DiabetesPedigreeFunction,Age) {
  
  data.frame(Pregnancies=Pregnancies,Glucose=Glucose,BloodPressure=BloodPressure,
                      SkinThickness=SkinThickness,Insulin=Insulin,BMI=BMI,
                      DiabetesPedigreeFunction=DiabetesPedigreeFunction,Age=Age) %>%    # automagically convert factors
    predict(fit, ., type="prob") %>% unlist() %>%
    setNames(.,c("Non-diabetes","Diabetes"))
}