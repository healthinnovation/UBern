library(dplyr)
library(vroom)

download.file(
  url = "https://drive.minsa.gob.pe/s/XJoxGPW2wBmkSAD/download",
  destfile = "./data/defunciones.csv",
  method = 'curl'
  )

ubers <- vroom("./data/defunciones.csv")

saveRDS(
  ubers,
  file = "./data/ubers.rds")
)

file.remove('./data/casos_positivos.csv')