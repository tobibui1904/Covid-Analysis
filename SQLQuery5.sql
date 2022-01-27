/* Stats about the death due to Covid in all countries each day */

select cast(date as date) as Date ,sum(new_cases) as Total_Cases,sum(cast(new_deaths as int)) as Total_Deaths,sum(cast(new_deaths as int))/sum(new_cases)*100 as Death_Percentage
from [Portfolio Project]..['covid deaths']
where continent is not null
and new_deaths is not null
group by date
order by date asc