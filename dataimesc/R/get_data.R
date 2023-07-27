get_data<-function(serie, begin, end){
  if(!require("tidyverse")) install.packages("tidyverse")
  if(!require("jsonlite")) install.packages("jsonlite")
  if(!require("httr")) install.packages("httr")
  require(jsonlite)
  library(dplyr)
  library(purrr)
  require(httr)
  json<-httr::GET(str_interp('https://dataimesc.imesc.ma.gov.br/getData?id=${serie}&scope=4&from=${begin}&to=${end}'), accept_json())
  jsonInfoImg <- content(json, type="application/json")
  table2<-jsonInfoImg$values
  df <- bind_rows(table2)
  df <- as.data.frame.table(table2)
  df <- df %>% rename(Year = names(.), Value = .)
  df<-as.data.frame(df)
  rownames(df) <- names(table2)
  return(df)
}



