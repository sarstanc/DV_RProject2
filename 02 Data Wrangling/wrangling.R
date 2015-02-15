#import libraries
library("RCurl")
library("reshape2")
library("ggplot2")
require(tidyr)
require(dplyr)
#import data

df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from apd_incidents"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

# MOST POPULAR CRIMES BY PERCENTAGE
dfPERCENT<- df %>% group_by(CRIME_TYPE) %>% summarise(Percentage = (n()/2833)*100, n = n()) %>% arrange(desc(n)) %>% tbl_df()
dfPERCENT
# AVERAGE TIME FOR CRIME TYPE ORDERED BY MOST FREQUENTlY OCCURING
dfTIME <- df %>% group_by(CRIME_TYPE) %>% summarise(Time = mean(TIME), n = n()) %>% arrange(desc(TIME)) %>% tbl_df()
dfTIME
# MOST POPULAR DAY TO COMMIT CRIMES
dfDAY <- df %>% group_by(DATE_I) %>% summarise(n = n()) %>% arrange(desc(n)) %>% tbl_df()
dfDAY

