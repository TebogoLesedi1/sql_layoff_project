📊 Global Tech Layoffs: End-to-End Data Pipeline


🚀 Project Overview


Engineered an end-to-end data pipeline to analyze global tech layoffs from 2020 to 2023, transforming raw, unstructured data into a scalable Star Schema for analytics.
The solution delivers insights into workforce reduction trends across industries, geographic regions, and funding stages, enabling a structured view of market volatility.


🛠️ Data Engineering Pipeline (ETL)
Built using SQL Server (T-SQL) with a structured ETL workflow:


Data Cleaning


Removed duplicates using CTEs and ROW_NUMBER()

Ensured data integrity across records


Data Standardization


Resolved inconsistencies in company and industry naming

Handled null values in key fields such as total_laid_off


Data Transformation


Converted text-based dates into DATE format
Modeled data into a Star Schema (Fact and Dimension tables)

Exploratory Data Analysis (EDA)

Identified top companies by layoffs per year using DENSE_RANK()

Analyzed trends across time, industry, and geography


🧭 Data Architecture & Flow


Extraction: Raw layoff data ingested into a SQL Server staging environment

Transformation: T-SQL scripts applied for cleaning, deduplication, and schema modeling
Loading: Transformed data connected to Power BI using Import Mode for optimized performance

Visualization: DAX measures created to calculate dynamic KPIs and enable interactivity


📈 Power BI Dashboard


🔹 Executive Summary (Page 1)

(Insert your dashboard image below)
Markdown
![Executive Summary](images/executive_summary.png)

KPIs:
Total Layoffs: 383K
Companies Impacted: 2K
Average Layoff Rate: 25.82%

Insights:
Time-series trend of layoffs (2020–2023)
Geographic distribution of layoffs


🔹 Industry & Funding Deep Dive (Page 2)

(Insert your dashboard image below)
Markdown

![Industry Analysis](images/industry_analysis.png)

Sector Analysis:
Top industries affected: Retail, Consumer, Transportation

Funding Insights:
Comparison of layoffs across funding stages (Post-IPO vs startups)

Interactivity:
Slicers enable global-to-local analysis


💡 Key Insights & Analytical Approach


Used percentage laid off to measure impact intensity across companies of different sizes

Identified stronger layoff patterns in mature (Post-IPO) companies

Enabled multi-dimensional analysis across time, geography, and industry


⚙️ Scalability & Design


Implemented a Star Schema for efficient querying and reporting

Designed to support additional regional datasets without schema changes


🧰 Tools & Technologies


SQL Server (T-SQL)

Power BI

git vision control 


▶️ How to Run the Project


Execute the SQL scripts in the SQL_Scripts/
folder on a SQL Server instance 

Open the .pbix file in Power BI Desktop

Update the data source settings to connect to your local SQL Server instance

Refresh the dataset to load the processed data


📂 Repository Structure

├── SQL_Scripts/           # Data cleaning and transformation queries
  
├── PowerBI_Dashboard/     # Power BI (.pbix) file  

├── Data/                  # Raw and processed datasets

├── images/                # Dashboard screenshots 

└── README.md              # Project documentation
