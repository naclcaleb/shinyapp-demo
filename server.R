library(ggplot2)
library(shiny)
library(dplyr)

#Fetch our dataset
source('process_data.R')

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    print(tail(processed_data))
    output$initial_data_plot <- renderPlot({
        ggplot(
            data = processed_data,
            mapping = aes(x = t, y = VO2)
        ) +
        geom_point(color = '#235789') +

        labs(
            title = expression(VO[2]*' Max Treadmill Test'),
            x = 'Time (min)',
            y = expression(bold(VO[2]*' ('*mL^{-1}*kg^{-1}*min^{-1}*')'))
        ) +

        theme(
            plot.title = element_text(
                size = 30,
                face = 'bold',
                hjust = -0.3,
                margin = margin(10, 0, 20, 0)
            ),
            plot.margin = unit(c(0, 2, 2, 2), 'cm'),
            panel.background = element_blank(),
            axis.line = element_line(size = 0.5, color = 'black'),
            axis.text = element_text(
                size = 15
            ),
            axis.title = element_text(
                size = 15,
                face = 'bold'
            ),
            axis.title.x = element_text(
                margin = margin(10, 0, 0, 0)
            ),
            axis.title.y = element_text(
                margin = margin(0, 10, 0, 0)
            )
        )
    })

}
