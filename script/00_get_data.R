library(vroom)
library(tidyverse)

download.file(
  url = "https://drive.minsa.gob.pe/s/XJoxGPW2wBmkSAD/download",
  destfile = "data/defunciones.csv",
  method = 'curl'
  )

original_db <- vroom("data/defunciones.csv")

saveRDS(
  original_db,
  file = paste0("data/","original_db.rds")
  )

file.remove('data/defunciones.csv')
