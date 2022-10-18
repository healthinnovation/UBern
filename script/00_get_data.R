library(vroom)
library(tidyverse)

download.file(
  url = "https://drive.minsa.gob.pe/s/XJoxGPW2wBmkSAD/download",
  destfile = "data/defunciones.csv",
  method = 'curl')

<<<<<<< HEAD
ubern_db <- vroom("data/defunciones.csv")

=======
ubern_db <- vroom("data/defunciones.csv") %>%
       rename(ANIO = AÑO)
>>>>>>> master
saveRDS(
  ubern_db,
  file = paste0("data/","ubern_db.rds")
)

file.remove('data/defunciones.csv')
