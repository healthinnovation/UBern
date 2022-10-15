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

new_names <- gsub(" ","",gsub("[^a-zA-Z]"," ",gsub("Ñ","N",names(defunciones))))
names(defunciones) <- new_names
index <- which(!is.na(defunciones$DEPARTAMENTODOMICILIO))
defunciones <- defunciones[index,]
study_area <- c(
    "MADRE DE DIOS ","UCAYALI","JUNIN","HUANCAVELICA",
    "ICA","AYACUCHO","APURIMAC","CUSCO","PASCO","AREQUIPA",
    "PUNO")

ubern_db <- filter(
  defunciones,
  DEPARTAMENTODOMICILIO %in% study_area
  )

saveRDS(
  ubern_db,
  file = paste0("UBern/data/","ubern_db.rds")
)

file.remove('UBern/data/defunciones.csv')
