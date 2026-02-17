# Data-Driven Customer Segmentation via MySQL Spend Quantiles

## Overview
This project demonstrates an end-to-end data analysis workflow to segment customers based on their purchasing behavior using MySQL. Customer and order data were stored in a relational database, and SQL queries were used to calculate key metrics such as total spending and order frequency per customer.

Customers were segmented into Bronze, Silver, and Gold tiers using spend quantiles implemented through SQL window functions (NTILE). The project also includes summary analysis of segment sizes and average performance metrics.

## Objectives
- Import CSV data into MySQL tables
- Calculate customer-level metrics (total spend and order count)
- Segment customers into tiers using spend quantiles
- Analyze segment sizes and average metrics
- Export segmentation results to CSV

## Tools & Technologies
- MySQL
- MySQL Workbench
- SQL (Joins, Aggregations, Window Functions)
- CSV datasets

## Dataset
The project uses two datasets:
- customers.csv — customer information
- orders.csv — transaction data

## Key SQL Concepts Used
- Joins
- Aggregations (SUM, COUNT, AVG)
- Window Functions (NTILE)
- CASE statements
- Common Table Expressions (CTE)

## Output
The final output includes:
- Customer segmentation table
- Summary metrics per segment
- Exported CSV file (customer_segments.csv)

## Project Structure
- customer_segmentation/
- │── customer_segmentation.sql
- │── customers.csv
- │── orders.csv
- │── customer_segments.csv
- │── screenshots/


## Results
Customers were successfully categorized into Bronze, Silver, and Gold tiers based on spending behavior, enabling better business insights and potential marketing strategies.

## Author
Mohit 
AI & DS Department 
East Point College of Engineering
