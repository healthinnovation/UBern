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

saveRDS(
  defunciones,
  file = paste0("UBern/data/","ubern_db.rds")
)

file.remove('UBern/data/defunciones.csv')