library(shiny)

ui <- navbarPage(
    title = 'VO2 Max Data',
    tabPanel(
        'Initial Data',
        plotOutput('initial_data_plot')
    )
)