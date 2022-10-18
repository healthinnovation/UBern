library(tidyverse)
library(vroom)

download.file(
  url = "https://drive.minsa.gob.pe/s/XJoxGPW2wBmkSAD/download",
  destfile = "./data/defunciones.csv",
  method = 'curl'
  )

defunciones <- vroom(
  "./data/defunciones.csv",
  show_col_types = FALSE)

saveRDS(
  ubers,
  file = "./data/ubers.rds"
)

file.remove('./data/defunciones.csv')
