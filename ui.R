#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    tags$head(
        tags$style(HTML("


                        .modal-content {border: 2px solid gray;}

                        .modal-footer {border-top: 1px solid gray;}

                        .modal-header {border-bottom: 1px solid gray;}

                            "
        )
        )
    ),


    uiOutput("survey")

#
#     tags$head(
#         tags$link(rel = "stylesheet", type = "text/scss", href = "render_survey_nk.scss")
#     ),

    # Application title
    #titlePanel("Air Survey"),


    # sidebarLayout(
    #
    #     # Sidebar with a slider input
    #     sidebarPanel(
    #         h1("Select a Survey"),
    #
    #         actionButton("setupSurvey", label="Setup Survey"),
    #         actionButton("userSurvey", label="App User Survey"),
    #         actionButton("impactSurvey", label="Impact Survey")
    #
    #     ),
    #
    #     # Show a plot of the generated distribution
    #     mainPanel(
    #         div(
    #             id="survey-container"
    #         )
    #     )
    # )


    # surveyOutput(df = df2,
    #              theme="slategray",
    #              survey_title = "airMotive Monitor Setup Survey",
    #              survey_description = "Welcome! Please answer the following questions about your experience setting up monitoring devices."
    # )

    # surveyOutput(df = df3,
    #              theme="slategray",
    #              survey_title = "airMotive Impact Survey",
    #              survey_description = "Welcome! Please answer the following questions about the impact of monitoring."
    # )



    # surveyOutput(df = df2,
    #              #theme=NULL,
    #              survey_title = "Hello, World! 2",
    #              survey_description = "Welcome! 2 This is a demo survey showing off the {shinysurveys} package.",
    #              id = "submit2", label="Submit Survey Reponses 2"
    #              )


))
