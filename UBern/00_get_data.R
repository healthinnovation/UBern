library(purrr)
library(dplyr)
library(vroom)

download.file(
  url = "https://drive.minsa.gob.pe/s/XJoxGPW2wBmkSAD/download",
  destfile = "UBern/data/defunciones.csv",
  method = 'curl'
  )
  
defunciones <-vroom("UBern/data/defunciones.csv") %>% 
  rename(
    TIPO_SEGURO = `TIPO SEGURO`,
    TIEMPO_EDAD = `TIEMPO EDAD`,
    ESTADO_CIVIL = `ESTADO CIVIL`,
    NIVEL_DE_INSTRUCCION = `NIVEL DE INSTRUCCIÓN`,
    UBIGEO = `COD# UBIGEO DOMICILIO`,
    PAIS = `PAIS DOMICILIO`,
    DEPARTAMENTO = `DEPARTAMENTO DOMICILIO`,
    PROVINCIA = `PROVINCIA DOMICILIO`,
    DISTRITO = `DISTRITO DOMICILIO`,
    ANIO = AÑO,
    TIPO_LUGAR = `TIPO LUGAR`,
    MUERTE_VIOLENTA = `MUERTE VIOLENTA`,
    DEBIDO_A.CAUSA_A = `DEBIDO A (CAUSA A)` ,
    CAUSA_A.CIE_X = `CAUSA A (CIE-X)`,
    DEBIDO_A.CAUSA_B = `DEBIDO A (CAUSA B)` ,
    CAUSA_B.CIE_X = `CAUSA B (CIE-X)`,
    DEBIDO_A.CAUSA_C = `DEBIDO A (CAUSA C)`,
    CAUSA_C.CIE_X = `CAUSA C (CIE-X)`,
    DEBIDO_A.CAUSA_D = `DEBIDO A (CAUSA D)`,
    CAUSA_D.CIE_X = `CAUSA D (CIE-X)`,
    DEBIDO_A.CAUSA_E = `DEBIDO A (CAUSA E)`,
    CAUSA_E.CIE_X = `CAUSA E (CIE-X)`,
    DEBIDO_A.CAUSA_F = `DEBIDO A (CAUSA F)`,
    CAUSA_F.CIE_X = `CAUSA F (CIE-X)`
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