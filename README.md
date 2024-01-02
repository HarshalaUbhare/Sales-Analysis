
# Walmart Sales Data Analysis

## Overview

This project focuses on the analysis of Walmart sales data using SQL queries. The dataset, `walmartsalesdata.csv`, is explored to gain insights into various aspects such as sales patterns, product performance, and revenue distribution across cities, branches, and product lines.

## Feature Engineering

### Time_of_Day
A new column named `Time_of_Day` is added to categorize sales transactions into Morning, Afternoon, and Evening.

### Day_of_Week
A new column named `Day_of_Week` is added to extract the days of the week on which transactions took place.

### Month_of_Year
A new column named `Month_of_Year` is added to extract the months of the year on which transactions occurred.

## Exploratory Data Analysis (EDA)

### Generic Questions

- How many unique cities does the data have?
- In which city is each branch located?

### Product Analysis

- How many unique product lines does the data have?
- What is the most common payment method?
- What is the most selling product line?

### Revenue Analysis

- What is the total revenue by month?
- What month had the largest COGS (Cost of Goods Sold)?
- What product line had the largest revenue?
- What is the city with the largest revenue?
- What product line had the largest VAT?

### Sales Performance

- What branch sold more products than the average quantity sold?
- What is the most common product line by gender?
- What is the average rating of each product line?
- For each product line, categorize sales as "Good" or "Bad" based on whether it's greater than the average sales.

## Requirements

- SQL Database
- Appropriate SQL client (e.g., MySQL Workbench, DBeaver)

## Usage

1. Download the `walmartsalesdata.csv` dataset.
2. Import the dataset into your SQL database.
3. Execute the SQL queries provided in the `walmart_sales_analysis.sql` file for feature engineering and exploratory data analysis.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Data Source: Walmart Sales Dataset
- Inspiration: [Include any references or inspiration for your project.]

Feel free to customize this template based on your specific project details and preferences. Make sure to replace placeholders like `your-username` with your actual GitHub username.
