select dea.continent,dea.location,dea.date,dea.population,vax.new_vaccinations
from [Portfolio Project]..['covid deaths'] as dea
inner join [Portfolio Project]..['covid vaccination'] as vax
	on dea.location=vax.location
	and dea.date=vax.date
where dea.continent is not null
order by 1,2,3