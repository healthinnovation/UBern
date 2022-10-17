library(purrr)
library(dplyr)
library(vroom)

download.file(
  url = "https://drive.minsa.gob.pe/s/XJoxGPW2wBmkSAD/download",
  destfile = "data/defunciones.csv",
  method = 'curl'
)

defunciones <- vroom("data/defunciones.csv")
names_defunciones <- c(
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
names(defunciones) <- names_defunciones 
study_area <- c(
    "MADRE DE DIOS ","UCAYALI","JUNIN","HUANCAVELICA",
    "ICA","AYACUCHO","APURIMAC","CUSCO","PASCO","AREQUIPA",
    "PUNO")

ubern_db <- defunciones %>%
  filter(DEPARTAMENTO %in% study_area)

saveRDS(
  ubern_db,
  file = paste0("data/","ubern_db.rds")
)

file.remove('data/defunciones.csv')
