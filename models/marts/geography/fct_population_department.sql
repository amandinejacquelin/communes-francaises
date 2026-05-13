select 
    pop.year,
    m.department_id,
    sum(pop.municipality_population) as department_population
from {{ ref('fct_population_municipality') }} pop
join {{ ref('dim_municipalities') }} m
    on pop.municipality_id = m.municipality_id
group by m.department_id, pop.year
order by m.department_id, pop.year