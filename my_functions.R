################################################################
#          
#                Fichier fonctions 
#
##############################################################



###################################Fonction qui compare la distribution d'une variable en fonction d'une autre
summarize_by_group <- function(data, group_col, summary_col) {
  
  summary_data <- data %>%
    group_by(!!sym(group_col)) %>%  # Utilisation de !!sym pour passer le nom de la colonne dynamique
    summarise(
      Min = min(!!sym(summary_col), na.rm = TRUE),
      Q1 = quantile(!!sym(summary_col), 0.25, na.rm = TRUE),
      Median = median(!!sym(summary_col), na.rm = TRUE),
      Mean = mean(!!sym(summary_col), na.rm = TRUE),
      Q3 = quantile(!!sym(summary_col), 0.75, na.rm = TRUE),
      Max = max(!!sym(summary_col), na.rm = TRUE),
      NA_count = sum(is.na(!!sym(summary_col)))
    )
  
  return(summary_data)
}


###########################################Fonction qui calcule la différence de l'outcome en moyenne entre groupe de contrôle et groupe de traitement (a priori, ça fonctionne encore même si on est face à une pooled OLS) 
difference_moyenne_outcome <- function(data, outcome) {
  # Calculer la moyenne par groupe B_treat
  ybar <- data %>%
    group_by(B_treat) %>%
    summarise(mean = mean(!!sym(outcome), na.rm = TRUE))
  
  # Calculer la différence entre les moyennes pour B_treat == 1 et B_treat == 0
  diff_ybar <- filter(ybar, B_treat == 1)$mean - filter(ybar, B_treat == 0)$mean
  
  return(diff_ybar)
}



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

###############################################Fonction qui fait la première régression (Tableau 2); à modifier pour harmoniser

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










###################à supprimer
run_lm_robust_behaviour <- function(data, outcome) {
  ## Sélection de mes régresseurs
  # Je dois recréer mes "paquets de variables" : 
  # 1. 1e étape : convertir la commande * de stata
  # 2. 2e étape : recréer les macro du dofile sup_controls
  selected_columns1 <- names(select(data, starts_with("district_gender_")))
  selected_columns2 <- names(select(data, starts_with("gender_grade_")))
  el_behavior_common_flag <- c("E_Stalk_opp_gender_comm_flag", 
                               "E_Ssit_opp_gender_comm_flag", 
                               "E_Scook_clean_comm", 
                               "E_Sabsent_sch_hhwork_comm_flag", 
                               "E_Sdiscourage_college_comm_flag", 
                               "E_Sdiscourage_work_comm_flag")
  
  bl_behavior_common_flag <- c("B_Scook_clean_comm_flag", 
                               "B_Stalk_opp_gender_comm_flag")
  
  # Regroupe toutes les variables explicatives
  regressors <- c("B_treat", "B_Sbehavior_index2", "B_Sbehavior_index2_m", 
                  el_behavior_common_flag, selected_columns1, selected_columns2, bl_behavior_common_flag)
  
  # Créer la formule de régression dynamiquement
  formula <- as.formula(paste(outcome, "~", paste(regressors, collapse = " + ")))
  
  # Effectuer la régression avec lm()
  model <- lm(formula, data = data)
  
  # Calculer la matrice de variance-covariance clusterisée avec clubSandwich
  vcov_cluster <- vcovCL(model, cluster = ~Sschool_id, type = "HC1")  # Ou "HC2" / "HC3" pour correction plus forte
  
  # Appliquer la correction et afficher les résultats
  model_corrected <- coeftest(model, vcov = vcov_cluster)
  
  return(model_corrected)
}


########################"Pareil à modif
run_lm_robust_aspiration <- function(data, outcome) {
  ## Sélection de mes régresseurs
  # Je dois recréer mes "paquets de variables" : 
  # 1. 1e étape : convertir la commande * de stata
  # 2. 2e étape : recréer les macro du dofile sup_controls
  selected_columns1 <- names(select(data, starts_with("district_gender_")))
  selected_columns2 <- names(select(data, starts_with("gender_grade_")))
  el_behavior_common_flag <- c("E_Stalk_opp_gender_comm_flag", 
                               "E_Ssit_opp_gender_comm_flag", 
                               "E_Scook_clean_comm", 
                               "E_Sabsent_sch_hhwork_comm_flag", 
                               "E_Sdiscourage_college_comm_flag", 
                               "E_Sdiscourage_work_comm_flag")
  
  bl_behavior_common_flag <- c("B_Scook_clean_comm_flag", 
                               "B_Stalk_opp_gender_comm_flag")
  
  # Regroupe toutes les variables explicatives
  regressors <- c("B_treat", "B_Sbehavior_index2", "B_Sbehavior_index2_m", 
                  el_behavior_common_flag, selected_columns1, selected_columns2, bl_behavior_common_flag)
  
  # Créer la formule de régression dynamiquement
  formula <- as.formula(paste(outcome, "~", paste(regressors, collapse = " + ")))
  
  # Effectuer la régression avec lm()
  model <- lm(formula, data = data)
  
  # Calculer la matrice de variance-covariance clusterisée avec clubSandwich
  vcov_cluster <- vcovCL(model, cluster = ~Sschool_id, type = "HC1")  # Ou "HC2" / "HC3" pour correction plus forte
  
  # Appliquer la correction et afficher les résultats
  model_corrected <- coeftest(model, vcov = vcov_cluster)
  
  return(model_corrected)
}