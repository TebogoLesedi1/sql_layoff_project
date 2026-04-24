​📊 World Layoffs Data Cleaning & Analysis


​Project Overview


​This project involves a comprehensive data cleaning and exploratory data analysis (EDA) of a global layoffs dataset. The goal was to transform raw, inconsistent data into a structured format suitable for analysis to uncover trends in the global job market.


​Technical Stack

​Database: Microsoft SQL Server (SSMS)

​Language: T-SQL

​Version Control: Git/GitHub


​Key Cleaning Steps

​Staging: Migrated raw data into a staging table to preserve original data integrity.

​Duplicate Removal: Leveraged Window Functions (ROW_NUMBER) and Updatable CTEs to identify and delete duplicate records.

​Standardization: * Cleaned string inconsistencies using TRIM.

​Standardized industry and country naming conventions.

​Converted date strings into proper DATE types for time-series analysis.

​Null Handling: Used Self-Joins to populate missing values based on matching company and location data.

​Optimization: Removed uninformative records with null values across critical layoff metrics.


​Project Structure

​01_data_cleaning.sql: Full script for the data transformation process.

​02_eda_analysis.sql: (Coming Soon) Exploratory queries focusing on layoff trends by industry, geography, and timeline.# sql_layoff_project