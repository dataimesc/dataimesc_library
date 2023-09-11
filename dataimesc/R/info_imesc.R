info_imesc<-function(serie){
  if(!require("httr")) install.packages("httr")
  if(!require("tidyverse")) install.packages("tidyverse")
  require(httr)
  json<-httr::GET(str_interp('https://dataimesc.imesc.ma.gov.br/getDetailsIndicators?id=${serie}'), accept_json())
  jsonInfoImg <- content(json, type="application/json")
  return(cat(str_interp(' O número da série é ${serie}\n, o nome da série é: ${jsonInfoImg$name}\n, A unidade da série é ${jsonInfoImg$unity_name}\n  a Frequência da série é ${jsonInfoImg$frequency_name}')))
}
