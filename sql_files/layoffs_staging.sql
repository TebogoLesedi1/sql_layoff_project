--DATA CLEANING

--create the staging table
select * 
INTO layoffs_staging
from layoffs_clean
where 1=0;

--insert the data
insert INTO layoffs_staging
select *
from layoffs_clean;

--1. try ID duplicates if row_num is 2 or more there is duplicates
select *, 
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, 'date'
ORDER BY company) AS row_num
from layoffs_staging;

----create a CTE
--WITH duplicates_cte AS
--(
--select *, 
--ROW_NUMBER() OVER(
--PARTITION BY company,'location', industry, total_laid_off, percentage_laid_off, 'date',
--stage, country, funds_raised_millions
--ORDER BY company) AS row_num
--from layoffs_staging
--)
--SELECT * 
--FROM duplicates_cte
--WHERE row_num > 1;

--remove duplicates
WITH duplicates_cte AS
(
select *, 
ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, layoff_date,
stage, country, funds_raised_millions
ORDER BY company) AS row_num
from layoffs_staging
)
--This line deletes the duplicates directly from layoffs_staging 
DELETE FROM duplicates_cte
WHERE row_num > 1;


select *
from layoffs_staging
;

-- Standardizing data
--triming company names(removing accidental spaces).
select company,TRIM(company)
from layoffs_staging
;

UPDATE layoffs_staging
SET company = TRIM(company);

--updating industry names
select DISTINCT(industry)
from layoffs_staging
WHERE industry LIKE 'Crypto%'
;

UPDATE layoffs_staging
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%'
;

--fixing country names
select DISTINCT(country), TRIM(TRAILING '.' FROM country)
from layoffs_staging
ORDER BY 1;

UPDATE layoffs_staging
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%'
;

--looking for nulls
select *
from layoffs_staging
where total_laid_off IS NULL
AND percentage_laid_off IS NULL
;


select *
from layoffs_staging
where industry IS NULL
OR industry = ''
;

select *
from layoffs_staging
where company = 'Airbnb'
;
--using self joins to fill in missing values based on matching data

select *
from layoffs_staging t1
JOIN layoffs_staging t2
ON t1.company = t2.company
AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL

UPDATE  t1
SET t1.industry = t2.industry
from layoffs_staging t1
JOIN layoffs_staging t2
ON t1.company = t2.company
AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

--checking if there is still missing values
select t1.company, t1.location, t1.industry, t2.industry
from layoffs_staging t1
JOIN layoffs_staging t2
ON t1.company = t2.company
AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL

select *
from layoffs_staging
where company = 'Airbnb'
;

--removing columns and 

DELETE
from layoffs_staging
where total_laid_off IS NULL
AND percentage_laid_off IS NULL
;

--check if they got deleted
select *
from layoffs_staging
;

