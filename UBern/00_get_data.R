library(magrittr)
library(dplyr)
library(vroom)

download.file(
  url = "https://drive.minsa.gob.pe/s/XJoxGPW2wBmkSAD/download",
  destfile = "UBern/data/defunciones.csv",
  method = 'curl'
  )
  
defunciones <- vroom(
  "UBern/data/defunciones.csv",
  show_col_types = FALSE
  )

new_names <- names(defunciones) %>% 
  gsub("Ñ","N",.) %>% 
  gsub("[^a-zA-Z]"," ",.) %>% 
  gsub(" ","", .)

names(defunciones) <- new_names
study_area <- c(
    "MADRE DE DIOS ","UCAYALI","JUNIN","HUANCAVELICA",
    "ICA","AYACUCHO","APURIMAC","CUSCO","PASCO","AREQUIPA",
    "PUNO")

ubern_db <- defunciones %>%
  filter(DEPARTAMENTODOMICILIO %in% study_area)

saveRDS(
  ubern_db,
  file = paste0("UBern/data/","ubern_db.rds")
)

file.remove('UBern/data/defunciones.csv')
