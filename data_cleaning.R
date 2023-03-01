library(readxl)
library(dplyr)
setwd("/Users/philipplange/Desktop/Arbeit/geee")
data <- read_excel("data_geee_2022-07-11_14-22.xlsx")
# only keep drug geee items
keep <- c("CE01", "CE02", "CE03", "CE04", "CE05", "CE06",
          "GE01", "GE04", "GE07", "GE13", "GE16", "GE19",
          "GE22", "GE23", "GE24", "DE01", "DE02_01")

data <- data[keep]
data <- na.omit(data)
data <- data[-1,]
# rename items correctly
names(data)[names(data) == 'GE04'] <- 'GE02'
names(data)[names(data) == 'GE07'] <- 'GE03'
names(data)[names(data) == 'GE13'] <- 'GE04'
names(data)[names(data) == 'GE16'] <- 'GE05'
names(data)[names(data) == 'GE19'] <- 'GE06'
names(data)[names(data) == 'GE22'] <- 'GE07'
names(data)[names(data) == 'GE23'] <- 'GE08'
names(data)[names(data) == 'GE24'] <- 'GE09'

# build scores for CEQ

data <- mutate(data, ceq_cred = CE01 + CE02 + CE03)
data <- mutate(data, ceq_exp = CE04 + CE05 + CE06)


# sort data frame by dimension of geee

erwartung <- c("GE01", "GE02", "GE03", "ceq_exp", "ceq_cred")
vorerfahrung <- c("GE04", "GE05", "GE06", "ceq_exp", "ceq_cred")
aktuell <- c("GE07", "GE08", "GE09", "ceq_exp", "ceq_cred")

data_erw <- data[erwartung]
data_vor <- data[vorerfahrung]
data_akt <- data[aktuell]

verbesserung <- c("GE01", "GE04", "GE07")
verschlechterung <- c("GE02", "GE05", "GE08")
nebenwirkungen <- c("GE03", "GE06", "GE09")

data_verbess <- data[verbesserung]
data_verschlech <- data[verschlechterung]
data_nebenwirk <- data[nebenwirkungen]

# number of males and females
# mean and sd of age
data %>% 
  group_by(DE01) %>%l
  summarise(no_rows = length(DE01))

mean(data$DE02_01)
sd(data$DE02_01)





