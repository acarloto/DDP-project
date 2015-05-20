diseaseProb <- function(baseRate, sensitivity, specificity) {
      # Baye's formula
      P <- 100 * ((sensitivity * baseRate) /((sensitivity * baseRate) + 
                                          ((100 - specificity) * (100 - baseRate))))
}

shinyServer(
      function(input, output) {
            output$prediction1 <- renderPrint({round(diseaseProb(
                  input$baseRate, input$sensitivity, input$specificity), digits = 1)}
                  ) 
            output$prediction2 <- renderPrint({round(diseaseProb(
                  diseaseProb(input$baseRate, input$sensitivity, input$specificity), 
                        input$sensitivity, input$specificity), digits = 1)}
                  )
            output$prediction3 <- renderPrint({round(diseaseProb(
                  diseaseProb(diseaseProb(input$baseRate, input$sensitivity, input$specificity),
                        input$sensitivity, input$specificity), 
                              input$sensitivity, input$specificity), digits = 1)}
                  ) 
      }
)