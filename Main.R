
library(ggplot2)
library(tidyverse)
table1 <- read.csv("C:/Users/Davud/Desktop/КР/RU_Electricity_Market_PZ_dayahead_price_volume.csv")
table2 <- read.csv("C:/Users/Davud/Desktop/КР/RU_Electricity_Market_UES_dayahead_price.csv")
table3 <- read.csv("C:/Users/Davud/Desktop/КР/RU_Electricity_Market_UES_intraday_price.csv")

Main_table <- left_join(table3, table2,by=c("timestep"="timestep"))

