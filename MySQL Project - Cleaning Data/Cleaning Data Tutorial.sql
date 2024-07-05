-- Data Cleaning

SELECT *
FROM layoffs; 

-- First Step: Remove Duplicates
-- Second Step: Standardized the Data
-- Third Step: Check Null Values / Blank Values
-- Fourth Step: Remove Columns and Rows that aren't Necessary
		-- Create a staging or raw data set to not mess up
        
CREATE TABLE layoffs_staging 
LIKE layoffs;

SELECT *
FROM layoffs_staging; 

INSERT layoffs_staging
SELECT * 
FROM layoffs;

-- Removing Duplicates 
-- if row_num is two or above, it means that it has duplicates 

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging; 

-- Create CTE
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM layoffs_staging
WHERE company = 'Casper';

-- Delete statement is not applicable in CTE

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
DELETE 
FROM duplicate_cte
WHERE row_num > 1;


CREATE TABLE `layoffs_staging3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging3 
WHERE row_num > 1; 

INSERT INTO layoffs_staging3
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;
 
DELETE
FROM layoffs_staging3
WHERE row_num > 1; 

SELECT *
FROM layoffs_staging3
WHERE row_num > 1;

SELECT *
FROM layoffs_staging3;

-- Standardizing Data 

-- Trim takes the whitespace out
SELECT company, TRIM(company)
FROM layoffs_staging3; 

UPDATE layoffs_staging3
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging3
ORDER BY 1;

-- Group Crypto and Cryto Currency Together, and same goes for others

SELECT *
FROM layoffs_staging3
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging3
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%'; 

SELECT DISTINCT industry
FROM layoffs_staging3
ORDER BY 1;

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging3
ORDER BY 1;

-- alternative solution
UPDATE layoffs_staging3
SET country = 'United States'
WHERE country LIKE 'United States%'; 

UPDATE layoffs_staging3
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT DISTINCT country
FROM layoffs_staging3
ORDER BY 1;

-- Changing the date as date data type
SELECT `date`
FROM layoffs_staging3;

UPDATE layoffs_staging3
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging3
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_staging3;

-- Removing Nulls annd Blank Values

-- cannot be = to null, need is null
SELECT *
FROM layoffs_staging3
WHERE total_laid_off IS NULL;

-- might be useless 
SELECT *
FROM layoffs_staging3
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL; 

SELECT *
FROM layoffs_staging3
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging3
WHERE company = 'Airbnb';

-- calling it t1 and t2, updating a nonblank one
-- checking the blank industry and those with named industry in order to populate the blank

SELECT *
FROM layoffs_staging3 t1
JOIN layoffs_staging3 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL or t1.industry = '')
AND t2.industry IS NOT NULL; 

UPDATE layoffs_staging3 t1
JOIN layoffs_staging3 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL or t1.industry = '')
AND t2.industry IS NOT NULL; 

-- trying to put null into blank
UPDATE layoffs_staging3
SET industry = NULL 
WHERE industry = '';

UPDATE layoffs_staging3 t1
JOIN layoffs_staging3 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL)
AND t2.industry IS NOT NULL; 

-- don't have prior knowledge on what industry this is 
SELECT *
FROM layoffs_staging3
WHERE company LIKE 'Bally%';

-- some cannot be populated since we do not know any prior data 

-- Removing columns and rows that aren't necessary

SELECT *
FROM layoffs_staging3
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL; 

DELETE
FROM layoffs_staging3
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL; 

SELECT *
FROM layoffs_staging3;

-- dropping a column
ALTER TABLE layoffs_staging3
DROP COLUMN row_num;

SELECT *
FROM layoffs_staging3;
