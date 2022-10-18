library(vroom)
library(tidyverse)

download.file(
  url = "https://drive.minsa.gob.pe/s/XJoxGPW2wBmkSAD/download",
  destfile = "data/defunciones.csv",
  method = 'curl')

ubern_db <- vroom("data/defunciones.csv") %>%
       rename(ANIO = AÑO)
saveRDS(
  ubern_db,
  file = paste0("data/","ubern_db.rds")
)

file.remove('data/defunciones.csv')
