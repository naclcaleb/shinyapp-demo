library(ggplot2)

plot_theme <- theme(
    plot.title = element_text(
        size = 20,
        face = 'bold',
        hjust = 0,
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