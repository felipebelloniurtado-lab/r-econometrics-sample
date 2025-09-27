# Infant Mortality Analysis - Sample Code
# Author: Felipe Belloni Urtado
# Purpose: Demonstration of econometric analysis in R

# Load libraries
library(tidyverse)
library(lmtest)
library(sandwich)

# Example dataset (substitute with real microdata in full project)
set.seed(123)
data <- data.frame(
  infant_mortality = rnorm(100, mean = 20, sd = 5),
  public_investment = rnorm(100, mean = 1000, sd = 300),
  socioeconomic_index = rnorm(100, mean = 50, sd = 10)
)

# Simple regression model
model <- lm(infant_mortality ~ public_investment + socioeconomic_index, data = data)

# Robust standard errors
coeftest(model, vcov = vcovHC(model, type = "HC1"))

# Plot relationship between investment and infant mortality
ggplot(data, aes(x = public_investment, y = infant_mortality)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Infant Mortality vs. Public Investment",
       x = "Public Investment (per capita)",
       y = "Infant Mortality Rate")
