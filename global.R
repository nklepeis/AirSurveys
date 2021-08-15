###########################
######  Global.R ##########
###########################

library(shiny)
library(shinysurveys)
library(readxl)
library(dplyr)

extendInputType("check", {
  shiny::checkboxGroupInput(
    inputId = surveyID(),
    label = surveyLabel(),
    choices = surveyOptions(),
  )
})

# df2 <- data.frame(question = "What is your favorite food?",
#                  option = "Your Answer",
#                  input_type = "text",
#                  input_id = "preferred_name",
#                  dependence = NA,
#                  dependence_value = NA,
#                  required = F)

#df <- teaching_r_questions

#df <- read.csv(file="screening.csv")

userSurvey <- read_excel("airMotive_Web_App_User_Survey.xlsx",
                 na=c("", "NA"))
cat("loaded userSurvey:\n")
print(userSurvey)

setupSurvey <- read_excel("airMotive_Instrument_Operation_Survey.xlsx",
                 na=c("", "NA"))
cat("loaded setupSurveyy:\n")
print(setupSurvey)

impactSurvey <- read_excel("airMotive_Impact_Survey.xlsx",
                          na=c("", "NA"))
cat("loaded impactSurvey:\n")
print(impactSurvey)


currentSurvey <- NA
userName <- NA

#currentSurvey <- "userSurvey"
#df <- read_excel("testing.xlsx", na=c("","NA"))

