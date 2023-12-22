### SIMULATE DATA ###
# date: 28/10/2020

# import required libraries
library("simstudy")
library("rlist")
library("tidyverse")
library("data.table")


### SIMULATE PREVENT1 DATA ###

# 1000 observations, no correlation for both sets of simulated datasets

### the following is a simulated PREVENT1 data set 

# read in the data definition table from csv file
def_table <- defRead("PREVENT1_def_table.csv")

# simulate a data set with 1000 observations and no correlation using data definition table - check to create multiple datasets 
set.seed(123)
data <- genData(10000, def_table)


# add the outcome variable which will have associations to some of the other variables
addef <- defDataAdd(varname = "OUTCOME", 
                    dist = "binary", 
                    formula = "-0.4*AGEATAPP - 0.5*PROPERTY + 0.3*APP2OUT + 0.2*REASON + 0.3*ACTIVITY_HO_ADVICE - 0.8*ACTIVITY_HOMELESSNESS_RIGHTS + 0.1*ACTIVITY_FINANCIAL_ASSISTANCE - 0.5*ACTIVITY_TYPE2", 
                    link = "logit")
data <- addColumns(addef, data)
data[, .N, keyby = .(OUTCOME)] # check proportions are roughly okay (32/78 here)
data[, .N, keyby = .(OUTCOME, ETHNICITY)]

# names(data) # view variable names

# check proportions are okay
data[, .N, keyby = .(FIN_VUL)]
data[, .N, keyby = .(PROPERTY)]
data[, .N, keyby = .(PHYS_VUL)]
data[, .N, keyby = .(LACKOFSUPPORT_VUL)]
data[, .N, keyby = .(UNMETNEED_VUL)]
data[, .N, keyby = .(REASON)]
data[, .N, keyby = .(ACTIVITY_HOMELESSNESS_RIGHTS)]
data[, .N, keyby = .(ACTIVITY_HO_ADVICE)]
data[, .N, keyby = .(ACTIVITY_FINANCIAL_ASSISTANCE)] # 0 is intentionally homeless, 1 is unintentionally homeless

# round the continuous data
data[, c("AGEATAPP", 
         "APP2OUT", 
         "ACTIVITY_COUNT", 
         "VULNERABILITY_COUNT")] <- lapply(data[, c("AGEATAPP", 
                                                    "APP2OUT", 
                                                    "ACTIVITY_COUNT", 
                                                    "VULNERABILITY_COUNT")],         
                                           round)
summary(data[,"AGEATAPP"]) 
summary(data[,"APP2OUT"])  
summary(data[,"ACTIVITY_COUNT"])  
summary(data[,"VULNERABILITY_COUNT"])  

# save data set to an external csv 
write.csv(data, 
          "clean_data.csv", 
          row.names = FALSE)

