-- TEMP TABLE

Drop Table if exists #Percent_Population_Vaccinated
create Table #Percent_Population_Vaccinated
(
continent nvarchar(255),
location nvarchar(255),
Date date,
population numeric,
new_vaccinations numeric,
Rolling_People_Vaccinated numeric
)
insert into #Percent_Population_Vaccinated
select dea.continent,dea.location,dea.date,dea.population,vax.new_vaccinations,sum(cast(vax.new_vaccinations as float)) over(partition by dea.location order by dea.location,dea.date) as Rolling_People_Vaccinated
from [Portfolio Project]..['covid deaths'] as dea
inner join [Portfolio Project]..['covid vaccination'] as vax
	on dea.location=vax.location
	and dea.date=vax.date
where dea.continent is not null

select *,(Rolling_People_Vaccinated/population)*100 as Vaccination_Rate
from #Percent_Population_Vaccinated
where Rolling_People_Vaccinated is not null
and new_vaccinations is not null

create View PercentPopulationVaccinated as
select dea.continent,dea.location,dea.date,dea.population,vax.new_vaccinations,sum(cast(vax.new_vaccinations as float)) over(partition by dea.location order by dea.location,dea.date) as Rolling_People_Vaccinated
from [Portfolio Project]..['covid deaths'] as dea
inner join [Portfolio Project]..['covid vaccination'] as vax
	on dea.location=vax.location
	and dea.date=vax.date
where dea.continent is not null

select *
from PercentPopulationVaccinated
where Rolling_People_Vaccinated is not null
and new_vaccinations is not null