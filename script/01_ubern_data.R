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

ubers <- original_db %>% 
  drop_na(DEPARTAMENTODOMICILIO) %>% 
  filter(DEPARTAMENTODOMICILIO %in% study_area)

saveRDS(
  ubers,
  file = paste0("data/ubers-",Sys.Date(),".rds")
)
