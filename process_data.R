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
    RQ = as.numeric(RQ),
    O2exp = as.numeric(O2exp),
    CO2exp = as.numeric(CO2exp),
    `VE/VO2` = as.numeric(`VE/VO2`)
)
