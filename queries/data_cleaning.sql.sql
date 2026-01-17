-- DATA CLEANING

select *
from layoffs_staging2;

-- Standardizing data

select *
from layoffs_staging2;

select distinct country, TRIM(TRAILING '.' from country)
from layoffs_staging2
;

update layoffs_staging2
set country = TRIM(TRAILING '.' from country)
where country like 'United States%';


select `date`
from layoffs_staging2
;


update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');

alter table layoffs_staging2
modify column `date` date;

select *
from layoffs_staging2
where total_laid_off  is null
and percentage_laid_off is null
;
 
 update layoffs_staging2
 set industry = null
 where industry = ''
 ;
 
select *
from layoffs_staging2
where industry is null 
or industry = '' 
;


select *
from layoffs_staging2
where company like 'Bally%'
;

select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company = t2.company
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

UPDATE layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company = t2.company
set	t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;


select *
from layoffs_staging2
where total_laid_off  is null
and percentage_laid_off is null
; 

delete
from layoffs_staging2
where total_laid_off  is null
and percentage_laid_off is null
; 


select *
from layoffs_staging2;










