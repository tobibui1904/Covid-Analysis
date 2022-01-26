/*the death percentage globally */

select distinct sum(population) as Population,sum(cast(total_deaths as float)) as Highest_Death_count, sum(cast(new_deaths as float))/sum(new_cases)*100 as Death_Percentage,cast((sum(total_cases)/sum(population)*100) as float)as Infected_Percentage,
CASE
    WHEN continent is Null THEN 'World'
    ELSE continent
END as Continent
from [Portfolio Project]..['covid deaths']
WHERE continent='Asia'
or continent='Africa'
or continent='Europe'
or continent='North America'
or continent='Oceania'
or continent='South America'
or continent is Null
group by continent
order by Highest_Death_count desc 










