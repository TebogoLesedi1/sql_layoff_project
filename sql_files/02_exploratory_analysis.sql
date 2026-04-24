--EXPLORATORY DATA ANALYSIS

SELECT *
FROM [raw_layoff_data].[dbo].[layoffs_staging]
ORDER BY company;

-- View the highest number of layoffs and maximum percentage to understand the scale of the impact
SELECT MAX(total_laid_off) AS 'MAX_total_laid_off',
MAX(percentage_laid_off) AS 'MAX_percentage_laid_off'
FROM [raw_layoff_data].[dbo].[layoffs_staging];

-- Identify companies that laid off their entire workforce, ordered by funds raised to see high-value failures
SELECT *
FROM [raw_layoff_data].[dbo].[layoffs_staging]
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;
;

-- Aggregate total layoffs to identify which companies, industries, and nations were most affected
SELECT company, SUM(total_laid_off) AS SUM_total_laid_off
FROM [raw_layoff_data].[dbo].[layoffs_staging]
GROUP BY company
ORDER BY 2 Desc;

SELECT industry, SUM(total_laid_off) AS SUM_total_laid_off
FROM [raw_layoff_data].[dbo].[layoffs_staging]
GROUP BY industry
ORDER BY 2 Desc;

SELECT country, SUM(total_laid_off) AS SUM_total_laid_off
FROM [raw_layoff_data].[dbo].[layoffs_staging]
GROUP BY country
ORDER BY 2 Desc;

-- Analyze the progression of layoffs year-over-year to identify economic trends
SELECT MIN(layoff_date) AS MIN_layoff_date, 
MAX(layoff_date) AS MAX_layoff_date
FROM [raw_layoff_data].[dbo].[layoffs_staging];



SELECT YEAR( layoff_date) as 'YEAR', SUM(total_laid_off) AS SUM_total_laid_off
FROM [raw_layoff_data].[dbo].[layoffs_staging]
GROUP BY YEAR( layoff_date)
ORDER BY 1 Desc;

-- Evaluate how a company's funding stage (e.g., Post-IPO, Series C) correlates with layoff volume
SELECT stage, SUM(total_laid_off) AS SUM_total_laid_off
FROM [raw_layoff_data].[dbo].[layoffs_staging]
GROUP BY stage
ORDER BY 2 Desc;

-- Calculating the rolling total of layoffs per month to visualize the cumulative impact over time
-- Using a Window Function (SUM OVER) to create a running sum based on the chronological month
SELECT 
    SUBSTRING(CONVERT(VARCHAR, layoff_date, 120), 1, 7) AS [Month], 
    SUM(total_laid_off) AS monthly_total,
    SUM(SUM(total_laid_off)) OVER(ORDER BY SUBSTRING(CONVERT(VARCHAR, layoff_date, 120), 1, 7)) AS rolling_total
FROM layoffs_staging
WHERE layoff_date IS NOT NULL
GROUP BY SUBSTRING(CONVERT(VARCHAR, layoff_date, 120), 1, 7)
ORDER BY 1 ASC;



