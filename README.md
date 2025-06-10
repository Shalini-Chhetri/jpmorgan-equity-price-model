# Predicting JPMorgan Chase Equity Price (2000–2022)

**Statistical Modeling in R | Multivariate Regression | Time-Series Analysis**

This project presents a statistical model to predict the equity price of JPMorgan Chase & Co. using annual financial indicators. The analysis spans from 2000 to 2022 and is developed using R programming with packages from the tidyverse and financial modeling libraries. The model explores the impact of Earnings Per Share (EPS), Book Value Per Share (BVPS), and Observation Index (OBS) on share price using regression and time-series visualizations.

---

## Project Objective

To identify and quantify the key financial drivers that influence JPMorgan Chase & Co.'s stock price, using multivariate regression modeling on time-series financial data.

---

## Tools and Technologies Used

- R programming language
- R packages: dplyr, ggplot2, tidyverse, readxl, moments, broom, quantmod, robustbase
- Statistical techniques:
  - Histogram analysis
  - Time-series plotting
  - Correlation matrix
  - Multivariate regression analysis
  - Residual diagnostics

---

## Methodology

- **Data source**: Annual financial data for JPMorgan Chase & Co. (2000–2022)
- **Variables**:
  - Price: Share price (dependent variable)
  - EPS: Earnings per share
  - BVPS: Book value per share
  - OBS: Observation index (1 to 23)
- **Model**:
  - Regression Equation:  
    `Price = -32.23 + 3.54 * EPS + 3.17 * BVPS - 8.64 * OBS`
  - R-squared = 0.93 (93% of variation in price explained by the model)

---

## Key Findings

- BVPS and EPS have strong positive correlations with stock price.
- OBS shows less significance in earlier years but a stronger positive relationship in later observations.
- BVPS is the most statistically significant predictor of equity price.
- Model diagnostics indicate good fit: residuals centered around zero, high R-squared, and statistically significant F-statistic.

---

## Visualizations Included

- Histograms for each variable
- Time-series plots for Price, EPS, and BVPS
- Scatterplots showing relationships between variables
- Residual plots: histogram, fitted values, and time-series comparison

---

## Repository Contents

- `Chhetri_JPMorganChase.pdf` – Full project report with results and analysis
- `README.md` – This documentation file

Note: The R script and datasets used are part of academic coursework and are not included here to maintain data integrity and confidentiality.

---

## License and Usage

This project is shared for portfolio and demonstration purposes only.  
Please do not copy, reuse, or distribute any part of this work without explicit permission.

---

## About

**Shalini Chhetri**  
MS in Business Analytics  
The Tobin College of Business, St John's University
Queens, NY

