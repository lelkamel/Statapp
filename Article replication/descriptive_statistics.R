library(haven)     # For reading Stata files
library(dplyr)     # For data manipulation
library(estimatr)  # For robust regression
library(stats) 
library("here")

#Load the data
location = here("C:/Users/adminLocal/OneDrive - GENES/Bureau/ENSAE/cours/S1/Econométrie/chapitre 4/TD7")  
nsw = paste(location, '/nsw.dta', sep = "")
data = read_stata(nsw)