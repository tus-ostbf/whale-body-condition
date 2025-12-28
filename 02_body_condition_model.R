# Body condition model for humpback whales
# This script fits a linear model to estimate body condition index (BCI)
# based on lipid biomarkers.

library(tidyverse)

# Load processed data
processed_data <- read_csv("data/processed_biopsy_data.csv")

# Fit linear model with total lipid and DHA/EPA ratio as predictors
model <- lm(BCI ~ total_lipid + dha_epa_ratio, data = processed_data)

# Summarize model
summary(model)

# Save model object for later use
saveRDS(model, "outputs/body_condition_model.rds")

cat("Model fitting complete. Summary printed above.\n")
cat("Model saved to outputs/body_condition_model.rds\n")