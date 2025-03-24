################################################################
#          
#                Fichier fonctions 
#
##############################################################


#####################################Fonction qui appelle les macros
macros_stata <-function(category_name){
# Définir le chemin du fichier CSV en fonction du nom de la catégorie
# Remplacer "chemin/vers/ton/fichier/" par le chemin de base du dossier où se trouvent tes fichiers CSV
base_path <- "C:/Users/lynae/OneDrive - GENES/Bureau/ENSAE/statapp/Base de donnée/Main Analysis and Paper/Analysis data"
file_name <- paste0(category_name, ".csv")  # Créer le nom du fichier en fonction de la catégorie
file_path <- file.path(base_path, file_name)  # Créer le chemin complet

# Vérifier si le fichier existe
if (!file.exists(file_path)) {
  stop(paste("Le fichier", category_name, "n'existe pas !"))
}

# Charger bl_gender_flag depuis le fichier CSV
category_name_data <- read.csv(file_path)
category_name_flag <- names(category_name_data)  # Extraire les noms des colonnes
return(category_name_flag)  # Retourner le résultat
}

###############################################Fonction qui fait la première régression (Tableau 2)

run_lm_robust <- function(data, outcome, flag) {
  
  
  ## Sélection des autres régresseurs
  selected_columns1 <- names(select(data, starts_with("district_gender_")))
  selected_columns2 <- names(select(data, starts_with("gender_grade_")))
  
  ##Sélection des flags
  flag_columns <- c()
  
  # Boucle pour appliquer macros_stata() à chaque élément de flag
  for (f in flag) {
    flag_columns <- c(flag_columns, macros_stata(f))
  }
  
  # Regroupe toutes les variables explicatives
  regressors <- c("B_treat", "B_Sgender_index2", "B_Sgender_index2_m", 
                  flag_columns, selected_columns1, selected_columns2) 
  
  # Créer la formule de régression dynamiquement
  formula <- as.formula(paste(outcome, "~", paste(regressors, collapse = " + ")))
  
  # Effectuer la régression avec lm()
  model <- lm(formula, data = data)
  
  # Calculer la matrice de variance-covariance clusterisée avec clubSandwich
  vcov_cluster <- vcovCL(model, cluster = ~Sschool_id, type = "HC1")  # Ou "HC2" / "HC3"
  
  # Appliquer la correction et afficher les résultats
  model_corrected <- coeftest(model, vcov = vcov_cluster)
  
  return(model_corrected)
}



###############################################Fonction qui fait la régression avec interaction (Tableau 4)
run_lm_robust_girls <- function(data, outcome, flag) {
  
  
  ## Sélection des autres régresseurs
  selected_columns1 <- names(select(data, starts_with("district_gender_")))
  selected_columns2 <- names(select(data, starts_with("gender_grade_")))
  
  ##Sélection des flags
  flag_columns <- c()
  
  # Boucle pour appliquer macros_stata() à chaque élément de flag
  for (f in flag) {
    flag_columns <- c(flag_columns, macros_stata(f))
  }
  
  # Regroupe toutes les variables explicatives
  regressors <- c("B_treat", "B_Sgender_index2", "B_Sgender_index2_m", 
                  flag_columns, selected_columns1, selected_columns2,"B_Sgirl * B_treat", 
                  paste0("B_Sgirl * ", flag_columns) ) 
  
  # Créer la formule de régression dynamiquement
  formula <- as.formula(paste(outcome, "~", paste(regressors, collapse = " + ")))
  
  # Effectuer la régression avec lm()
  model <- lm(formula, data = data)
  
  # Calculer la matrice de variance-covariance clusterisée avec clubSandwich
  vcov_cluster <- vcovCL(model, cluster = ~Sschool_id, type = "HC1")  # Ou "HC2" / "HC3"
  
  # Appliquer la correction et afficher les résultats
  model_corrected <- coeftest(model, vcov = vcov_cluster)
  
  return(model_corrected)
}





