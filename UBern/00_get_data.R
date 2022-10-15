library(purrr)
library(dplyr)
library(vroom)

download.file(
  url = "https://drive.minsa.gob.pe/s/XJoxGPW2wBmkSAD/download",
  destfile = "UBern/data/defunciones.csv",
  method = 'curl'
  )
  
defunciones <- vroom("UBern/data/defunciones.csv")

study_area <- c(
    "MADRE DE DIOS ","UCAYALI","JUNIN","HUANCAVELICA",
    "ICA","AYACUCHO","APURIMAC","CUSCO","PASCO","AREQUIPA",
    "PUNO")

ubern_db <- defunciones %>%
  dplyr::filter(`DEPARTAMENTO DOMICILIO` %in% study_area)

saveRDS(
  ubern_db,
  file = paste0("UBern/data/","ubern_db.rds")
)
rm(defunciones)
file.remove('UBern/data/defunciones.csv')