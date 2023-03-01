library(tidyverse)
library(PerformanceAnalytics)
library(Hmisc)
library(corrplot)
# Function to get correletions and p.values in a "long" data frame
corr.data = function(data) {
  
  # Get correlations
  cor.vals = cor(data)
  
  # Get p-values
  cor.p = cor.mtest(data, conf.level = 0.95)$p
  rownames(cor.p) = rownames(cor.vals)
  colnames(cor.p) = colnames(cor.vals)
  
  cbind(rowvars=rownames(cor.vals), data.frame(cor.vals)) %>% 
    gather(colvars, corr, -rowvars) %>% 
    left_join(cbind(rowvars=rownames(cor.p), data.frame(cor.p)) %>% 
                gather(colvars, p.value, -rowvars))
}

options(scipen = 999)
a<-corr.data(data_nebenwirk)
b<-corr.data(data_verbess)
c<-corr.data(data_verschlech)

chart.Correlation(data_nebenwirk, histogram=TRUE, pch=19)
chart.Correlation(data_verbess, histogram=TRUE, pch=19)
chart.Correlation(data_verschlech, histogram=TRUE, pch=19)
#########################################################
options(scipen = 999)
d<-corr.data(data_erw)
e<-corr.data(data_vor)
f<-corr.data(data_akt)

chart.Correlation(data_erw, histogram=TRUE, pch=19chart.Correlation(data_vor, histogram=TRUE, pch=19)
chart.Correlation(data_akt, histogram=TRUE, pch=19)