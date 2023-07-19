get_data<-function(serie, begin, end){
  if(!require("tidyverse")) install.packages("tidyverse")
  if(!require("jsonlite")) install.packages("jsonlite")
  if(!require("httr")) install.packages("httr")
  require(jsonlite)
  require(httr)
  json<-httr::GET(str_interp('https://dataimesc.imesc.ma.gov.br/getData?id=${serie}&scope=4&from=${begin}&to=${end}'), accept_json())
  jsonInfoImg <- content(json, type="application/json")
  table_json<-as.data.frame(unlist(jsonInfoImg['values']))
  return(table_json)
}



