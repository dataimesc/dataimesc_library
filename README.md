# dataimesc_library

O package DataImesc no R permite acessar e manipular os dados do repositório de dados do IMESC de maneira simples e ágil por meio do R ou do RStudio.

A sintaxe para fazer a requisição dos dados é a seguinte.

library(devtools)

install_github("dataimesc/dataimesc_library/dataimesc")

require(dataimesc)

#a função get_data recebe 3 parâmetros get_data(numero_da_serie,ano_inicial,ano_final)

table<-get_data(serie=100,begin=2015,end=2019)

print(table)

O resultado será semelhante ao seguinte.

![image](https://github.com/dataimesc/dataimesc_library/assets/137085586/d12dc785-0f0a-4fb3-8972-88e6deda115b)

