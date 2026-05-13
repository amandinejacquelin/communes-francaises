select 
    m.department_id,
    sum(i.municipality_median_income * p.municipality_population) / sum(p.municipality_population) as department_average_income_estimated
from {{ ref('fct_income_municipality_snapshot') }} i
join {{ ref('fct_population_municipality_snapshot') }} p on i.municipality_id = p.municipality_id
join {{ ref('dim_municipalities') }} m on i.municipality_id = m.municipality_id
group by m.department_id