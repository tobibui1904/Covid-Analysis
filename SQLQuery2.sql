/* Stats about the death due to Covid in each country */

select location, max(cast(Total_deaths as int)) as Highest_Death_count,max(cast((total_cases/population*100) as int))as Infected_Percentage,max(cast((total_deaths/total_cases*100) as int))as Death_Percentage
from [Portfolio Project]..['covid deaths']
where continent is not null
group by location
order by Highest_Death_count desc 



