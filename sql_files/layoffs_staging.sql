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


