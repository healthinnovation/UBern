library(vroom)
library(tidyverse)

download.file(
  url = "https://drive.minsa.gob.pe/s/XJoxGPW2wBmkSAD/download",
  destfile = "data/defunciones.csv",
  method = 'curl')

ubern_db <- vroom("data/defunciones.csv")
new_names <- names(ubern_db) %>% 
  gsub("Ñ","N",.) %>% 
  gsub("[^a-zA-Z]"," ",.) %>% 
  gsub(" ","", .)

names(ubern_db) <- new_names
final_data <- ubern_db
saveRDS(
  final_data,
  file = paste0("data/","ubern_db.rds")
)

file.remove('data/defunciones.csv')
