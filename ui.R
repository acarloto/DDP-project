shinyUI(pageWithSidebar(
      headerPanel("Disease Probability Given a Positive Diagnostic Test"),
      sidebarPanel(width = 4,
            numericInput(
                        'baseRate', 'The % base rate of the disease is:',
                        value = 0.1, min = 0, max = 100, step = 0.1
                        ),
            numericInput(
                        'sensitivity', 'The % sensitivity of the diagnostic test
                        is:',value = 80, min = 0, max = 100, step = 0.1
                        ),
            numericInput(
                        'specificity', 'The % specificity of the diagnostic test
                        is:',value = 95, min = 0, max = 100, step = 0.1
                        ),
            submitButton('Submit')
                  ),
      mainPanel(width = 4,
                tabsetPanel(
                      tabPanel("Results",  
                               h3('Results'),
                               h4('The % disease probability is:'),
                               verbatimTextOutput("prediction1"),
                               h4('For a 2º positive test:'),
                               verbatimTextOutput("prediction2"),
                               h4('For a 3º positive test:'),
                               verbatimTextOutput("prediction3")
                               ),
                      tabPanel("Read Me", h4(style="text-align:justify","This applet let you calculate, 
                              easily and accurately, the positive predictive value, or PPV, 
                              of a medical diagnostic test, i.e. the probability of having 
                              a disease given that you tested positive – P(D|+). Receives 
                              as inputs the base rate of the health condition, the sensitivity
                              of the test [the probability of getting a positive result if 
                              you have the disease - P(+|D)] and the specificity of the test
                              [the probability of getting a negative result if you don't have
                              the disease - P(-|~D)]. The outputs are the PPV for a first 
                              positive test, a second positive test and a third positive test.
                              All probabilities are expressed as percentages, since most people
                              deal better with percentages than with fractional values. 
                              If you have to convert, that's easy, multiply or divide by 100 
                              (e.g. 0.55 is equivalent to 55%)."))
                )
            )
      )
)