#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

    showModal(modalDialog(p("Click on a button below to start taking a survey."),
                          h2("Monitor Setup Survey"),
                          p("Take the Monitor Setup Survey after you have finished setting up an air monitor."),

                          h2("App User Survey"),
                          p("Take the App User Survey after you have finished using the AirMotive app."),

                          h2("Impact Survey"),
                          p("Take the Impact Survey to provide feedback on using AirMotive to promote clean-air policies and behaviors."),

                          title=h1(icon("Poll"),"Select an AirMotive Survey"),
                          footer=tagList(
                              actionButton("setupSurvey",
                                           "Monitor Setup Survey"),
                              actionButton("userSurvey",
                                           "App User Survey"),
                              actionButton("impactSurvey",
                                           "Impact Survey")

                          ),
                          size="l")
    )

    observeEvent(input$userSurvey,{
        removeModal()

        output$survey <- renderUI({
            surveyOutput(df = userSurvey,
                         theme="blue",
                         survey_title = "AirMotive App User Survey",
                         survey_description = "Welcome! Please answer the following questions about your experience with the airMotive web app."
            )
        })

        renderSurvey()

        cat("userSurvey rendered.\n")

        currentSurvey <<- "AirMotive App User Survey"


    })

    observeEvent(input$setupSurvey,{
        removeModal()

        output$survey <- renderUI({
            surveyOutput(df = setupSurvey,
                         theme="brown",
                         survey_title = "airMotive Monitor Setup Survey",
                         survey_description = "Welcome! Please answer the following questions about your experience configuring, installing, and using air monitors."
            )
        })

        renderSurvey()

        cat("setupSurvey rendered.\n")

        currentSurvey <<- "AirMotive Monitor Setup Survey"


    })


    observeEvent(input$impactSurvey,{
        removeModal()

        output$survey <- renderUI({
            surveyOutput(df = impactSurvey,
                         theme="purple",
                         survey_title = "airMotive Impact Survey",
                         survey_description = "Welcome! Please answer the following questions about how using AirMotive may have impacted smoke-free policies or behaviors."
            )
        })

        cat("impactSurvey rendering...\n")

        renderSurvey()



        currentSurvey <<- "AirMotive Impact Survey"


    })


    # observeEvent(input$userSurvey, {
    #
    #     removeUI(
    #         ## pass in appropriate div id
    #         selector = "#survey"
    #     )
    #
    #     cat("Adding the user survey....\n")
    #
    #     insertUI(
    #         selector = '#survey-container',
    #         where="afterEnd",
    #         ## wrap element in a div with id for ease of removal
    #         tags$div(
    #             #tags$p(paste("Element number 24")),
    #             surveyOutput(df = df,
    #                               theme="slateblue",
    #                               survey_title = "airMotive App User Survey",
    #                               survey_description = "Welcome! Please answer the following questions about your experience with the airMotive app."
    #             ),
    #
    #             id = "survey"
    #         )
    #
    #     )
    #
    #     renderSurvey()
    #
    # })

    # surveyOutput(df = df,
    #              theme="slateblue",
    #              survey_title = "airMotive App User Survey",
    #              survey_description = "Welcome! Please answer the following questions about your experience with the airMotive app."
    # )
    #
    # renderSurvey()



    #  old way...

    # observeEvent(input$submit, {
    #
    #     print(input)
    #
    #     # Create a dataframe where the subject ID is equal to the userID
    #     # as set in the HTML path. For more details, on the user ID see
    #     # https://www.jdtrat.com/packages/shinysurveys/#advanced-surveys
    #     responses <- data.frame(subject_id = input$userID,
    #                             # Create a question indicator as just the input ID
    #                             question = df$input_id,
    #                             # Get the user responses for all input questions.
    #                             response = purrr::map_df(df$input_id,
    #                                                      ~ list(response = input[[.x]])))
    #
    #     # Could also write responses to csv or save to cloud storage, etc...
    #     print(responses)
    #
    #
    #     showModal(modalDialog(
    #         title = "Congrats, you completed your first shinysurvey!",
    #         "You can customize what actions happen when a user finishes a survey using input$submit."
    #     ))
    # })
t

    # new way...

    observeEvent(input$submit, {
        results <- getSurveyData()
        results <- results %>%
            mutate(surveyName=currentSurvey,
                   userName=userName,
                   Time=Sys.time())
        print(results)
        shiny::showModal(
            shiny::modalDialog(
                p("We appreciate your participation."),
                p("Your survey results have been saved."),
                title = paste("Thank you for taking the  '",currentSurvey,"' !",sep=""),
                footer=tagList(
                    actionButton("moreSurveys",
                                 "Take More Surveys",
                                 onclick ="window.open('https://etr1.shinyapps.io/AirSurveys', '_self')"),
                    actionButton("gotoAirMotive",
                                 "Launch the AirMotive Web App",
                                 onclick ="window.open('https://etr1.shinyapps.io/AirMotive', '_blank')"),
                    actionButton("Logout",
                                 "Log Out",
                                 onclick ="window.open('https://etr1.shinyapps.io/AirMotive/__logout__/', '_self')")
                )
            )

        )
    })


    # observeEvent(input$submit2, {
    #     print(getSurveyData())
    #     shiny::showModal(
    #         shiny::modalDialog(
    #             title = "Thank you for taking this survey!",
    #             ""
    #         )
    #     )
    # })

})
