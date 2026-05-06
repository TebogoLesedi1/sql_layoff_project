# 📊 Global Layoffs: End-to-End Data Pipeline

Engineered a comprehensive data pipeline to analyze global tech layoffs from 2020 to 2023. This project transforms raw, unstructured data into a scalable analytical solution, delivering actionable insights into workforce reduction trends across industries, regions, and funding stages.

---

## 🎯 Project Highlights

- **Total Layoffs Analyzed:** 383K+ employees
- **Companies Impacted:** 2,000+
- **Average Layoff Rate:** 25.82%
- **Time Period:** 2020–2023
- **Data Architecture:** Star Schema design for optimized analytics

---

## 🛠️ Data Engineering Pipeline (ETL)

Built using **SQL Server (T-SQL)** with a structured ETL workflow:

### 1️⃣ Data Cleaning
- Removed duplicates using CTEs and ROW_NUMBER()
- Ensured data integrity across records
- Validated and cleaned company and industry identifiers

### 2️⃣ Data Standardization
- Resolved inconsistencies in company and industry naming conventions
- Handled null values in critical fields (total_laid_off, percentage_laid_off)
- Standardized date formats across datasets

### 3️⃣ Data Transformation
- Converted text-based dates into SQL DATE format
- Modeled data into Star Schema (Fact and Dimension tables)
- Created dimension tables for companies, industries, and locations

### 4️⃣ Exploratory Data Analysis (EDA)
- Identified top companies by layoffs per year using DENSE_RANK()
- Analyzed trends across time, industry, and geography
- Calculated cumulative layoff metrics and funding stage comparisons

---

## 🧭 Data Architecture & Flow

```
Raw Data (CSV)
    ↓
SQL Server (Staging)
    ↓
Data Cleaning & Validation
    ↓
Data Transformation (Star Schema)
    ↓
Power BI (Import Mode)
    ↓
Interactive Dashboards & KPIs
```

**Key Process Steps:**
1. **Extraction:** Raw layoff data ingested into SQL Server staging environment
2. **Transformation:** T-SQL scripts applied for cleaning, deduplication, and schema modeling
3. **Loading:** Transformed data connected to Power BI using Import Mode for optimized performance
4. **Visualization:** DAX measures created to calculate dynamic KPIs and enable interactivity

---

## 📈 Power BI Dashboard

### Page 1: Executive Summary
![Executive Summary](https://github.com/TebogoLesedi1/sql_layoff_project/blob/main/images/overview.png?raw=true)

**Key Metrics:**
- Total layoffs and affected companies
- Average layoff rate across all records
- Year-over-year comparison trends

**Visualizations:**
- Time-series trend of layoffs (2020–2023)
- Geographic distribution heatmap
- Year-over-year performance indicators

### Page 2: Industry & Funding Deep Dive
![Industry Analysis](https://github.com/TebogoLesedi1/sql_layoff_project/blob/main/images/deep_dive.png?raw=true)

**Sector Analysis:**
- Top industries impacted: Retail, Consumer, Transportation, Finance, IT
- Layoff patterns by industry maturity

**Funding Insights:**
- Comparison of layoffs across funding stages (Post-IPO vs. Early-stage startups)
- Impact correlation with company growth stage

**Interactivity:**
- Dynamic slicers for global-to-local analysis
- Filter by year, company, location, and funding stage

---

## 💡 Key Insights & Analytical Approach

- **Impact Intensity:** Used percentage laid off to measure impact across companies of different sizes
- **Company Maturity:** Identified stronger layoff patterns in mature (Post-IPO) companies
- **Trends:** Discovered significant correlation between market conditions and layoff waves
- **Multi-Dimensional Analysis:** Enabled analysis across time, geography, industry, and funding stage

---

## ⚙️ Scalability & Design

- **Star Schema Architecture:** Efficient querying and reporting capabilities
- **Modular SQL Scripts:** Organized for easy maintenance and updates
- **Extensibility:** Designed to support additional regional datasets and time periods without schema changes
- **Performance Optimized:** Indexed dimension tables for fast aggregations

---

## 📂 Repository Structure

```
sql_layoff_project/
├── sql_files/                          # SQL scripts for ETL pipeline
│   ├── 01_data_cleaning.sql           # Initial data validation and cleaning
│   ├── 02_exploratory_analysis.sql    # EDA queries and business insights
│   ├── dbo_layoffs.sql                # Staging table creation
│   └── layoff_clean.sql               # Transformation to cleaned dataset
│
├── powerbi_dashboard/                  # Power BI analytics
│   └── Global_Layoffs_Analysis_2020_2023.pbix  # Interactive dashboard
│
├── raw_layoff_data/                    # Source data
│   └── layoffs.csv                    # Raw layoff dataset
│
├── images/                             # Dashboard screenshots
│   ├── overview.png                   # Executive summary visualization
│   └── deep_dive.png                  # Industry analysis visualization
│
└── README.md                           # Project documentation
```

---

## 🧰 Tools & Technologies

| Tool | Purpose |
|------|---------|
| **SQL Server (T-SQL)** | Data cleaning, transformation, and EDA |
| **Power BI** | Interactive dashboards and analytics |
| **Git/GitHub** | Version control and project management |

---

## ▶️ How to Run the Project

### Prerequisites
- SQL Server (2016 or later)
- Power BI Desktop
- Git (for cloning)

### Step-by-Step Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/TebogoLesedi1/sql_layoff_project.git
   cd sql_layoff_project
   ```

2. **Set up SQL Server**
   - Execute the SQL scripts in the `sql_files/` folder on your SQL Server instance
   - Run scripts in order: `dbo_layoffs.sql` → `01_data_cleaning.sql` → `02_exploratory_analysis.sql`

3. **Connect Power BI**
   - Open `powerbi_dashboard/Global_Layoffs_Analysis_2020_2023.pbix` in Power BI Desktop
   - Go to **Power BI Settings** → **Data Source Settings**
   - Update the SQL Server connection to your local instance

4. **Refresh & Explore**
   - Refresh the dataset to load the processed data
   - Interact with slicers and visualizations to explore trends

---

## 📊 SQL Scripts Breakdown

### 01_data_cleaning.sql
Handles data quality issues:
- Removes duplicate records
- Standardizes text formatting
- Resolves missing values
- Validates data types

### 02_exploratory_analysis.sql
Generates business insights:
- Top companies by layoffs
- Industry trend analysis
- Geographic breakdown
- Funding stage comparisons

### dbo_layoffs.sql
Creates the staging table schema

### layoff_clean.sql
Transforms staging data into the cleaned dataset

---

## 🔍 Sample Queries & Questions Answered

The SQL scripts answer key business questions:
- Which companies had the largest layoffs?
- How did layoffs trend over 2020-2023?
- Which industries were most affected?
- What was the impact across different funding stages?
- Which countries/regions experienced the most layoffs?

---

## 📝 Data Dictionary

| Column | Description |
|--------|-------------|
| **company** | Company name |
| **location** | City/Country of headquarters |
| **industry** | Business sector |
| **total_laid_off** | Number of employees laid off |
| **percentage_laid_off** | Percentage of workforce affected |
| **date** | Date of layoff announcement |
| **stage** | Funding stage (e.g., Post-IPO, Seed, Series A) |

---

## 🎓 Learning Outcomes

This project demonstrates:
- ✅ End-to-end data pipeline design
- ✅ Advanced SQL techniques (CTEs, Window Functions, Aggregations)
- ✅ Data modeling and Star Schema architecture
- ✅ ETL best practices
- ✅ Business intelligence and dashboarding
- ✅ Data-driven insights generation

---

## 📧 Contact & Questions

For questions or collaboration, feel free to reach out or open an issue in this repository.

---

**Last Updated:** May 2026 | **Status:** Active Development
