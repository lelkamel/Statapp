library(haven)     # For reading Stata files
library(dplyr)     # For data manipulation
library(estimatr)  # For robust regression
library(stats) 
library("here")

#Load the data
#install.packages("aws.s3", repos = "https://cloud.R-project.org")

Sys.setenv("AWS_ACCESS_KEY_ID" = "28VX6LRM7P6SO4Q2QAY1",
           "AWS_SECRET_ACCESS_KEY" = "E6LtlNN9FE9nuVZtFu4xhMmvC+IkYNzL2jhvgd9t",
           "AWS_DEFAULT_REGION" = "us-east-1",
           "AWS_SESSION_TOKEN" = "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NLZXkiOiIyOFZYNkxSTTdQNlNPNFEyUUFZMSIsImFsbG93ZWQtb3JpZ2lucyI6WyIqIl0sImF1ZCI6WyJtaW5pby1kYXRhbm9kZSIsIm9ueXhpYSIsImFjY291bnQiXSwiYXV0aF90aW1lIjoxNzM1NTgwODQ3LCJhenAiOiJvbnl4aWEiLCJlbWFpbCI6Imx5bmEuZWxrYW1lbEBlbnNhZS5mciIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJleHAiOjE3MzYxODYxMjQsImZhbWlseV9uYW1lIjoiRUwgS0FNRUwiLCJnaXZlbl9uYW1lIjoiTHluYSIsImdyb3VwcyI6WyJVU0VSX09OWVhJQSJdLCJpYXQiOjE3MzU1ODEzMjQsImlzcyI6Imh0dHBzOi8vYXV0aC5sYWIuc3NwY2xvdWQuZnIvYXV0aC9yZWFsbXMvc3NwY2xvdWQiLCJqdGkiOiJiZDE5ZDAwYi0wZDQyLTRkMzgtOTlmNi0yNjdjYWJkNjBmOGIiLCJuYW1lIjoiTHluYSBFTCBLQU1FTCIsInBvbGljeSI6InN0c29ubHkiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJsZWxrYW1lbCIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1zc3BjbG91ZCJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInJvbGVzIjpbIm9mZmxpbmVfYWNjZXNzIiwidW1hX2F1dGhvcml6YXRpb24iLCJkZWZhdWx0LXJvbGVzLXNzcGNsb3VkIl0sInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZ3JvdXBzIGVtYWlsIiwic2lkIjoiOWE3YTc1ODUtMTRjYy00NGIzLWI3ZGEtOWEzYmRiMDlkNzA2Iiwic3ViIjoiYzY1OGNjOWQtNWU0YS00MzA5LWI0ZDYtOTVhNDk3ZGM0Mzg3IiwidHlwIjoiQmVhcmVyIn0.GIgKytu5tVkUlLyUcfRZzHPcIH3sdvar2JpgxoXmTq4LQdMwuNrK_0lCSMLxlbUWsTA0mspfstQdWjqSg-IORw",
           "AWS_S3_ENDPOINT"= "minio.lab.sspcloud.fr")

library("aws.s3")
#bucketlist(region="")

school <- 
  aws.s3::s3read_using(
    FUN = haven::read_stata,
    object = "/baseline_school_cleaned.dta",
    bucket = "lelkamel",
    opts = list("region" = "")
  )

students <- 
  aws.s3::s3read_using(
    FUN = haven::read_stata,
    object = "/baseline_student_raw.dta",
    bucket = "lelkamel",
    opts = list("region" = "")
  )

library(sf)
fichier_mystère<- aws.s3::s3read_using(
  FUN = sf::st_read,
  object = "/2011_Dist.shp",
  bucket = "lelkamel",
  opts = list("region" = "")
)



#Nettoyage de la variable schools ----
schools_copy <- school %>%
  select(`id`, `treat`, `urban`, `coed_status`, `distance_hq`, `Total_Student`, `Total_Boys`, `Total_Girls`, `q9_sanc_teachr`, `q11_male_teachr`, `q11_female_teachr`, 
         `q15_6th_male`, `q15_6th_female`, `q15_7th_male`, `q15_7th_female`)

schools_copy <- schools_copy %>%
 rename(
   Number_of_fulltime_teachers = `q9_sanc_teachr`,
  Number_of_male_teachers = `q11_male_teachr`,
  Number_of_female_teachers = `q11_female_teachr` 
 )

schools_copy <- schools_copy %>%
  mutate(
    Number_of_teachers = Number_of_male_teachers + Number_of_female_teachers,
    Males_in_grades_6_and_7 = `q15_6th_male`+ `q15_7th_male`,
    Females_in_grades_6_and_7 = `q15_6th_female`+  `q15_7th_female`,
    )


########################################## TABLE 1 : PARTIE ECOLES
summary(schools_copy)

schools_copy %>% 
  group_by(treat, urban) %>%
  summarise(
    total_students = sum(num_students),
    total_schools = n_distinct(school_id),
    .groups = "drop"
  ) %>%
  pivot_wider(names_from = school_type, values_from = c(total_students, total_schools)) 

# Afficher le tableau
print(tableau)