# Aquileo Gonzalez de Leon 10/11/2022


# Unir bases de datos

library(readr)
library(readxl)
library(dplyr)
library(tidyverse)
library(purrr)

setwd("C:/Users/aquileo/OneDrive - Zamorano/Documents/Analisis de datos FONTAGRO/DATOS FECHAS SEPARADAS/DATOS FECHA SEPARADA_COLOMBIA")

#identificacion de documentos

files = list.files(pattern = "*.csv")

#Union files

Nicaragua = lapply(files, read.csv) %>% bind_rows()

head(Nicaragua)
View(Honduras)
files

#incluir proveniencia del archivo

merged_df <- list.files(pattern = "*.csv") %>% #full.names = TRUE
  set_names()%>%
  map_dfr(read.csv, .id = "file_name")

#Guardar base datos

write_csv(Nicaragua, "Datos_Nicaragua_exportados.csv")


Base_datos_Colombia <- read.csv("Datos_Colombia_exportados.csv")


diario_Colombia = aggregate (SW10 ~ Factor , data = Base_datos_Colombia , FUN = mean)

write_csv(diario_Colombia, "Datos_Colombia2_promedio dia.csv")
  