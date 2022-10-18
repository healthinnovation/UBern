library(tidyverse)

original_db <- read_rds("data/original_db.rds")
new_names <- names(original_db) %>% 
  gsub("Ñ","N",.) %>% 
  gsub("[^a-zA-Z]"," ",.) %>% 
  gsub(" ","", .)

names(original_db) <- new_names

study_area <- c(
  "MADRE DE DIOS ","UCAYALI","JUNIN","HUANCAVELICA",
  "ICA","AYACUCHO","APURIMAC","CUSCO","PASCO","AREQUIPA",
  "PUNO")

ubern <- original_db %>% 
  drop_na(DEPARTAMENTODOMICILIO) %>% 
  filter(DEPARTAMENTODOMICILIO %in% study_area)

saveRDS(
  ubern,
  file = paste0("data/ubern-",Sys.Date(),".rds")
)
# write_csv(data,paste0("UBern",Sys.Date(),".csv"))