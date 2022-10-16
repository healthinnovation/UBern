library(dplyr)
library(vroom)
library(tidyverse)
download.file(
  url = "https://drive.minsa.gob.pe/s/XJoxGPW2wBmkSAD/download",
  destfile = "./data/defunciones.csv",
  method = 'curl'
  )

defunciones <- vroom(
  "./data/defunciones.csv",
  show_col_types = FALSE)

new_names <- names(defunciones) %>% 
  gsub("Ñ","N",.) %>% 
  gsub("[^a-zA-Z]"," ",.) %>% 
  gsub(" ","", .)

names(defunciones) <- new_names
study_area <- c(
  "MADRE DE DIOS ","UCAYALI","JUNIN","HUANCAVELICA",
  "ICA","AYACUCHO","APURIMAC","CUSCO","PASCO","AREQUIPA",
  "PUNO")

ubers <- defunciones %>% 
  drop_na(DEPARTAMENTODOMICILIO) %>% 
  filter(DEPARTAMENTODOMICILIO %in% study_area)

saveRDS(
  ubers,
  file = "./data/ubers.rds"
)

file.remove('./data/defunciones.csv')