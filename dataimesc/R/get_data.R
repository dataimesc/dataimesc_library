get_data<-function(serie, begin="2000", end="2025", geo="City",geo.filter="None"){
  if(!require("tidyverse")) install.packages("tidyverse")
  if(!require("jsonlite")) install.packages("jsonlite")
  if(!require("httr")) install.packages("httr")
  if(!require("dplyr")) install.packages("dplyr")
  if(!require("purrr")) install.packages("purrr")
  require(jsonlite)
  library(dplyr)
  library(purrr)
  require(httr)
  if(geo=="City"){city<-"4"}
  else if(geo=="States"){city<-"3"}
  else if(geo=="Region"){city<-"2"}
  else if(geo=="Brazil"){city<-"1"}
  json<-httr::GET(str_interp('https://dataimesc.imesc.ma.gov.br/getData?id=${serie}&scope=${city}&from=${begin}&to=${end}'), accept_json())
  jsonInfoImg <- content(json, type="application/json")
  table2<-jsonInfoImg['values']
  table3<-table2$values
  df <- as.data.frame(bind_rows(table3))
  rownames(df) <- names(table3)
  if(geo.filter!="None"){
    df2<- (df[geo.filter,])
    df2<- replace(df2, is.na(df2), "No values")
    return(df2)
    }
  return(df)
}
