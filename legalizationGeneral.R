
##### Install Echarts
remotes::install_git("https://gitee.com/JohnCoene/echarts4r") 
remotes::install_github('JohnCoene/echarts4r.maps')
library(echarts4r)
library(echarts4r.maps)
library(dplyr)
#### Read Data
tb<-read.csv(file = 'data/general.csv',header =T,sep=',',encoding = 'UTF-8')

data <- data.frame(CONTINENT = tb[2], 
                      COUNTRY = tb[3],
                      year2017 = tb[4],
                      year2019 = tb[5])

#### map
em_bank()

tb %>% 
  group_by(YEAR) %>% 
  e_charts(COUNTRY,timeline = TRUE) %>% 
  e_geo() %>%
  e_map(STATUS) %>%
  e_title("2017-2019 LGBT LegalizationGeneral") %>%
