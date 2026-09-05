select *
from layoffs;
#remove duplicate
#standardize data
#check null values
# remove columns

# duplicate removal
create table layoffs2
select *
from layoffs;
select *
from layoffs2;
select *, row_number()over(partition by company, location, industry, 
total_laid_off,percentage_laid_off, 
`date`, stage, country,funds_raised_millions) as RN
from layoffs2;
with kk as (select *, row_number()over(partition by company, location, industry, 
total_laid_off,percentage_laid_off, 
`date`, stage, country,funds_raised_millions) as RN
from layoffs2)
select *
from kk where RN >1;

CREATE TABLE `layoffs3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `RN` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs3;
insert into layoffs3
select *, row_number()over(partition by company, location, industry, 
total_laid_off,percentage_laid_off, 
`date`, stage, country,funds_raised_millions) as RN
from layoffs2;

select *
from layoffs3;
delete
from layoffs3
where RN >1;
select *
from layoffs3;

#standard data
select company, trim(company)
from layoffs3;
update layoffs3
set company = trim(company);
select distinct industry
from layoffs
where industry like 'crypto%';
update layoffs3
set industry ='crypto'
where industry like 'crypto%';
select  *
from layoffs3 
where industry like 'cryp%'
order by industry;
select distinct country
from layoffs3
where country like 'united sta%';
update layoffs3
set country = 'United States'
where country like 'united sta%';

select distinct country
from layoffs3 order by 1;

select *
from layoffs3;
# date formating
select `date`, str_to_date(`date`,'%m/%d/%Y') 
from layoffs3;
update layoffs3
set `date`= str_to_date(`date`,'%m/%d/%Y') ;
select *
from layoffs3;
alter table layoffs3
modify column `date`date;

# null or blank rows
select *
from layoffs3
where total_laid_off is null
and percentage_laid_off is null;

delete
from layoffs3
where total_laid_off is null
and percentage_laid_off is null;
select *
from layoffs3;

# drop not needed column

alter table layoffs3
drop column RN;

SELECT *
from layoffs3;














