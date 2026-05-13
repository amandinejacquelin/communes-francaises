select 
    pop.year,
    m.region_id,
    sum(pop.municipality_population) as region_population
from {{ ref('fct_population_municipality') }} pop
join {{ ref('dim_municipalities') }} m
    on pop.municipality_id = m.municipality_id
group by m.region_id, pop.year
order by m.region_id, pop.year