library(dplyr)
library(readr)
library(lubridate)

to_minute_double <- function(t) {
    minute(t) + second(t) / 60
}

#Read in the raw CSV data
raw_data <- read_csv('dataset/vo2max_data.csv')

#Remove the line describing the column units, and convert the data types
processed_data <- raw_data[-1, ] |> transform(
    t = to_minute_double( ms(t) ), #Technically this will assign today's date 
                                       #to the series as well, but we only care about 
                                       #the minutes and seconds
    Rf = as.numeric(Rf),
    VT = as.numeric(VT),
    VE = as.numeric(VE),
    IV = as.numeric(IV),
    VO2 = as.numeric(VO2),
    VCO2 = as.numeric(VO2),
    RQ = as.numeric(RQ),
    O2exp = as.numeric(O2exp),
    CO2exp = as.numeric(CO2exp),
    `VE/VO2` = as.numeric(`VE/VO2`),
    `VE/VCO2` = as.numeric(`VE/VCO2`),
    `VO2/Kg` = as.numeric(`VO2/Kg`),
    METS = as.numeric(METS),
    HR = as.numeric(HR)
)

#For comparisons
variable_options <- data.frame( 
    Name = c(
        'Rf', 
        'VT', 
        'VE', 
        'IV', 
        'VCO2', 
        'RQ', 
        'O2exp', 
        'CO2exp', 
        'VE.VO2', 
        'VE.VCO2', 
        'METS', 
        'HR'
    ),
    Color = c(
        '#C1292E', 
        '#EBCBF4', 
        '#662C91', 
        '#C6CA53', 
        '#383838', 
        '#D36464', 
        '#4CF1F1', 
        '#C4C4C4', 
        '#19BAEB', 
        '#969696', 
        '#E244A8', 
        '#B81010'
    ),
    MaxValue = c(
        100,
        5,
        200,
        6000,
        6000,
        2,
        900,
        200,
        200,
        150,
        20,
        300
    )
)
