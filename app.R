library(shiny)
source('server.R')
source('ui.R')


app <- shinyApp(ui = ui, server = server)
options(shiny.autoreload = TRUE)
runApp()