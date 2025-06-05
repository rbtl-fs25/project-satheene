library(tidyverse)
library(ggplot2)

data_raw <- read.csv("docs/data/raw/data_raw_survey.csv")

data_imported_cleaned <- data_raw %>%
  rename(
    degree_program = Which.degree.program.are.you.currently.in.,
    degree_level = What.level.of.degree.are.you.currently.in.,
    housing_type = Do.you.live.in...,
    household_size = How.many.people.live.in.your.household...Please.input.a.numerical.answer.,
    stays_during_exams = Do.you.usually.stay.in.Zurich.during.Study.Exam.Season.,
    separates_waste = Are.you.currently.separating.your.waste...e.g..compost..plastic..metal..paper.,
    separated_materials = What.do.you.separate.,
    separation_confidence = How.confident.are.you.that.you.are.currently.separating.waste.correctly.,
    recyclables_location = Where.do.you.dispose.of.recyclables.,
    changes_during_exams = Do.your.waste.separation.habits.change.during.exam.season.,
    how_changes = How.do.they.change.,
    reason_for_change = What.is.the.biggest.reason.for.this.change.,
    effort_during_exams = How.much.effort.do.you.input.into.waste.separtion.during.the.exam.study.session.,
    best_incentives = Which.incentives.would.be.most.effective.for.you,
    incentive_timing = When.would.these.incentives.be.most.effective.in.your.opinion.,
    min_incentive = What.minimum.incentive.would.make.you.change.your.behavior,
    helpful_factors = What.would.help.you.separate.better.during.exams.,
    support_eth = Would.you.support.ETH.implementing.an.incentive.program.for.recycling.
  ) %>%
  mutate(id = row_number())

  
data_split <- data_imported_cleaned %>% 
  mutate(separated_materials = str_split(separated_materials, ",\\s*")) %>%
  unnest(separated_materials) %>%
  mutate(separated_materials = str_trim(separated_materials)) %>%
  mutate(value = 1) %>%
  pivot_wider(
    names_from = separated_materials,
    values_from = value,
    values_fill = 0
  )

data_cleaned <- data_split %>% 
  mutate(median = median(separation_confidence)) %>% 
  col_types = cols(
    Timestamp = col_datetime(format = ""),
    degree_program = col_character(),
    degree_level = col_character(),
    housing_type = col_character(),
    household_size = col_double(),
    stays_during_exams = col_character(),
    separates_waste = col_character(),
    separated_materials = col_character(),
    separation_confidence = col_double(),
    recyclables_location = col_character(),
    changes_during_exams = col_character(),
    how_changes = col_character(),
    reason_for_change = col_character(),
    effort_during_exams = col_double(),
    best_incentives = col_character(),
    incentive_timing = col_character(),
    min_incentive = col_character(),
    helpful_factors = col_logical(),
    support_eth = col_character(),
    id = col_double(),
    Paper = col_logical(),
    Plastic = col_logical(),
    Glass = col_logical(),
    Metal = col_logical(),
    Organic = col_logical()
  )


write_csv(data_split, "docs/data/processed/cleaned_data.csv")

data_clean <- read_csv("docs/data/processed/cleaned_data.csv",
                       col_types = cols(
                         Timestamp = col_datetime(format = ""),
                         degree_program = col_character(),
                         degree_level = col_character(),
                         housing_type = col_character(),
                         household_size = col_double(),
                         stays_during_exams = col_character(),
                         separates_waste = col_character(),
                         separation_confidence = col_double(),
                         recyclables_location = col_character(),
                         changes_during_exams = col_character(),
                         how_changes = col_character(),
                         reason_for_change = col_character(),
                         effort_during_exams = col_double(),
                         best_incentives = col_character(),
                         incentive_timing = col_character(),
                         min_incentive = col_character(),
                         helpful_factors = col_logical(),
                         support_eth = col_character(),
                         id = col_double(),
                         Paper = col_logical(),
                         Plastic = col_logical(),
                         Glass = col_logical(),
                         "Metal (such as Alu)"= col_logical(),
                         "Organic/Compost" = col_logical()
                       ),
                       show_col_types = FALSE
)

data_filtered_final <- data_clean %>% 
  filter( household_size <= 15 & household_size >= 0) %>% 
  summarise('Students reporting behavioral change (exam vs. non-exam)' = mean(changes_during_exams == TRUE, na.rm = TRUE) * 100)

write_csv(data_filtered_final, "docs/data/processed/cleaned_data_2.csv")

