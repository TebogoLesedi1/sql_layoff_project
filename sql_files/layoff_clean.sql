SELECT 
    company,
    location,
    industry,
    TRY_CAST(total_laid_off AS INT) AS total_laid_off,
    TRY_CAST(percentage_laid_off AS FLOAT) AS percentage_laid_off,
    TRY_CAST([date] AS DATE) AS layoff_date,
    stage,
    country,
    TRY_CAST(funds_raised_millions AS INT) AS funds_raised_millions
INTO layoffs_clean
FROM [raw_layoff_data].[dbo].[layoffs];

-- Check the new table's structure
EXEC sp_help 'layoffs_clean';

-- Preview the data
SELECT TOP 10 * FROM layoffs_clean;

UPDATE layoffs_clean 
SET industry = NULL 
WHERE industry = 'NULL';