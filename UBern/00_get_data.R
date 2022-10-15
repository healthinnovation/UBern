library(purrr)
library(dplyr)
library(vroom)

download.file(
  url = "https://drive.minsa.gob.pe/s/XJoxGPW2wBmkSAD/download",
  destfile = "UBern/data/defunciones.csv",
  method = 'curl'
  )
  
defunciones <- read.csv("UBern/data/defunciones.csv",sep = "|")

names(defunciones) <- c(
  "ID","TIPO_SEGURO","SEXO","EDAD","TIEMPO_EDAD",
  "ESTADO_CIVIL","NIVEL_DE_INSTRUCCION","ETNIA",
  "UBIGEO","PAIS","DEPARTAMENTO","PROVINCIA",
  "DISTRITO","FECHA","ANIO","MES","TIPO_LUGAR",
  "INSTITUCION","MUERTE_VIOLENTA","NECROPSIA",
  "DEBIDO_A.CAUSA_A","CAUSA_A.CIE_X","DEBIDO_A.CAUSA_B",
  "CAUSA_B.CIE_X","DEBIDO_A.CAUSA_C","CAUSA_C.CIE_X",
  "DEBIDO_A.CAUSA_D","CAUSA_D.CIE_X","DEBIDO_A.CAUSA_E",
  "CAUSA_E.CIE_X","DEBIDO_A.CAUSA_F","CAUSA_F.CIE_X"
  )

study_area <- c(
    "MADRE DE DIOS ","UCAYALI","JUNIN","HUANCAVELICA",
    "ICA","AYACUCHO","APURIMAC","CUSCO","PASCO","AREQUIPA",
    "PUNO")

ubern_db <- defunciones %>%
  filter(DEPARTAMENTO %in% study_area)

saveRDS(
  ubern_db,
  file = paste0("UBern/data/","ubern_db.rds")
)
rm(defunciones)
file.remove('UBern/data/defunciones.csv')