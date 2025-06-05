library(tidyverse)
library(ggplot2)

data_visualizations <- read_csv("docs/data/processed/cleaned_data.csv",
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
  ),
  show_col_types = FALSE
)

ggplot(data_visualizations, aes(x = separates_waste)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Do students separate their waste?",
       x = "Separates waste?",
       y = "Number of students") +
  theme_minimal()
#gives us a bar plot showing how many people separate their waste and how many dont

ggplot(data_imported_cleaned, aes(x = changes_during_exams, fill = separates_waste)) +
  geom_bar(position = "dodge") +
  labs(title = "Changes in waste separation during exams",
       x = "Does behavior change during exams?",
       y = "Count",
       fill = "Separates waste") +
  theme_minimal()


ggplot(data_imported_cleaned, aes(x = separation_confidence)) +
  geom_histogram(binwidth = 1, fill = "darkgreen", color = "white") +
  labs(title = "Confidence in Correct Waste Separation",
       x = "Confidence level (1–10)",
       y = "Count") +
  theme_minimal()

ggplot(data_imported_cleaned, aes(x = best_incentives)) +
  geom_bar(fill = "coral") +
  labs(title = "Preferred Incentives for Waste Separation",
       x = "Incentive type",
       y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(data_cleaned, aes(x = best_incentives, fill = min_incentive)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Preferred Incentive Types by Minimum Incentive Threshold",
    x = "Incentive Type",
    y = "Number of Students",
    fill = "Minimum Incentive"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))
#The amount of minimum incentive chosen by which one o the top two incentives would have been chosen

ggplot(data_cleaned, aes(x = min_incentive)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Minimum Economic Incentive Required to Change Waste Behavior",
    x = "Minimum Incentive",
    y = "Number of Students"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))

ggplot(data_cleaned, aes(x = min_incentive, fill = support_eth)) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = scales::percent) +
  labs(
    title = "Support for ETH Incentive Programs by Reward Threshold",
    x = "Minimum Incentive",
    y = "Proportion of Respondents",
    fill = "Support ETH Program?"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))

ggplot(data_cleaned, aes(x = best_incentives, fill = incentive_timing)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Preferred Incentives by Timing",
    x = "Incentive Type",
    y = "Count",
    fill = "When Most Effective"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))
#Shows Effectiveness grouped by different incentive used. This can be used to monitore and set up a possible component analysis or how to proceed.

# Reorder levels for cleaner plotting (optional)
data_cleaned$separation_confidence <- factor(
  data_cleaned$separation_confidence,
  levels = c("1", "2", "3", "4", "5"),
  ordered = TRUE
)

# Calculate median
median_conf <- median(data_imported_cleaned$separation_confidence, na.rm = TRUE)

# Plot with named median line
ggplot(data_imported_cleaned, aes(x = factor(separation_confidence))) +
  geom_bar(fill = "steelblue") +
  geom_vline(aes(xintercept = median_conf, color = "Median"), linetype = "dashed", size = 1) +
  scale_color_manual(name = "", values = c("Median" = "red")) +
  labs(
    title = "Self-Reported Recycling Confidence",
    x = "Confidence Level (1 = Low, 5 = High)",
    y = "Number of Students"
  ) +
  theme_minimal() +
  theme(legend.position = "right",
        plot.title = element_text(hjust = 0.5))  # Optional: move legend to top




