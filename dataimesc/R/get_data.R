get_data<-function(number, year_i,year_f){
  if(!require("tidyverse")) install.packages("tidyverse")
  if(!require("jsonlite")) install.packages("jsonlite")
  if(!require("httr")) install.packages("httr")
  require(jsonlite)
  require(httr)
  x<-httr::GET(str_interp('https://dataimesc.imesc.ma.gov.br/getData?id=${number}&scope=4&from=${year_i}&to=${year_f}'), accept_json())
  jsonInfoImg <- content(x, type="application/json")
  table<-as.matrix(unlist(jsonInfoImg['values']))
  return(jsonInfoImg['values'])
}



