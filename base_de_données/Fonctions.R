#########################################################################################################################
#                                                                                                                       #
#                       Toutes les fonctions utilisées dans ce projet, classées selon le répertoire associé             #  
#                                                                                                                       #
#########################################################################################################################



#################################### Récupérer les données ##############################################################


library(haven)     # For reading Stata files
library(dplyr)     # For data manipulation
library(estimatr)  # For robust regression
library(stats) 
library(here)


#une fonction qui appelle la base de données
# Création du chemin
fs = s3fs.S3FileSystem(client_kwargs={"endpoint_url": "https://minio.lab.sspcloud.fr"})
MY_BUCKET = "roux"
fs.ls(MY_BUCKET)
chemin = f"{MY_BUCKET}/base_final_v2.csv"

get_data <- function(dataframe) {
  location = here("/home/onyxia/work/Statapp/base_de_données") # Définir le chemin de base
  dataframe_path = paste(location, paste0("/", dataframe, ".dta"), sep = "")# Construire le chemin complet du fichier
  data = read_stata(dataframe_path) # Lire le fichier .dta
  return(data)# Retourner les données
}

