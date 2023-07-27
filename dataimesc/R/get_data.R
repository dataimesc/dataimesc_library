get_data<-function(serie, begin, end){
  print('começou')
  if(!require("tidyverse")) install.packages("tidyverse")
  if(!require("jsonlite")) install.packages("jsonlite")
  if(!require("httr")) install.packages("httr")
  if(!require("dplyr")) install.packages("dplyr")
  if(!require("purrr")) install.packages("purrr")
  require(jsonlite)
  library(dplyr)
  library(purrr)
  require(httr)
  json<-httr::GET(str_interp('https://dataimesc.imesc.ma.gov.br/getData?id=${serie}&scope=4&from=${begin}&to=${end}'), accept_json())
  jsonInfoImg <- content(json, type="application/json")
  table2<-jsonInfoImg$values
  df <- bind_rows(table2)
  df <- as.data.frame.table(df)
  df2<-as.data.frame(df)
  df <- df %>% rename(Year = names(.), Value = .)
  rownames(df2) <- names(table2)
  return(df2)
}



