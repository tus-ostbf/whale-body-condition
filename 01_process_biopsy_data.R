# Process biopsy data for whale body condition analysis
# This script loads raw biopsy data, calculates total lipid content,
# and prepares a cleaned dataset for modeling.

library(tidyverse)

# Load raw data
raw_data <- read_csv("data/raw_biopsy_data.csv")

# Calculate total lipid as sum of all fatty acids
processed_data <- raw_data %>%
  mutate(
    total_lipid = rowSums(across(starts_with("FA_"))),
    # Add other derived variables as needed
    lipid_percent = total_lipid / blubber_mass * 100,
    # Calculate DHA/EPA ratio as a biomarker of recent foraging quality
    dha_epa_ratio = FA_DHA / FA_EPA
  )

# Save processed data
write_csv(processed_data, "data/processed_biopsy_data.csv")

cat("Data processing complete. Processed data saved to data/processed_biopsy_data.csv\n")