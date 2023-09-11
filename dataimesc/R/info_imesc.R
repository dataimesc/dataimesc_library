info_imesc<-function(serie){
  if(!require("httr")) install.packages("httr")
  require(httr)
  json<-httr::GET(str_interp('https://dataimesc.imesc.ma.gov.br/getDetailsIndicators?id=${serie}'), accept_json())
  jsonInfoImg <- content(json, type="application/json")
  return(jsonInfoImg)
}
