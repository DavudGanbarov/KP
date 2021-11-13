# Установка пакетов для работы
library(ggplot2)
library(tidyverse)
library(dplyr)
library(nnet)

# Загрузка данных
table1 <- read.csv("C:/Users/Davud/Desktop/КР/RU_Electricity_Market_PZ_dayahead_price_volume.csv")
table2 <- read.csv("C:/Users/Davud/Desktop/КР/RU_Electricity_Market_UES_dayahead_price.csv")
table3 <- read.csv("C:/Users/Davud/Desktop/КР/RU_Electricity_Market_UES_intraday_price.csv")

# Объединение таблиц table3 и table2 по ключевому столбцу timestep
Main_table <- left_join(table3, table2,by=c("timestep"="timestep"))

# Выводим информацию по моедели
Main_table

# p-значения, стандартные ошибки коэффициентов, а также коэф-т детерминации R^2, F-критерий для модели
summary(Main_table) 

#Авторегрессия
set.seed(49)
y <- arima.sim(n = nrow(Main_table), Main_table)
plot(y)

#множественная регрессия
lm.fit = lm(UES_Northwest.x~UES_Northwest.y, data = Main_table)
attach(Main_table)

lm.fit
summary(lm.fit)
lm.fit$coefficients
lm.fit$residuals
names(lm.fit)

#вычисление доверительных интервалов оценок коэф-ов:
coef(lm.fit)

# применим наши навыки разведочного анализа и подключим ggplot2
ggplot(data = lm.fit)+
  geom_point(alpha = 1/3, mapping = aes(x = lm.fit$fitted.values, y=lm.fit$residuals, fill = lm.fit$effects))


