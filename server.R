library(ggplot2)
library(shiny)
library(dplyr)

#Fetch our dataset
source('process_data.R')

source('plot_theme.R')
 
#Calculate the VO2 max with a rolling average
rolling_avg <- function(x, n) { stats::filter(x, rep(1/n, n)) }

vo2_max <- processed_data$VO2.Kg |> rolling_avg(10) |> na.omit() |> max()


# Define server logic required to draw a histogram
server <- function(input, output, session) {
    output$initial_data_plot <- renderPlot({
        ggplot(
            data = processed_data,
            mapping = aes(x = t, y = `VO2.Kg`)
        ) + 
        geom_point(color = '#235789') +

        #VO2 Max indicator
        geom_hline(yintercept = vo2_max, linetype = 'dashed', color = 'red', size = 1) +
        annotate(geom = 'text', x = 2, y = vo2_max, label = 'VO2 Max', vjust=-1, color = 'red', size = 5) +

        #Axes and labels
        scale_y_continuous(breaks = seq(0, max(processed_data$VO2.Kg, na.rm = TRUE), 10)) +

        labs(
            title = expression(VO[2]*' Max Treadmill Test'),
            x = 'Time (min)',
            y = expression(bold(VO[2]*' (mL/kg/min)'))
        ) +
 
        plot_theme
    }, width = 700)

    

    output$comparison_plot <- renderPlot({
        ggplot(
            data = processed_data,
            mapping = aes(
                x = VO2.Kg / vo2_max,
                y = processed_data[, input$vo2Comparison]
            ) 
        ) +  
        geom_point(color = variable_options[variable_options$Name == input$vo2Comparison, 'Color']) +

        #Limit the data so outliers don't affect the plot so much
        ylim(c(0, variable_options[variable_options$Name == input$vo2Comparison, 'MaxValue'])) +

        labs(
            title = bquote(.(input$vo2Comparison) ~ ' vs. %'*VO[2]*' max'),
            x = expression('%'*VO[2]*' max'),
            y = input$vo2Comparison
        ) +

        plot_theme
    })

}
