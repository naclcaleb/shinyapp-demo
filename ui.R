library(shiny)

#Load dataset for creating options
source('process_data.R')

ui <- navbarPage(
    title = 'VO2 Max Data',
    tabPanel(
        'Initial Data',
        plotOutput('initial_data_plot')
    ),
    tabPanel(  
        '%VO2 Max Comparison',
        sidebarLayout(
            sidebarPanel(
                selectInput(
                    'vo2Comparison',
                    'Variable to Observe',
                    choices = variable_options$Name
                )
            ),
            mainPanel(
                plotOutput('comparison_plot')
            )
        )
    )
)