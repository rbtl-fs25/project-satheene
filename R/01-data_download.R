library(tidyverse)
library(googlesheets4)

data_survey_raw <- read_sheet("https://docs.google.com/spreadsheets/d/1rMYHboIyDNtRs2hTklsqiASm0Dzan4JDel6BfTkZdRw/edit?resourcekey=&gid=176152037#gid=176152037")

data_survey_raw_na <- data_survey_raw %>% 
  mutate(across(where(is.numeric), ~ replace_na(., 0)))


write_csv(data_survey_raw, "data/raw/data_raw_survey.csv")
  

